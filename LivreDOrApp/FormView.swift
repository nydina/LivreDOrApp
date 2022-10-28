//
//  FormView.swift
//  LivreDOrApp
//
//  Created by Dina Andrianarijaona on 25/10/2022.
//

import SwiftUI

struct FormView: View {
    @EnvironmentObject var viewModel: MessageViewModel
    @Environment(\.presentationMode) var presentationMode
    @Binding var arrayCount: Int

    var body: some View {
        
            VStack {
                AddPhoto()
                ZStack {
                    VStack(alignment: .leading){
                        Text("What do you want to tell us?")
                        TextEditorView()
                            .toolbar {
                                ToolbarItem(placement: .navigationBarLeading) {
                                    Button("Cancel") {
                                        presentationMode.wrappedValue.dismiss()
                                    }
                                }
                                ToolbarItem(placement: .navigationBarTrailing) {
                                    Button("Publish") {
                                        arrayCount = viewModel.myMessages.messages.count
                                        
                                        Task {
                                            viewModel.message = try await viewModel.postMessage(content: viewModel.content)

                                        }
                                        
                                        Task {
                                            viewModel.content = ""
                                        }
                                        
                                        Task {
                                            presentationMode.wrappedValue.dismiss()
                                        }
                                    }
                                }
                            }
                    }
                
                
                Spacer()}
        }.accentColor(.teal)
        
        
    }
}

struct FormView_Previews: PreviewProvider {
    @EnvironmentObject var viewModel: MessageViewModel
    static var previews: some View {
        NavigationView {
            FormView(arrayCount: .constant(0))
                .environmentObject(MessageViewModel())
        }
    }
}
