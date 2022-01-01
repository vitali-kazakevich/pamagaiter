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
    @Published var grade = InterviewGradeViewModel(max: InterviewQuestionGrade.great.rawValue, selected: 0)

    private let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        dependencies.interviewService.currentQuestion
            .map(InterviewQuestionViewModel.init)
            .assign(to: &$currentQuestion)
    }

    func submit() {
        dependencies.interviewService.append(grade: .init(rawValue: grade.selected) ?? .unacceptable)
        resetGrade()
    }
}

private extension InterviewQuestionsViewModel {
    func resetGrade() {
        grade = InterviewGradeViewModel(max: InterviewQuestionGrade.great.rawValue, selected: 0)
    }
}

private extension InterviewQuestionViewModel {
    init(question: InterviewQuestion) {
        text = question.text
        level = "\(question.level)"
        domain = question.domain
    }
}
