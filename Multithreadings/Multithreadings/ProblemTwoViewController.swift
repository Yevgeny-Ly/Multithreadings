//
//  ProblemTwoViewController.swift
//  Multithreading
//
//

import UIKit

class ProblemTwoViewController: UIViewController {
    
    private let lock = NSLock()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var sharedResource = 0
        
        DispatchQueue.global(qos: .background).async {
            self.lock.lock()
            for _ in 1...100 {
                sharedResource += 1
            }
            self.lock.unlock()
        }
        
        DispatchQueue.global(qos: .background).async {
            self.lock.lock()
            for _ in 1...100 {
                sharedResource += 1
            }
            self.lock.unlock()
        }
    }
}

/// Данная проблема "состояние гонки (Race condition)" когда оба потока пытаются получит доступ к одному и тому же источнику данных.
