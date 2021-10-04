//
//  StartInterviewContract.swift
//  PamagaITer
//
//  Created by Kazakevich, Vitaly on 4.10.21.
//

import SwiftUI

protocol StartInterviewViewModelProtocol: ObservableObject {
    var inputs: [StartInterviewInputViewModel] { get }
    var canProceed: Bool { get }

    func onAppear()
    func next()
}
