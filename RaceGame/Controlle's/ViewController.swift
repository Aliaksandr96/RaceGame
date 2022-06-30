//
//  ViewController.swift
//  RaceGame
//
//  Created by Aliaksandr Hunko on 28/06/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func NewGameBtn(_ sender: Any) {
        
        let NewGameStoryBoard = UIStoryboard(name: "NewGame", bundle: nil)
        let NewGameViewController = NewGameStoryBoard.instantiateViewController(withIdentifier: "NewGameStoryBoardID")
       
        NewGameViewController.modalPresentationStyle = .overFullScreen
        NewGameViewController.modalTransitionStyle = .flipHorizontal
        present(NewGameViewController,animated: true)
        
    }
    
    @IBAction func RecordsBtn (_ sender: Any) {
        
        let RecordsStoryBoard = UIStoryboard(name: "Records", bundle: nil)
        let RecordsViewController = RecordsStoryBoard.instantiateViewController(withIdentifier: "RecordsStoryBoardID")
        RecordsViewController.modalPresentationStyle = .overFullScreen
        RecordsViewController.modalTransitionStyle = .flipHorizontal
        present(RecordsViewController,animated: true)
        
    }
    
    @IBAction func SettingsBtn (_ sender: Any) {
        
        let SettingsStoryBoard = UIStoryboard(name: "Settings", bundle: nil)
        let SettingsViewController = SettingsStoryBoard.instantiateViewController(withIdentifier: "SettingsStoryBoardID")
       
        SettingsViewController.modalPresentationStyle = .overFullScreen
        SettingsViewController.modalTransitionStyle = .flipHorizontal
        present(SettingsViewController,animated: true)
    }
    
}

