//
//  StartInterviewViewModel.swift
//  PamagaITer
//
//  Created by Kazakevich, Vitaly on 4.10.21.
//

import Combine

final class StartInterviewViewModel: StartInterviewViewModelProtocol {
    @Published var inputs: [StartInterviewInputViewModel] = []
    @Published var canProceed: Bool = false {
        didSet {
            print(canProceed)
        }
    }

    func onAppear() {
        inputs = [
            StartInterviewInputViewModel(title: "Name", text: "", onChange: update),
            StartInterviewInputViewModel(title: "Position", text: "", onChange: update),
            StartInterviewInputViewModel(title: "Experience", text: "", onChange: update)
        ]
    }

    func next() {}
}

private extension StartInterviewViewModel {
    func update() {
        canProceed = !inputs.contains { $0.text.isEmpty }
    }
}
