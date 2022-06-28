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
        present(NewGameViewController,animated: true)
        NewGameViewController.modalPresentationStyle = .overFullScreen
       
        
    }
    
    @IBAction func RecordsBtn (_ sender: Any) {
        
        let RecordsStoryBoard = UIStoryboard(name: "Records", bundle: nil)
        let RecordsViewController = RecordsStoryBoard.instantiateViewController(withIdentifier: "RecordsStoryBoardID")
        present(RecordsViewController,animated: true)
        RecordsViewController.modalPresentationStyle = .overFullScreen
            
        
    }
    
    @IBAction func SettingsBtn (_ sender: Any) {
        
        let SettingsStoryBoard = UIStoryboard(name: "Settings", bundle: nil)
        let SettingsViewController = SettingsStoryBoard.instantiateViewController(withIdentifier: "SettingsStoryBoardID")
        present(SettingsViewController,animated: true)
        SettingsViewController.modalPresentationStyle = .overFullScreen
        
    }
    
}

