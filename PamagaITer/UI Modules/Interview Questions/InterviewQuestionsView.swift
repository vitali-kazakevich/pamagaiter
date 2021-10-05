//
//  InterviewQuestionsView.swift
//  PamagaITer
//
//  Created by Kazakevich, Vitaly on 4.10.21.
//

import SwiftUI

struct InterviewQuestionsView<ViewModel>: View where ViewModel: InterviewQuestionsViewModelProtocol {
    @ObservedObject private var viewModel: ViewModel

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
//            Text(viewModel.currentQuestion?.text)
        }
    }
}

struct InterviewQuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        InterviewQuestionsView(viewModel: MockViewModel())
    }
}

private final class MockViewModel: InterviewQuestionsViewModelProtocol {
    let currentQuestion: InterviewQuestionViewModel? = .init(text: "Good question?", level: "hard", domain: "iOS")
    let grade: GradeViewModel? = .great
    func submit() {}
}
