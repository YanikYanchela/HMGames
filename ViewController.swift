//
//  ViewController.swift
//  games
//
//  Created by Дмитрий Яновский on 26.12.23.
//

import Foundation
import UIKit


class viewController: UIViewController{
    
    
    @IBOutlet weak var catGame: UIButton!
    
    @IBAction func catGame(_ sender: Any) {
        //        let storyboard = UIStoryboard(name: "CatGame", bundle: nil)
        //        let secondVC: UIViewController = storyboard.instantiateViewController(withIdentifier: "CatGame") as! CatGame
        //        secondVC.modalPresentationStyle = .overFullScreen
        //
        //        if let navigationController = navigationController {
        //            navigationController.pushViewController(secondVC, animated: true)
        //        } else {
        //            let navController = UINavigationController(rootViewController: secondVC)
        //            navController.navigationBar.prefersLargeTitles = true
        //            present(navController, animated: true, completion: nil)
        //        }
        let storyboard = UIStoryboard(name: "CatGame", bundle: nil)
        let catGameVC = storyboard.instantiateViewController(withIdentifier: "CatGame") as! CatGame
        present(catGameVC, animated: true, completion: nil)
        
    }
    
    
    
    @IBOutlet weak var SquareGame: UIButton!
    
    
    @IBAction func SquareGame(_ sender: Any) {
        //        let storyboard = UIStoryboard(name: "SquareViewController", bundle: nil)
        //        let secondVC: UIViewController = storyboard.instantiateViewController(withIdentifier: "Square") as! Square
        //        secondVC.modalPresentationStyle = .overFullScreen
        //
        //        if let navigationController = navigationController {
        //            navigationController.pushViewController(secondVC, animated: true)
        //        } else {
        //            let navController = UINavigationController(rootViewController: secondVC)
        //            navController.navigationBar.prefersLargeTitles = true
        //            present(navController, animated: true, completion: nil)
        //        }
        let storyboard = UIStoryboard(name: "SquareViewController", bundle: nil)
        let catGameVC = storyboard.instantiateViewController(withIdentifier: "Square") as! Square
        present(catGameVC, animated: true, completion: nil)
        
    }
    
    
    
    
    @IBAction func moveCircles(_ sender: Any) {
        //        let storyboard = UIStoryboard(name: "moveCircleViewController", bundle: nil)
        //        let secondVC: UIViewController = storyboard.instantiateViewController(withIdentifier: "moveCircleViewController") as! moveCircle
        //        secondVC.modalPresentationStyle = .fullScreen
        //
        //        if let navigationController = navigationController {
        //            navigationController.pushViewController(secondVC, animated: true)
        //        } else {
        //            let navController = UINavigationController(rootViewController: secondVC)
        //            navController.navigationBar.prefersLargeTitles = true
        //            present(navController, animated: true, completion: nil)
        //        }
        let storyboard = UIStoryboard(name: "moveCircleViewController", bundle: nil)
        let catGameVC = storyboard.instantiateViewController(withIdentifier: "moveCircleViewController") as! moveCircle
        present(catGameVC, animated: true, completion: nil)
        
    }
    
    
    
    @IBOutlet weak var CarGame: UIButton!
    
    
    @IBAction func CarGame(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Car", bundle: nil)
        let secondVC: UIViewController = storyboard.instantiateViewController(withIdentifier: "carRace") as! carRace
        secondVC.modalPresentationStyle = .fullScreen
        
        if let navigationController = navigationController {
            navigationController.pushViewController(secondVC, animated: true)
        } else {
            let navController = UINavigationController(rootViewController: secondVC)
            navController.navigationBar.prefersLargeTitles = true
            present(navController, animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        
        
        
    }
}
