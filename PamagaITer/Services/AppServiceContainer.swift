//
//  AppServiceContainer.swift
//  PamagaITer
//
//  Created by Kazakevich, Vitaly on 4.10.21.
//

import Foundation

final class AppServiceContainer {
    static let shared = AppServiceContainer()
    private init() {}

    private lazy var interview: InterviewService = AppInterviewService(dependencies: .init(questionStorage: resolveDependency()))
    private let user: UserService = AppUserService()

    private let questionStorage = QuestionsStorage()

    private lazy var services: [Any] = [
        interview,
        user,
        questionStorage
    ]
}

extension AppServiceContainer {
    func resolveDependency<T>() -> T {
        return services.map { $0 as? T }.first!!
    }
}
