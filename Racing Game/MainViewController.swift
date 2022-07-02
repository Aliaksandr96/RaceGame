//
//  MainViewController.swift
//  Racing Game
//
//  Created by Aliaksandr Hunko on 01/07/2022.
//

import UIKit

class MainViewController: UIViewController {
    
    // create button next screen
    var newGameBtn: UIButton = UIButton()
    var settingBtn: UIButton = UIButton()
    var recordsBtn: UIButton = UIButton()
    
    let widthBtn = 160
    let heightBtn = 80
    
    let xBtn = 0
    let yBtn = 0
    
    
    
    func creatNewButton(xBtn: CGFloat, yBtn: CGFloat, backgroundColor: UIColor, buttonTitle: String) -> UIButton {
        
        let newButton = UIButton()
        
        newButton.frame = CGRect(x: xBtn, y: yBtn, width: 150, height: 60)
        newButton.backgroundColor = backgroundColor
        newButton.clipsToBounds = true
        newButton.layer.cornerRadius = newButton.bounds.height / 2
        newButton.setTitle(buttonTitle, for: .normal)
        
        return newButton
    }

    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = .systemGray
        
        let xNewGameBtn = (Int(view.bounds.width) / 2) - (widthBtn / 2)
        let yNewGameBtn = (Int(view.bounds.height) / 2) - heightBtn
        
        newGameBtn = creatNewButton(xBtn: CGFloat(xNewGameBtn), yBtn: CGFloat(yNewGameBtn), backgroundColor: .systemYellow, buttonTitle: "New Game")
        newGameBtn.addTarget(self, action: #selector(showNewGameViewController), for: .touchUpInside )
        view.addSubview(newGameBtn)
        
        let xSettingBtn = (Int(view.bounds.width) / 2) - (widthBtn / 2)
        let ySettingBtn = (Int(view.bounds.height) / 2)
        
        settingBtn = creatNewButton(xBtn: CGFloat(xSettingBtn), yBtn: CGFloat(ySettingBtn), backgroundColor: .systemYellow, buttonTitle: "Setting")
        settingBtn.addTarget(self, action: #selector(showSettingViewController), for: .touchUpInside )
        view.addSubview(settingBtn)
        
        let xRecordsBtn = (Int(view.bounds.width) / 2) - (widthBtn / 2)
        let yRecordsBtn = (Int(view.bounds.height) / 2) + heightBtn
        
        recordsBtn = creatNewButton(xBtn: CGFloat(xRecordsBtn), yBtn: CGFloat(yRecordsBtn), backgroundColor: .systemYellow, buttonTitle: "Records")
        recordsBtn.addTarget(self, action: #selector(showRecordsViewController), for: .touchUpInside )
        view.addSubview(recordsBtn)
        
    }

    @objc func showNewGameViewController() {
        
        let viewController = NewGameViewController()
        navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    @objc func showSettingViewController() {
        
        let viewController = SettingViewController()
        navigationController?.pushViewController(viewController, animated: true)
  
    }
    
    @objc func showRecordsViewController() {
        
        let viewController = RecordsViewController()
        navigationController?.pushViewController(viewController, animated: true)
  
    }
}

