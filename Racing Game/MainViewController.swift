//
//  MainViewController.swift
//  Racing Game
//
//  Created by Aliaksandr Hunko on 01/07/2022.
//

import UIKit

class MainViewController: UIViewController {
    
    let imageRoad = UIImage(named: "Road")
    let backgroundRoad = UIImageView()
    
    var newGameBtn: UIButton = UIButton()
    var settingBtn: UIButton = UIButton()
    var recordsBtn: UIButton = UIButton()
    
    let widthBtn:CGFloat = 150
    let heightBtn:CGFloat = 50
    let xBtn:CGFloat = 0
    let yBtn:CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundRoad.frame = view.frame
        backgroundRoad.image = imageRoad
        view.addSubview(backgroundRoad)
        
        // CREATE NEW GAME BUTTON
        
        let xNewGameBtn: CGFloat = view.bounds.width / 2 - widthBtn / 2
        let yNewGameBtn: CGFloat = view.bounds.height / 2 - (heightBtn * 2)
        
        newGameBtn = creatNewButton(xBtn: xNewGameBtn, yBtn: yNewGameBtn, buttonTitle: "New Game")
        newGameBtn.addTarget(self, action: #selector(showNewGameViewController), for: .touchUpInside )
        view.addSubview(newGameBtn)
        
        // CREATE SETTING BUTTON
        
        let xSettingBtn = view.bounds.width / 2 - widthBtn / 2
        let ySettingBtn = view.bounds.height / 2 - heightBtn + 10
        
        settingBtn = creatNewButton(xBtn: xSettingBtn, yBtn: ySettingBtn, buttonTitle: "Setting")
        settingBtn.addTarget(self, action: #selector(showSettingViewController), for: .touchUpInside )
        view.addSubview(settingBtn)
        
        // CREATE RECORDS BUTTON
        
        let xRecordsBtn = view.bounds.width / 2 - widthBtn / 2
        let yRecordsBtn = view.bounds.height / 2 + (heightBtn / 2) - (heightBtn / 4) + 10
        
        recordsBtn = creatNewButton(xBtn: xRecordsBtn, yBtn: yRecordsBtn, buttonTitle: "Records")
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

extension MainViewController {
    
    func creatNewButton(xBtn: CGFloat, yBtn: CGFloat, buttonTitle: String) -> UIButton {
        
        let newButton = UIButton()
        
        newButton.frame = CGRect(x: xBtn, y: yBtn, width: widthBtn, height: heightBtn)
        newButton.backgroundColor = .systemGray3
        newButton.layer.opacity = 0.75
        newButton.setTitleColor(.red, for: .normal)
        newButton.clipsToBounds = true
        newButton.layer.cornerRadius = newButton.bounds.height / 2
        newButton.layer.masksToBounds = false
        newButton.layer.shadowColor = UIColor.lightGray.cgColor
        newButton.layer.shadowOffset = .zero
        newButton.layer.shadowOpacity = 1
        newButton.layer.shadowRadius = newButton.bounds.height / 2
        newButton.setTitle(buttonTitle, for: .normal)
        
        return newButton
        
    }
    
}
