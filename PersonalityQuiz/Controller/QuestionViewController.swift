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
        
        navigationItem.hidesBackButton = true
        question = state?.currentQuestion
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
        
        // One way to assign progress: if-else with optional chaining
//        if let progress = state?.currentProgress {
//            questionProgressView.progress = progress
//        } else {
//            questionProgressView.progress = 0.0
//        }
        
        // Another way to assign progress: guard with optional chaining
//        guard let progress = state?.currentProgress else {
//            questionProgressView.progress = 0.0
//            return
//        }
//        questionProgressView.progress = progress
        
        // Preferred way to assign progress: optional chaining with nil coalescing
        questionProgressView.progress = state?.currentProgress ?? 0.0
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultsViewController = segue.destination as? ResultsViewController else {
            return
        }
        resultsViewController.state = state
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
