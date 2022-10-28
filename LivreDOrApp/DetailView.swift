//
//  DetailView.swift
//  LivreDOrApp
//
//  Created by Dina Andrianarijaona on 24/10/2022.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var viewModel: MessageViewModel
    @State var message : Message
//    @State private var text: String = ""
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .frame(width: 350, height: 250)
                    .foregroundColor(.gray.opacity(0.15))
                    .cornerRadius(20)
                
                VStack {
                    TextField(message.content, text: $message.content)
                       
                    .padding(20)
                    Spacer()

                }
                .frame(width: 350, height: 250)
                    
                                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("update") {
                        Task {
                            try await viewModel.putMessage(message)
                        }
                    }
                }
            }
            
            Button("delete") {
                Task {
                    try await viewModel.deleteMessage(id: message.id)
                }
            }
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
//    @EnvironmentObject var viewModel: MessageViewModel
    static var previews: some View {
        NavigationView {
            DetailView(message: Message(id: 0, content: "Hello you", createdAt: ""))
        }
//            .environmentObject(MessageViewModel())
    }
}


