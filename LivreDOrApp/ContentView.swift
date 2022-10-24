//
//  ContentView.swift
//  LivreDOrApp
//
//  Created by Dina Andrianarijaona on 24/10/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var texts = MessageViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(texts.myMessages.messages, id: \.row.id) {
                    text in
                    NavigationLink(destination: {
                        DetailView(messageContent: text.row.content)
                    }, label: {
                        RowView(messageContent: text.row.content)
                    })
                }
            }
            .onAppear {
                Task {
                    texts.myMessages = try await texts.getMessage()
                }
        }
        }
    }
    
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
        
    }
}
