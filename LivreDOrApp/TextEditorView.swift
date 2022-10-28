//
//  TextEditorView.swift
//  LivreDOrApp
//
//  Created by Dina Andrianarijaona on 27/10/2022.
//

import SwiftUI

struct TextEditorView: View {
    @EnvironmentObject var viewModel: MessageViewModel
    var body: some View {
        TextEditor(text: $viewModel.content)
            .padding()
            .scrollContentBackground(.hidden)
            .frame(width: 350, height: 250)
            .background(Color.gray.opacity(0.15))
            .foregroundColor(.gray)
            .cornerRadius(25)
            .navigationTitle("Add a message")
            .navigationBarTitleDisplayMode(.inline)    }
}

struct TextEditorView_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorView()
    }
}
