//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Ayanesh Sarkar on 27/01/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    let quiz: [Question] = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
    ]
    
    var questionNumber: Int = 0
    var score: Int = 0
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        let actualAnswer: String = quiz[questionNumber].correctAnswer
        
        if (userAnswer == actualAnswer) {
            self.score += 1
        }
        
        return userAnswer == actualAnswer
    }
    
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    func getProgress() -> Float {
        return (Float(questionNumber + 1) / Float(quiz.count)) * 1.0
    }
    
    mutating func nextQuestion() -> Void {
        if (questionNumber < (quiz.count - 1)) {
            self.questionNumber += 1
        } else {
            self.questionNumber = 0
            self.score = 0
        }
    }
    
    func getScore() -> Int {
        return score
    }
    
    func getChoiceAnswer(_ choiceIndex: Int) -> String {
        return quiz[self.questionNumber].answer[choiceIndex - 1]
    }
}
