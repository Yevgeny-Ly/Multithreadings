//
//  СombatMissionViewController.swift
//  Multithreadings
//
//

import UIKit

class СombatMissionViewController: UIViewController {
    
    var networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let operation = Operation()
        print(operation.queuePriority.rawValue)
        
//        Task {
//            try await fetchMessages()
//        }
    }
    
    /// task 2
//    func fetchMessages() async -> [Message] {
//        await withCheckedContinuation { message in
//            networkService.fetchMassage { message in
//                print(message)
//            }
//        }
//    }
    
    /// task 3
    func fetchMessages() async throws -> [Message] {
        try await withCheckedThrowingContinuation({ continuation in
            networkService.fetchMassage { message in
                if message.isEmpty {
                    continuation.resume(throwing: Error.self as! Error)
                } else {
                    continuation.resume(returning: message)
                    print(message)
                }
            }
        })
    }
}

struct Message: Decodable, Identifiable {
    let id: Int
    let from: String
    let message: String
}

class NetworkService {
    func fetchMassage(completion: @escaping ([Message]) -> Void) {
        let url = URL(string: "https://hws.dev/user-messages.json")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let messages = try? JSONDecoder().decode([Message].self, from: data) {
                    completion(messages)
                    return
                }
            }
            
            completion([])
        }
        .resume()
    }
}
