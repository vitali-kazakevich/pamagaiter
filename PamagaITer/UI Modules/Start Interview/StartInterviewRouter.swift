//
//  StartInterviewRouter.swift
//  PamagaITer
//
//  Created by Kazakevich, Vitaly on 4.10.21.
//

import SwiftUI

final class StartInterviewRouter {
    func makeView() -> some View {
        return StartInterviewView(
            viewModel: StartInterviewViewModel(
                dependencies: .init(interviewService: AppServiceContainer.shared.resolveDependency())),
            router: self)
    }
}

extension StartInterviewRouter {
    func interviewQuestionsRoute() -> some View {
        return InterviewQuestionsRouter().makeView()
    }
}
