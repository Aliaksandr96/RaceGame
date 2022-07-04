//
//  SettingViewController.swift
//  Racing Game
//
//  Created by Aliaksandr Hunko on 01/07/2022.
//

import UIKit

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
   
        view.backgroundColor = .systemCyan
        title = "Setting"
        
        let swipeBackToMainSqreen = UISwipeGestureRecognizer(target: self, action: #selector(swipeBackSqreen))
        swipeBackToMainSqreen.direction = .right
        view.addGestureRecognizer(swipeBackToMainSqreen)

    }

    @objc func swipeBackSqreen() {
    
        navigationController?.popToRootViewController(animated: true)
        
    }
    
}
