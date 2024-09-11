//
//  GameViewController.swift
//  GuessingMSLC2024
//
//  Created by Eric Cooper Larson on 8/28/24.
//

import UIKit

class GameViewController: UIViewController {

    var guessModel:GuessModel = GuessModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if(self.guessModel.makeGuess(50)){
            print("Its was 50")
        }else{
            print("it was NOT 50")
        }
        
    }
    
    func makeGuess(guess:Int){
        
        let guess_feedback:GuessValue = self.guessModel.makeGuess(guess)
        switch guess_feedback {
        case GuessIsCorrect:
            print("Correct Guess")
        case GuessIsLow:
            print("Guess was too low")
        case GuessIsHigh:
            print("Guess was too high")
        default:
            print("Should Never get here")
        }
        
    }
    

   

}
