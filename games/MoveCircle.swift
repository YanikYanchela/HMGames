
import UIKit

class moveCircle: UIViewController {
    
  
    let circleRadius: CGFloat = 50
    var circleView: UIView!
    var buttons: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        circleConfigure()
        
        let backButton = UIButton(type: .system)
        backButton.setTitle("Назад", for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        backButton.frame = CGRect(x: 20, y: 40, width: 80, height: 40)
        view.addSubview(backButton)
        
    }
           @objc func backButtonTapped() {
               navigationController?.popViewController(animated: true)
           }

    
    

    func circleConfigure() {
        let circleOrigin = CGPoint(x: view.bounds.midX - circleRadius, y: view.bounds.midY - circleRadius)
        circleView = UIView(frame: CGRect(origin: circleOrigin, size: CGSize(width: circleRadius * 2, height: circleRadius * 2)))
        circleView.backgroundColor = UIColor.red
        circleView.layer.cornerRadius = circleRadius
        view.addSubview(circleView)
        
        let upButton = createButton(title: "Вверх", frame: CGRect(x: 30, y: 50, width: 80, height: 30))
        upButton.backgroundColor = UIColor.gray
        upButton.setTitleColor(.white, for: .normal)
        upButton.layer.cornerRadius = 8
        let downButton = createButton(title: "Вниз", frame: CGRect(x: 120, y: 50, width: 80, height: 30))
        downButton.backgroundColor = UIColor.gray
        downButton.setTitleColor(.white, for: .normal)
        downButton.layer.cornerRadius = 8
        let leftButton = createButton(title: "Влево", frame: CGRect(x: 210, y: 50, width: 80, height: 30))
        leftButton.backgroundColor = UIColor.gray
        leftButton.setTitleColor(.white, for: .normal)
        leftButton.layer.cornerRadius = 8
        let rightButton = createButton(title: "Вправо", frame: CGRect(x: 300, y: 50, width: 80, height: 30))
        rightButton.backgroundColor = UIColor.gray
        rightButton.setTitleColor(.white, for: .normal)
        rightButton.layer.cornerRadius = 8
        
        buttons = [upButton, downButton, leftButton, rightButton]
        
        for button in buttons {
            view.addSubview(button)
        }
    }
    
    func createButton(title: String, frame: CGRect) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.frame = frame
        button.addTarget(self, action: #selector(moveCircle(_:)), for: .touchUpInside)
        return button
    }
    
    @objc func moveCircle(_ sender: UIButton) {
        var newFrame = circleView.frame
        
        switch sender.titleLabel?.text {
        case "Вверх":
            newFrame.origin.y -= 10
        case "Вниз":
            newFrame.origin.y += 10
        case "Влево":
            newFrame.origin.x -= 10
        case "Вправо":
            newFrame.origin.x += 10
        default:
            break
        }
        
        if isFrameValid(newFrame) {
            UIView.animate(withDuration: 0.3) {
                self.circleView.frame = newFrame
            }
        }
    }
    
  
    func isFrameValid(_ frame: CGRect) -> Bool {
        if frame.minX < 0 || frame.minY < 0 || frame.maxX > view.bounds.width || frame.maxY > view.bounds.height {
            return false
        }
        // дописать самим чтобы кружок до края двигался
        
        for button in buttons {
            if frame.intersects(button.frame) {
                return false
            }
        }
        return true
    }
  
    
}
