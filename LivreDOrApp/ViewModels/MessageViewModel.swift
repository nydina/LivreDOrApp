//
//  APICall.swift
//  LivreDOrApp
//
//  Created by Dina Andrianarijaona on 24/10/2022.
//

import Foundation

class MessageViewModel : ObservableObject {
    @Published var myMessages = MyMessages(messages: [Message]())
    
    func getMessage() async throws -> MyMessages {
        guard let url = URL(string: "http://localhost:8080/index")
        else {
            fatalError("Missing URL")
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200
        else {
            fatalError("Error while fetching data")
        }
        let decoded = try JSONDecoder().decode(MyMessages.self, from: data)
        
        return decoded
    }
    
}

