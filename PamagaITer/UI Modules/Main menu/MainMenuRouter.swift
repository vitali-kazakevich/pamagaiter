//
//  MainMenuRouter.swift
//  PamagaITer
//
//  Created by Kazakevich, Vitaly on 4.10.21.
//

import SwiftUI

final class MainMenuRouter {
    func startInterviewRoute() -> some View {
        return StartInterviewRouter().makeView()
    }
}
