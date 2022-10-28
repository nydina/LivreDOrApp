//
//  APICall.swift
//  LivreDOrApp
//
//  Created by Dina Andrianarijaona on 24/10/2022.
//

import Foundation

enum MessageError : Error {
    case noMessage
    case decodingError
    case badURL
    case badResponse
    
    var localizedDescription: String {
        switch self {
        case .noMessage:
            return "No message"
        case .decodingError:
            return "Error while decoding error"
        case .badURL:
            return "Missing URL"
        case .badResponse:
            return "Bad response"
        }
    }
}


class MessageViewModel : ObservableObject {
    @Published var myMessages = MyData(messages: [Message]())
    
    @Published var error: Error?
    @Published var content: String = ""
    
    @Published var message : Message?
    
    //   throw: ma fonction peut retourner une exception
    func getMessage() async throws -> MyData {
        //        1. Definir l'URL
        guard let url = URL(string: "http://localhost:8080/index")
        else {
            throw MessageError.badURL
        }
        
        //        2. Créer la requête à partir de mon url
        var urlRequest = URLRequest(url: url)
        
        //        3. Configurer la méthode mon url
        //        GET = récupération de données
        urlRequest.httpMethod = "GET"
        
        //        4. Lancer l'exécution de la requête avec URLSession(l'objet permettant de communiquer avec le réseau)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        //        5. Récupérer les données et la réponse
        guard (response as? HTTPURLResponse)?.statusCode == 200
        else {
            throw MessageError.badResponse
        }
        
        //        6. Décoder les données de la réponse du serveur(data) avec l'objet JSONDecoder avec la méthode .decode()
        let jsonDecoder = JSONDecoder()
        let decoded = try jsonDecoder.decode(MyData.self, from: data)
        
        //        6bis. Definir la stratégie du décodage du "snake_case" vers le "camelCase"
//        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        
        //        7. Retourner les données décodées
        return decoded
    }
    
    
    /// Description: Create a message
    /// - Parameter content: message content
    /// - Returns: created message
    func postMessage(content: String) async throws -> Message {
        
        guard let url = URL(string: "http://localhost:8080/index")
        else {
            throw MessageError.badURL
        }
        var urlRequest = URLRequest(url: url)
        
        //        Configurer ma requête
        urlRequest.httpMethod = "POST"
        
        //        Pour les requêtes "POST", on définit un body, le corps de la requête, de type Dictionary
        let parameter: [String : String] = ["content": content]
        
        //        Ajouter des valeurs dans le Header de la requête pour préciser les types de données
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        //        Prendre les données, les transformer en objet Data optionnel(encoder)
        urlRequest.httpBody = try? JSONEncoder().encode(parameter)
        
        //        Exécuter la requête
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        
        /*guard (response as? HTTPURLResponse)?.statusCode == 200
        else {
            throw MessageError.badResponse
        }*/
        //        Décoder les données
        //        do catch permet d'encapsuler try
        
        let jsonDecoder = JSONDecoder()
        
        do {
            let decoded = try jsonDecoder.decode(Message.self, from: data)
            return decoded
        } catch {
            throw MessageError.decodingError
        }
    }
    
    func deleteMessage(id: Int) async throws -> Message {
        
        guard let url = URL(string: "http://localhost:8080/\(id)")
        else {
            throw MessageError.badURL
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "DELETE"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        
        let decoded = try JSONDecoder().decode(Message.self, from: data)
        return decoded
        
    }
    
    /// update message
    /// - Parameter message: <#message description#>
    /// - Returns: <#description#>
    func putMessage(_ message: Message) async throws -> Message {
        guard let url = URL(string: "http://localhost:8080/\(message.id)")
        else {
            throw MessageError.badURL
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "PUT"
        
        let parameters: [String : String] = [
            "id" : String(message.id),
            "content": message.content
        ]
        
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        urlRequest.httpBody = try? JSONEncoder().encode(parameters)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200
        else {
            throw MessageError.badResponse
        }
        
        let jsonDecoder = JSONDecoder()
        
        do {
            let decoded = try jsonDecoder.decode(Message.self, from: data)
            return decoded
        } catch {
            throw MessageError.decodingError
        }
    }

    
   @MainActor func reload() async {
        do {
            myMessages = try await getMessage()
            error = nil
        } catch {
            self.error = error
        }
    }
    
}

