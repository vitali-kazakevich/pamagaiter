//
//  QuestionsStorage.swift
//  PamagaITer
//
//  Created by Kazakevich, Vitaly on 5.10.21.
//

import Foundation

final class QuestionsStorage {
    var allQuestions: [InterviewQuestion] {
        return tmpDB
    }
}

private var tmpDB: [InterviewQuestion] = [
    .init(text: "Explain the difference between let and var", level: .easy),
    .init(text: "Explain the difference between struct and class", level: .easy),
    .init(text: "Explain the difference between array and set", level: .easy),
    .init(text: "Explain the ARC concept", level: .easy),
    .init(text: "Explain the difference between weak and unowned", level: .medium)
]
