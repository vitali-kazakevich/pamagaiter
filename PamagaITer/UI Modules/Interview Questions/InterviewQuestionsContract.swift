//
//  InterviewQuestionsContract.swift
//  PamagaITer
//
//  Created by Kazakevich, Vitaly on 4.10.21.
//

import Combine

protocol InterviewQuestionsViewModelProtocol: ObservableObject {
    var currentQuestion: InterviewQuestionViewModel? { get }
    var grade: GradeViewModel? { get }

    func submit()
}

struct InterviewQuestionViewModel {
    let text: String
    let level: String
    let domain: String
}

enum GradeViewModel: Int {
    case unacceptable = 0
    case acceptable
    case good
    case great
}
