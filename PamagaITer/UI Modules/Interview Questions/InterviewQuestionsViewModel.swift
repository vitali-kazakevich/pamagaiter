//
//  InterviewQuestionsViewModel.swift
//  PamagaITer
//
//  Created by Kazakevich, Vitaly on 4.10.21.
//

import Combine

extension InterviewQuestionsViewModel {
    struct Dependencies {
        let interviewService: InterviewService
    }
}

final class InterviewQuestionsViewModel: InterviewQuestionsViewModelProtocol {
    @Published var currentQuestion: InterviewQuestionViewModel?
    @Published var grade: GradeViewModel? = nil

    private let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        dependencies.interviewService.currentQuestion
            .map { question in question.map { InterviewQuestionViewModel(text: $0.text, level: "\($0.level)", domain: $0.domain) } }
            .assign(to: &$currentQuestion)
    }

    func submit() {
        
    }
}
