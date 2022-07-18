//
//  NewGameViewController.swift
//  Racing Game
//
//  Created by Aliaksandr Hunko on 01/07/2022.
//

import UIKit

class NewGameViewController: UIViewController {
    
    let BackgroundView = UIImageView()
    let CarView = UIImageView()
    let StoneView = UIImageView()
    
    let NavigationBar = UIView()
    
    let step: CGFloat = 50
    
    private var variable = Variables()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BackgroundView.bounds = view.bounds
        BackgroundView.center = view.center
        BackgroundView.image = UIImage(named: "Road")
        view.addSubview(BackgroundView)
        
        NavigationBar.frame = CGRect(x: 0, y: 0, width: view.bounds.maxX, height: view.bounds.maxY / 10)
        NavigationBar.backgroundColor = .systemGray3
        view.addSubview(NavigationBar)
        
        createCar()
        swipeCar()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        moveStone()
        
    }
    
    func createCar() {
        
        variable.widthCar = BackgroundView.bounds.width / 5
        variable.heightCar = variable.widthCar * 1.9
        
        variable.xCar = BackgroundView.bounds.maxX / 4 - variable.widthCar / 2
        variable.yCar = BackgroundView.bounds.maxY - variable.heightCar - variable.heightCar / 4
        
        CarView.frame = CGRect(x: variable.xCar, y: variable.yCar, width: variable.widthCar, height: variable.heightCar)
        CarView.image = UIImage(named: "Car")
        view.addSubview(CarView)
        
    }
    
    func createStone() {
        
        variable.widthStone = BackgroundView.bounds.width / 6
        variable.heightStone = BackgroundView.bounds.width / 8
        
        variable.xStone = CGFloat(Int.random(in: Int(BackgroundView.bounds.minX)...Int(BackgroundView.bounds.maxX) - Int(variable.widthStone * 1.5)))
        variable.yStone = view.bounds.minY
        
        StoneView.frame = CGRect(x: variable.xStone, y: variable.yStone, width: variable.widthCar, height: variable.heightStone)
        StoneView.image = UIImage(named: "Stone")
        BackgroundView.addSubview(StoneView)
        
    }
    
    func moveStone() {
        
        createStone()
        
        UIView.animate(withDuration: 1, delay: 0 , options: .curveLinear, animations: {
            
            self.StoneView.frame.origin.y = self.CarView.frame.origin.y - self.StoneView.bounds.height + 1
            
        }, completion: { _ in
            
            if self.StoneView.frame.intersects(self.CarView.frame) {
                
                self.alert()
                
            } else {
                
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: {
                    
                    self.StoneView.frame.origin.y = self.BackgroundView.frame.maxY
                    
                }, completion: { _ in
                    
                    self.moveStone()
                    
                })
            }
        })
    }
    
    func alert() {
        
        let alert = UIAlertController(title: "Game Over",message: "", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "New Game", style: .default) {
            _ in
            self.moveStone()
            
        })
        
        alert.addAction(UIAlertAction(title: "Quit", style: .default) {
            _ in
            self.navigationController?.popToRootViewController(animated: true)
            
        })
        
        self.present(alert, animated: true)
        
    }
    
    func swipeCar() {
        
        CarView.isUserInteractionEnabled = true
        
        let moveGesture = UIPanGestureRecognizer(target: self, action: #selector(moveCar(recognizer:)))
        CarView.addGestureRecognizer(moveGesture)
        
    }
    
    @objc func moveCar(recognizer: UIPanGestureRecognizer){
        
        if recognizer.state == .changed {
            
            let translation: CGPoint = recognizer.translation(in: self.view)
            CarView.center = CGPoint(x: CarView.center.x + translation.x, y: variable.yCar + variable.heightCar / 2)
            recognizer.setTranslation(CGPoint.zero, in: self.view)
            
            if CarView.frame.minX < view.frame.minX {
                
                CarView.frame = CGRect(x: view.frame.minX, y: variable.yCar, width: variable.widthCar, height: variable.heightCar)
                
            }
            
            if CarView.frame.maxX > view.frame.maxX {
                
                CarView.frame = CGRect(x: view.frame.maxX - variable.widthCar, y: variable.yCar, width: variable.widthCar , height: variable.heightCar)
                
            }
        }
    }
}

extension NewGameViewController {
    
    // MARK: VARIABLES
    
    private struct Variables {
        
        var widthCar = CGFloat()
        var heightCar = CGFloat()
        
        var xCar = CGFloat()
        var yCar = CGFloat()
        
        var widthStone = CGFloat()
        var heightStone = CGFloat()
        
        var xStone = CGFloat()
        var yStone = CGFloat()
        
        var GameOver = false
        
    }
}

