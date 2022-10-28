//
//  ContentView.swift
//  LivreDOrApp
//
//  Created by Dina Andrianarijaona on 24/10/2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var texts : MessageViewModel
    
    var body: some View {
        NavigationView {
            
            List {
                ForEach(texts.myMessages.messages, id: \.id) {
                    text in
                    NavigationLink(destination: {
                        DetailView(message: text)
                    }, label: {
                        RowView(messageContent: text.content)
                    })
                }
                .onDelete { i in i.forEach { index in
                    let message = texts.myMessages.messages[index]
                    Task {
                        texts.myMessages.messages.remove(at: index)
                    }
                    
                    Task {
                        try await texts.deleteMessage(id: message.id)
                    }
                }
                }
            }
            .onAppear {
                Task {
                    texts.myMessages = try await texts.getMessage()
                }
            }
            .refreshable {
                await texts.reload()
            }
            .overlay(alignment: .top) {
                if texts.error != nil {
                    ErrorView(error: $texts.error)
                }
            }
            .navigationTitle("Message")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarItems(trailing: AddButton())

        }.accentColor(.teal)
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
        
    }
}
