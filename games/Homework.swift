
import UIKit

class Homework: UIViewController {
    var circleView1: UIView!
    var squares: [UIView] = []
    let circleRadius: CGFloat = 50
    var circleView: UIView!
    var buttons: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(createCircleView))
        view.addGestureRecognizer(tapGesture)
         // рандомный шарик
        createCircleView()
        // рандомные квадратики
//       buttonSetup()
        // Управление кругом
//        circleConfigure()
    }
    
    //MARK: - Задание с квадратами
    func buttonSetup() {
        let button = UIButton(frame: CGRect(x: 120, y: 100, width: 150, height: 50))
        button.setTitle("Нажми на меня!", for: .normal)
        button.backgroundColor = UIColor.gray
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    @objc func buttonAction(sender: UIButton!) {
        removeSquares()
        createSquares()
    }
    
    func removeSquares() {
        for square in squares {
            square.removeFromSuperview()
        }
        squares.removeAll()
    }
    
    func createSquares() {
        let squareSide: CGFloat = 20
        let colors: [UIColor] = [.red, .green, .yellow, .gray , .black , .brown] // добавить цветов разных
        // увеличить количество квадратов
        for _ in 0..<100 {
            var intersects = false
            var attempts = 0
            
            var newSquare: UIView!
            repeat {
                attempts += 1
                
                if attempts > 100 {
                    break
                }
                
                let randomX = CGFloat.random(in: 0...(self.view.frame.width - squareSide))
                let randomY = CGFloat.random(in: 0...(self.view.frame.height - squareSide))
                let randomColor = colors.randomElement()!
                
                let squareFrame = CGRect(x: randomX, y: randomY, width: squareSide, height: squareSide)
                
                newSquare = UIView(frame: squareFrame)
                newSquare.backgroundColor = randomColor
                
                let buttonFrame = self.view.subviews.first(where: { $0 is UIButton })?.frame ?? CGRect.zero
                let buttonArea = buttonFrame.insetBy(dx: -20, dy: -20)
                
                intersects = squares.contains { $0.frame.intersects(squareFrame) } || buttonArea.intersects(squareFrame)
            } while intersects
            
            if !intersects {
                squares.append(newSquare)
                self.view.addSubview(newSquare)
            }
        }
    }
    
    //MARK: - Задание с кругом который надо двигать
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
    @objc func createCircleView() {
        let circleSize: CGFloat = 100
        let randomX = CGFloat.random(in: 0...(view.bounds.width - circleSize))
        let randomY = CGFloat.random(in: 0...(view.bounds.height - circleSize))
        circleView1?.removeFromSuperview()
        
        circleView1 = UIView(frame: CGRect(x: randomX, y: randomY, width: circleSize, height: circleSize))
        circleView1?.backgroundColor = UIColor.blue
        circleView1?.layer.cornerRadius = circleSize / 2
        if let circleView = circleView1{
            view.addSubview(circleView)
            
        }
    }
    
    @objc func circleTapped() {
        let circleSize: CGFloat = 100
        
        let randomX = CGFloat.random(in: 0...(view.bounds.width - circleSize))
        let randomY = CGFloat.random(in: 0...(view.bounds.height - circleSize))
        
        UIView.animate(withDuration: 0.3) {
            self.circleView1.frame = CGRect(x: randomX, y: randomY, width: circleSize, height: circleSize)
        }
    }
}
