//
//  NewGameViewController.swift
//  Racing Game
//
//  Created by Aliaksandr Hunko on 01/07/2022.
//

import UIKit

class NewGameViewController: UIViewController {
    
    let RoadImage = UIImage(named: "Road")
    let CarImage = UIImage(named: "Car")
    let StoneImage = UIImage(named: "Stone")
    let RoadImageView = UIImageView()
    let CarImageView = UIImageView()
    var Stone1ImageView = UIImageView()
    
    
    
    let DownView = UIView()
    let UpView = UIView()
    
    let moveLeftBtn = UIButton()
    let moveRightBtn = UIButton()
    let moveLeftBtnIcon = UIImage(named: "LeftBtn")
    let moveRightBtnIcon = UIImage(named: "RightBtn")
    
    
    var xCar = 30
    var yCar = 0
     let widthCar = 120
    let heightCar = 120
    let step = 60
    var isGameOver = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "New Game"
        view.backgroundColor = .systemGray3
        
        // Road View
        
        RoadImageView.frame = CGRect(x: 0 , y: view.bounds.minY + view.frame.height / 8, width: view.bounds.maxX, height: view.bounds.maxY)
        RoadImageView.image = RoadImage
        
        // Car View
        
        CarImageView.frame = CGRect(x: xCar, y: Int(RoadImageView.bounds.maxY / 2) + heightCar + heightCar / 2 , width: widthCar, height: heightCar)
        CarImageView.image = CarImage
        
        // Stone
        
        Stone1ImageView.frame = CGRect(x: RoadImageView.bounds.width / 4, y: RoadImageView.bounds.minY - 40, width: 80, height: 80)
        Stone1ImageView.image = StoneImage
        
        
        RoadImageView.addSubview(CarImageView)
        RoadImageView.addSubview(Stone1ImageView)
        
        view.addSubview(RoadImageView)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(moveLeft))
        swipeLeft.direction = .left
        view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(moveRight))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)
        
    }
        
    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            
            moveBarrier()
            
        }
       
        
    
    
    @objc func moveLeft() {
        
        if xCar > Int(RoadImageView.bounds.minX) + 10  {
            
            xCar -= step
            
        }
        
        CarImageView.frame = CGRect(x: xCar, y: Int(RoadImageView.bounds.maxY / 2) + heightCar + heightCar / 2 , width: widthCar, height: heightCar)
        

        
    }
    
    @objc func moveRight() {
        
        if xCar < Int(RoadImageView.bounds.maxX) - 100 {
            
            xCar += step
            
        }
        
        CarImageView.frame = CGRect(x: xCar, y: Int(RoadImageView.bounds.maxY / 2) + heightCar + heightCar / 2 , width: widthCar, height: heightCar)
        
    }
    
    func moveBarrier() {
        
        
        Stone1ImageView.center.x = CGFloat(Int.random(in: 50 ..< Int(view.frame.width - 100)))
        Stone1ImageView.center.y = 0
        
        UIView.animate(
            withDuration: 3,
            delay: 0,
            options: .curveLinear
        ) {
            self.Stone1ImageView.frame.origin.y = self.CarImageView.frame.origin.y
        } completion: { _ in
            if self.CarImageView.frame.intersects(self.Stone1ImageView.frame) {
                self.isGameOver = true
                self.dismiss(animated: true)
            }
            
            else
            
            {
                UIView.animate(withDuration: 3, delay: 0, options: .curveLinear) {
                    self.Stone1ImageView.frame.origin.y = self.view.frame.maxY + 100
                    
                }
                
            completion: { _ in
                self.moveBarrier()
                
            }
            }
        }
    }
}


