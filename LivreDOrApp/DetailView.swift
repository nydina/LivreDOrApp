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
    @State private var text: String = ""
    var body: some View {
        VStack {
            TextField(message.content, text: $text)
            Button("update") {
                Task {
                    self.message.content = text
                    try await viewModel.putMessage(message)
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

//struct DetailView_Previews: PreviewProvider {
//    @EnvironmentObject var viewModel: MessageViewModel
//    static var previews: some View {
//        DetailView()
//            .environmentObject(MessageViewModel())
//    }
//}
