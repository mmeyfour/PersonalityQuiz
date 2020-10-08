//
//  IntroductionViewController.swift
//  PersonalityQuiz
//
//  Created by Mersad Meyfour Asadi on 07/10/2020.
//

import UIKit

class IntroductionViewController: UIViewController {

    // MARK: State
    var state = State()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // la primera pantalla configura la siguiente pantalla y la ultima da el salto a otra pagina

        //        let destinationViewController = segue.destination
        //        if let questionViewController = destinationViewController as? QuestionViewController {
        //            questionViewController.question = nextQuestion
        //        } else {
        //            return
        //        }
        guard let questionViewController = segue.destination as? QuestionViewController else {
            return
        }
        
        state.resetAnswers()
        questionViewController.state = state
    }
    @IBAction func unwindToQuizIntroduction (segues: UIStoryboardSegue) {
        
    }

}
