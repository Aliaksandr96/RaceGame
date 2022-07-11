//
//  RecordsViewController.swift
//  Racing Game
//
//  Created by Aliaksandr Hunko on 01/07/2022.
//

import UIKit

class RecordsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
   
        view.backgroundColor = .systemCyan
        title = "Records"
        
        let swipeBacktoMainScreen = UISwipeGestureRecognizer(target: self, action: #selector(swipeBackSqreen))
        swipeBacktoMainScreen.direction = .right
        view.addGestureRecognizer(swipeBacktoMainScreen)

    }
    
    @objc func swipeBackSqreen() {
    
        navigationController?.popToRootViewController(animated: true)
        
    }
}
