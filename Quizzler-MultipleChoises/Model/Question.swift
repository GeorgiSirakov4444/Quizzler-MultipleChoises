//
//  Questions.swift
//  Quizzler-MultipleChoises
//
//  Created by Georgi Sirakov on 3.01.23.
//

import Foundation

struct Question {
    let text: String
    let answers: [String]
    let rightAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answers = a
        rightAnswer = correctAnswer
    }
}
