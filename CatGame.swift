//
//  CatGame.swift
//  games
//
//  Created by Дмитрий Яновский on 26.12.23.
//

import Foundation
import UIKit

class CatGame: UIViewController{
    
    var circleView1: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(createCircleView))
        view.addGestureRecognizer(tapGesture)
        
        createCircleView()
        
        let backButton = UIButton(type: .system)
        backButton.setTitle("Назад", for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        backButton.frame = CGRect(x: 20, y: 40, width: 80, height: 40)
        view.addSubview(backButton)
        
    }
           @objc func backButtonTapped() {
               navigationController?.popViewController(animated: true)
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
