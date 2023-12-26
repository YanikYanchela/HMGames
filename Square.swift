//
//  Square.swift
//  games
//
//  Created by Дмитрий Яновский on 26.12.23.
//

import Foundation
import UIKit

class Square: UIViewController {
    
    var squares: [UIView] = []
    var buttons: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonSetup()
        
        let backButton = UIButton(type: .system)
               backButton.setTitle("Назад", for: .normal)
               backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
               backButton.frame = CGRect(x: 20, y: 40, width: 80, height: 40)
               view.addSubview(backButton)
           }
           
           @objc func backButtonTapped() {
               navigationController?.popViewController(animated: true)
           }

           
    
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
}
