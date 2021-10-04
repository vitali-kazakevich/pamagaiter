//
//  MainMenuView.swift
//  PamagaITer
//
//  Created by Kazakevich, Vitaly on 4.10.21.
//

import SwiftUI

struct MainMenuView: View {
    private let router: MainMenuRouter

    init(router: MainMenuRouter) {
        self.router = router
    }

    var body: some View {
        TabView {
            router.startInterviewRoute()
                .tabItem {
                    Label("Interview", systemImage: "person.fill.questionmark")
                }
        }
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView(router: MainMenuRouter())
    }
}
