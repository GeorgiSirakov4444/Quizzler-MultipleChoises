//
//  ViewController.swift
//  Quizzler-MultipleChoises
//
//  Created by Georgi Sirakov on 22.12.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var TextField: UILabel!
    @IBOutlet weak var Progressbar: UIProgressView!
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func ButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)
        
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    
    @objc func updateUI() {
        TextField.text = quizBrain.getQuestionText()
        
        let answerChoices = quizBrain.getAnswers()
        choice1.setTitle(answerChoices[0], for: .normal)
        choice2.setTitle(answerChoices[1], for: .normal)
        choice3.setTitle(answerChoices[2], for: .normal)
        
        Progressbar.progress = quizBrain.getProgress()
        ScoreLabel.text =
        "Score: \(quizBrain.getScore()) Question: \(quizBrain.getQuestionNumber())"
        
        choice1.backgroundColor = UIColor.clear
        choice2.backgroundColor = UIColor.clear
        choice3.backgroundColor = UIColor.clear
    }
}
