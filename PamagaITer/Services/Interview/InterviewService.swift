//
//  InterviewService.swift
//  PamagaITer
//
//  Created by Kazakevich, Vitaly on 5.10.21.
//

import Combine

protocol InterviewService {
    var currentCandidate: AnyPublisher<User?, Never> { get }
    var progress: AnyPublisher<Double, Never> { get }
    var currentQuestion: AnyPublisher<InterviewQuestion?, Never> { get }

    func startInterview(for candidate: User)
    func endInterview()
}

extension AppInterviewService {
    struct Dependencies {
        let questionStorage: QuestionsStorage
    }
}

final class AppInterviewService {
    private let currentCandidateSubject = CurrentValueSubject<User?, Never>(nil)
    private let progressSubject = CurrentValueSubject<Double, Never>(0)
    private let currentQuestionSubject: CurrentValueSubject<InterviewQuestion?, Never>
    private let dependencies: Dependencies

    private let allQuestions: [InterviewQuestion]

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        allQuestions = dependencies.questionStorage.allQuestions.sorted { $0.level > $1.level }
        currentQuestionSubject = .init(allQuestions[0])
    }
}

extension AppInterviewService: InterviewService {
    var currentCandidate: AnyPublisher<User?, Never> {
        currentCandidateSubject.eraseToAnyPublisher()
    }

    var progress: AnyPublisher<Double, Never> {
        progressSubject.eraseToAnyPublisher()
    }

    var currentQuestion: AnyPublisher<InterviewQuestion?, Never> {
        currentQuestionSubject.eraseToAnyPublisher()
    }

    func startInterview(for candidate: User) {
        currentCandidateSubject.value = candidate
    }

    func endInterview() {
        currentCandidateSubject.value = nil
    }
}
