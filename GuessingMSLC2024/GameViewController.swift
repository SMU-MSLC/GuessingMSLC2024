//
//  GameViewController.swift
//  GuessingMSLC2024
//
//  Created by Eric Cooper Larson on 8/28/24.
//

import UIKit

class GameViewController: UIViewController, UITextFieldDelegate {

    var guessModel:GuessModel = GuessModel()
    
    @IBOutlet weak var feedbackLabel: UILabel!
    @IBOutlet weak var guessTextField: UITextField!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.guessTextField.delegate = self
        
        self.guessTextField.becomeFirstResponder()
        
        var elapsedTime:Int = 0
        let timer:Timer = Timer(timeInterval: 1, repeats: true) { tmp in
            elapsedTime += 1
            self.timeLabel.text = "Elapsed: \(elapsedTime)"
        }
        
        RunLoop.main.add(timer, forMode: .common)
        
    }
    
    @IBAction func didTap(_ sender: UITapGestureRecognizer) {
        
        self.guessTextField.resignFirstResponder()
    }
    
    func makeGuess(){
        
        if let guess = Int(self.guessTextField.text!){
            
            let guess_feedback:GuessValue = self.guessModel.makeGuess(guess)
            
            switch guess_feedback {
            case GuessIsCorrect:
                self.feedbackLabel.text = "Correct Guess"
            case GuessIsLow:
                self.feedbackLabel.text = "Guess was too low"
            case GuessIsHigh:
                self.feedbackLabel.text = "Guess was too high"
            default:
                print("Should Never get here")
            }
            self.guessTextField.text = ""
            
        }else{
            self.feedbackLabel.text = "Please enter an integer."
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.makeGuess()
        
        self.guessTextField.resignFirstResponder()
        return true
    }
    

    @IBAction func submitGuess(_ sender: UIButton) {
        makeGuess()
    }
    

}
