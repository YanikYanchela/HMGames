
import UIKit

class ViewController: UIViewController {
    
 
    
    var circleView: UIView!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(createCircleView))
        view.addGestureRecognizer(tapGesture)

        createCircleView()
    }
    
    @objc func createCircleView() {
        let circleSize: CGFloat = 100
        let randomX = CGFloat.random(in: 0...(view.bounds.width - circleSize))
        let randomY = CGFloat.random(in: 0...(view.bounds.height - circleSize))
        circleView?.removeFromSuperview()
        
        circleView = UIView(frame: CGRect(x: randomX, y: randomY, width: circleSize, height: circleSize))
        circleView?.backgroundColor = UIColor.blue
        circleView?.layer.cornerRadius = circleSize / 2
        if let circleView = circleView{
            view.addSubview(circleView)
            
        }
    }
    
    @objc func circleTapped() {
        let circleSize: CGFloat = 100
        
        let randomX = CGFloat.random(in: 0...(view.bounds.width - circleSize))
        let randomY = CGFloat.random(in: 0...(view.bounds.height - circleSize))
        
        UIView.animate(withDuration: 0.3) {
            self.circleView.frame = CGRect(x: randomX, y: randomY, width: circleSize, height: circleSize)
        }
    }
    
   
}
