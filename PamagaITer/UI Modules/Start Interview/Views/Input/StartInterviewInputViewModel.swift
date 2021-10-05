//
//  StartInterviewInputViewModel.swift
//  PamagaITer
//
//  Created by Kazakevich, Vitaly on 4.10.21.
//

import Combine

final class StartInterviewInputViewModel: ObservableObject, Identifiable {
    let title: String
    @Published var text: String

    init(title: String, text: String) {
        self.title = title
        self.text = text
    }
}
