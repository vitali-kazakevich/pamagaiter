//
//  InterviewQuestion.swift
//  PamagaITer
//
//  Created by Kazakevich, Vitaly on 5.10.21.
//

import Foundation

extension InterviewQuestion {
    enum Level: Comparable {
        case easy
        case medium
        case hard
        case unfair
    }
}

struct InterviewQuestion {
    let text: String
    let level: Level
    let domain: String = "In development"
}

enum InterviewQuestionGrade: Int {
    case unacceptable = 0
    case acceptable
    case good
    case great
}
