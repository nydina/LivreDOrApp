//
//  UpdateMessageDetail.swift
//  LivreDOrApp
//
//  Created by Dina Andrianarijaona on 28/10/2022.
//

import SwiftUI

struct UpdateMessageDetail: View {
    @EnvironmentObject var viewModel: MessageViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var message: Message
    @State var showingFormView: Bool = false
    var body: some View {
        NavigationView {
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
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Cancel") {
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Accept") {
                            showingFormView = true
                            presentationMode.wrappedValue.dismiss()
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
}

struct UpdateMessageDetail_Previews: PreviewProvider {
    static var previews: some View {
        UpdateMessageDetail(message: Message(id: 1, content: "Hello you", createdAt: ""), showingFormView: false)
    }
}
