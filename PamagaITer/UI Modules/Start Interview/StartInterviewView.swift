//
//  StartInterviewView.swift
//  PamagaITer
//
//  Created by Kazakevich, Vitaly on 4.10.21.
//

import SwiftUI

struct StartInterviewView<ViewModel>: View where ViewModel: StartInterviewViewModelProtocol {
    @ObservedObject private var viewModel: ViewModel
    private let router: StartInterviewRouter

    init(viewModel: ViewModel, router: StartInterviewRouter) {
        self.viewModel = viewModel
        self.router = router
    }

    var body: some View {
        NavigationView {
            VStack {
                LazyVStack {
                    ForEach(viewModel.inputs) {
                        StartInterviewInputView(viewModel: $0)
                    }
                }
                NavigationLink(
                    "Start Interview",
                    destination: router.interviewQuestionsRoute()
                ).disabled(!viewModel.canProceed)
            }.onAppear {
                viewModel.onAppear()
            }
        }
    }
}

struct StartInterviewView_Previews: PreviewProvider {
    static var previews: some View {
        StartInterviewView(viewModel: MockStartInterviewViewModel(), router: StartInterviewRouter())
    }
}

class MockStartInterviewViewModel: StartInterviewViewModelProtocol {
    func onAppear() {}
    func next() {}

    var inputs: [StartInterviewInputViewModel] = [
        .init(title: "Title", text: "Text"),
        .init(title: "Title", text: "Text")
    ]
    var canProceed: Bool = true
}
