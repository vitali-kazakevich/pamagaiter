//
//  StartInterviewViewModel.swift
//  PamagaITer
//
//  Created by Kazakevich, Vitaly on 4.10.21.
//

import Combine

extension StartInterviewViewModel {
    struct Dependencies {
        let interviewService: InterviewService
    }
}

final class StartInterviewViewModel: StartInterviewViewModelProtocol {
    @Published var inputs: [StartInterviewInputViewModel] = []
    @Published var canProceed: Bool = false {
        didSet {
            print(canProceed)
        }
    }

    private var subscriptions: Set<AnyCancellable> = []
    private let dependencies: Dependencies

    private var inputInfo: [String: String] = [
        "name": "",
        "position": "",
        "experience": ""
    ]

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    func onAppear() {
        update()
    }

    func next() {
        // create user
//        dependencies.interviewService.startInterview()
    }
}

private extension StartInterviewViewModel {
    func update() {
        inputs = inputInfo.map { key, value in
            let inputViewModel = StartInterviewInputViewModel(title: key, text: value)
            inputViewModel.$text
                .sink { value in
                    guard value != self.inputInfo[key] else { return }
                    self.inputInfo[key] = value
                    self.updateProceedState()
                }.store(in: &subscriptions)
            return inputViewModel
        }

    }

    func updateProceedState() {
        canProceed = !inputs.contains { $0.text.isEmpty }
    }
}
