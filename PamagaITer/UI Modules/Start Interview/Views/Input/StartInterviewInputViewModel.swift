//
//  StartInterviewInputViewModel.swift
//  PamagaITer
//
//  Created by Kazakevich, Vitaly on 4.10.21.
//

import Combine

final class StartInterviewInputViewModel: ObservableObject, Identifiable {
    let title: String
    @Published var text: String {
        didSet {
            onChange?()
        }
    }

    private let onChange: (() -> Void)?

    init(title: String, text: String, onChange: (() -> Void)? = nil) {
        self.title = title
        self.text = text
        self.onChange = onChange
    }
}
