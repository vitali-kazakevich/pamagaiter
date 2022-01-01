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
            if let question = viewModel.currentQuestion {
                VStack {
                    Text(question.text)
                    Spacer().frame(height: 50.0)
                    InterviewGradeView(viewModel: viewModel.grade)
                    Spacer().frame(height: 50.0)
                    HStack {
                        Text(question.domain).foregroundColor(.gray)
                        Spacer()
                        Text(question.level).foregroundColor(.gray)
                    }
                }
                .padding(.all)
            }
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
    let grade = InterviewGradeViewModel(max: 4, selected: 2)
    func submit() {}
}
