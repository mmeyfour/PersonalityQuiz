//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Mersad Meyfour Asadi on 08/10/2020.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        updateUI()
    }
    
    var state: State?
    
    func updateUI() {
        guard let state = state else {
            return
        }
        
        guard let winningAnimal = state.winningAnimal else {
            return
        } 
        //let winningAnimal = state.winningAnimal
        
        titleLabel.text = "you are a \(winningAnimal.rawValue)"
        subtitleLabel.text = winningAnimal.subtitle
        
        
    }

}
