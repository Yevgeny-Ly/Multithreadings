//
//  MainActorViewController.swift
//  Multithreadings
//
//

import UIKit

class MainActorViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(1)
        Task { @MainActor in
            print(2)
        }
        print(3)
    }
    
}

/// Написав @MainActor сразу же гарантируем, что все операции связанные с элементом который помечен @MainActor будут выполнены в главном потоке.
