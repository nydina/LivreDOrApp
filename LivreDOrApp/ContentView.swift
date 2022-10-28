//
//  ContentView.swift
//  LivreDOrApp
//
//  Created by Dina Andrianarijaona on 24/10/2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel : MessageViewModel
    @State private var arrayCount = 0
    var body: some View {
        NavigationView {
            
            List {
                ForEach(viewModel.myMessages.messages, id: \.id) {
                    text in
                    NavigationLink(destination: {
                        DetailView(message: text)
                    }, label: {
                        RowView(messageContent: text.content)
                    })
                }
                .onDelete { i in i.forEach { index in
                    let message = viewModel.myMessages.messages[index]
                    Task {
                        viewModel.myMessages.messages.remove(at: index)
                    }
                    
                    Task {
                        try await viewModel.deleteMessage(id: message.id)
                    }
                }
                }
            }
            
            //refresh automatically
            .onChange(of: arrayCount, perform: { _ in
                arrayCount = viewModel.myMessages.messages.count
                Task {
                    await viewModel.reload()
                }
            })
            
            //read list from API
            .onAppear {
                Task {
                    viewModel.myMessages = try await viewModel.getMessage()
                }
            }
            
            //pull to refresh
            .refreshable {
                await viewModel.reload()
            }
            .overlay(alignment: .top) {
                if viewModel.error != nil {
                    ErrorView(error: $viewModel.error)
                }
            }
            .navigationTitle("Message")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarItems(trailing: AddButton(arrayCount: $arrayCount))
            
        }.accentColor(.teal)
    }
}

struct ContentView_Previews:
                                
    PreviewProvider {
    @EnvironmentObject var viewModel : MessageViewModel
    static var previews: some View {
        ContentView()
            .environmentObject(MessageViewModel())
        
    }
}
