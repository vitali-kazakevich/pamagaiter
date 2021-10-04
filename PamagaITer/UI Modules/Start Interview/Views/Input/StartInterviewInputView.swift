//
//  StartInterviewInputView.swift
//  PamagaITer
//
//  Created by Kazakevich, Vitaly on 4.10.21.
//

import SwiftUI

struct StartInterviewInputView: View {
    @State var viewModel: StartInterviewInputViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            Text(viewModel.title)
                .fontWeight(.bold)
            TextField(viewModel.title, text: $viewModel.text)
            Rectangle()
                .frame(height: 1)
                .background(Color.black)
        }
        .padding(.all)
    }
}

struct StartInterviewInput_Previews: PreviewProvider {
    static var previews: some View {
        StartInterviewInputView(viewModel: .init(title: "DefaultTitle", text: "Input"))
    }
}
