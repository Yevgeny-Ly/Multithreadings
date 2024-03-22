//
//  WritePhraseViewController.swift
//  Multithreading
//
//

import UIKit

class WritePhraseViewController: UIViewController {
    
    let semaphore = DispatchSemaphore(value: 0)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let phrasesService = PhrasesService()
        
        for i in 0..<10 {
            DispatchQueue.global().async {
                Task {
                    await phrasesService.addPhrases("Phrase \(i)")
                }
            }
        }
        
        Thread.sleep(forTimeInterval: 1)
        Task {
            let phases = await phrasesService.phrases
            print(phases)
        }
    }
}

actor PhrasesService {
    
    let semaphore = DispatchSemaphore(value: 1)
    
    var phrases: [String] = []
    
    func addPhrases(_ phrase: String) async {
        semaphore.wait()
        phrases.append(phrase)
        semaphore.signal()
    }
}
