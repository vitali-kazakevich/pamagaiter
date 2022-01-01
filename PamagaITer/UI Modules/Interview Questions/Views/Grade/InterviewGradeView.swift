//
//  InterviewGradeView.swift
//  PamagaITer
//
//  Created by Vitali Kazakevich on 10/12/21.
//

import SwiftUI

final class InterviewGradeViewModel: ObservableObject {
    var max: Int
    @Published var selected: Int
    
    init(max: Int, selected: Int) {
        self.max = max
        self.selected = selected
    }
}

struct InterviewGradeView<ViewModel: InterviewGradeViewModel>: View {
    @ObservedObject private var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack {
            ForEach(0..<viewModel.max) { number in
                Button(action: {
                    viewModel.selected = number + 1
                }) {
                    if number < viewModel.selected {
                        Image(systemName: "star.fill")                    } else {
                        Image(systemName: "star")
                    }
                }
            }
        }
    }
}

struct InterviewGradeView_Previews: PreviewProvider {
    static var previews: some View {
        InterviewGradeView(viewModel: InterviewGradeViewModel(max: 4, selected: 2))
    }
}
