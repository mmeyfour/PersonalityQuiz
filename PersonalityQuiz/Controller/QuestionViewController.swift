//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Mersad Meyfour Asadi on 07/10/2020.
//

import UIKit

class QuestionViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var questionProgressView: UIProgressView!
    @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet weak var answerOneButton: UIButton!
    @IBOutlet weak var answerTwoButton: UIButton!
    @IBOutlet weak var answerThreeButton: UIButton!
    @IBOutlet weak var answerFourButton: UIButton!
    
    // MARK: State
    var question: Question?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        question = questions[2]
        updateUI()
    }
    
    func updateUI(){
        QuestionLabel.text = question?.text
        answerOneButton.setTitle(question?.answers[0].text, for: .normal)
        answerTwoButton.setTitle(question?.answers[1].text, for: .normal)
        answerThreeButton.setTitle(question?.answers[2].text, for: .normal)
        answerFourButton.setTitle(question?.answers[3].text, for: .normal)
    }
    
}
