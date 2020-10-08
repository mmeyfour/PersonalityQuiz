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
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerOneButton: UIButton!
    @IBOutlet weak var answerTwoButton: UIButton!
    @IBOutlet weak var answerThreeButton: UIButton!
    @IBOutlet weak var answerFourButton: UIButton!
    
    // MARK: State
    var state: State?
    var question: Question?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigationItem.backBarButtonItem = true
        question = state?.nextQuestion
        updateUI()
        
    }
    // MARK: Helpers
    func updateUI(){
        
        //        //Method One: Optional chaining
        //        questionLabel.text = question?.text
        //        answerOneButton.setTitle(question?.answers[0].text, for: .normal)
        //        answerTwoButton.setTitle(question?.answers[1].text, for: .normal)
        //        answerThreeButton.setTitle(question?.answers[2].text, for: .normal)
        //        answerFourButton.setTitle(question?.answers[3].text, for: .normal)
        
        // Method Two:
        guard let question = question else {
            return
        }
        questionLabel.text = question.text
        answerOneButton.setTitle(question.answers[0].text, for: .normal)
        answerTwoButton.setTitle(question.answers[1].text, for: .normal)
        answerThreeButton.setTitle(question.answers[2].text, for: .normal)
        answerFourButton.setTitle(question.answers[3].text, for: .normal)
        
        questionProgressView.progress = state?.currentProgress ?? 0.0
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //        if let nextQuestion = state?.nextQuestion
        //        //        guard let nextQuestion = state.nextQuestion else {
        //        //            return
        //        //        }
        //        guard let questionViewController = segue.destination as? QuestionViewController else {
        //            return
        //        }
        //        questionViewController.question = nextQuestion
        
    }
    func navigateToNextScreen() {
        state?.incrementQuestion()
        guard let state = state else {
            return
        }
        // Instanciar
        if state.hasNextQuestion {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let questionViewController = storyboard.instantiateViewController(identifier: "QuestionViewController") as? QuestionViewController else {
                return
            }
            // Inyection
            questionViewController.state = state
            // Presentacion
            navigationController?.pushViewController(questionViewController, animated: true)
        } else {
            performSegue(withIdentifier: "PresentQuizResults", sender: nil)
        }
    }
    
    @IBAction func didTapFirestAnswer(_ sender: UIButton) {
        
        state?.chooseAnswer(at: 0)
        navigateToNextScreen()
    }
    @IBAction func didTapSecondAnswer(_ sender: UIButton) {
        
        state?.chooseAnswer(at: 1)
        navigateToNextScreen()
    }
    @IBAction func didTapThirdAnswer(_ sender: UIButton) {
        
        state?.chooseAnswer(at: 2)
        navigateToNextScreen()
    }
    @IBAction func didTapFourthAnswer(_ sender: UIButton) {
        
        state?.chooseAnswer(at: 3)
        navigateToNextScreen()
    }
}
