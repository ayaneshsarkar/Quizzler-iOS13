//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var firstChoice: UIButton!
    @IBOutlet weak var secondChoice: UIButton!
    @IBOutlet weak var thirdChoice: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        updateUI()
    }

    
    @IBAction func actionButtonPressed(_ sender: UIButton) {
        let userAnswer: String = sender.currentTitle!
        let userGotItRight: Bool = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        updateUI()
    }
    
    func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        // Set Choice Answers
        firstChoice.setTitle(quizBrain.getChoiceAnswer(1), for: UIControl.State.normal)
        secondChoice.setTitle(quizBrain.getChoiceAnswer(2), for: UIControl.State.normal)
        thirdChoice.setTitle(quizBrain.getChoiceAnswer(3), for: UIControl.State.normal)
        
        Timer.scheduledTimer(timeInterval: 0.2, target:self, selector: #selector(clearButtonBackgroundColors), userInfo:nil, repeats: false)
    }
    
    @objc func clearButtonBackgroundColors() {
        firstChoice.backgroundColor = UIColor.clear
        secondChoice.backgroundColor = UIColor.clear
        thirdChoice.backgroundColor = UIColor.clear
    }
}

