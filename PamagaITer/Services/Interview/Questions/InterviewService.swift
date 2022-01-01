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
    var currentQuestion: AnyPublisher<InterviewQuestion, Never> { get }

    func startInterview(for candidate: User)
    func endInterview()
    func append(grade: InterviewQuestionGrade)
}

extension AppInterviewService {
    struct Dependencies {
        let questionStorage: QuestionsStorage
    }
}

final class AppInterviewService {
    @Published private var currentCandidateSubject: User?
    @Published private var progressSubject: Double = 0
    @Published private var currentQuestionSubject: InterviewQuestion
    private let dependencies: Dependencies

    private let allQuestions: [InterviewQuestion]
    private var currentResult: [(InterviewQuestion, InterviewQuestionGrade)] = []

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        allQuestions = dependencies.questionStorage.allQuestions.sorted { $0.level > $1.level }
        currentQuestionSubject = allQuestions[0]
    }
}

extension AppInterviewService: InterviewService {
    var currentCandidate: AnyPublisher<User?, Never> {
        $currentCandidateSubject.eraseToAnyPublisher()
    }

    var progress: AnyPublisher<Double, Never> {
        $progressSubject.eraseToAnyPublisher()
    }

    var currentQuestion: AnyPublisher<InterviewQuestion, Never> {
        $currentQuestionSubject.eraseToAnyPublisher()
    }
    
    func append(grade: InterviewQuestionGrade) {
        currentResult.append((currentQuestionSubject, grade))
    }

    func startInterview(for candidate: User) {
        currentCandidateSubject = candidate
        currentResult = []
    }

    func endInterview() {
        currentCandidateSubject = nil
        // calculate result
        currentResult = []
    }
}
