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

/// Написав @MainActor сразу же гарантируем, что все операции связанные с элементом который помечен @MainActor будут выполнены в главном потоке и синхронно. А если @MainActor не указан, то задача будет выполняться асинхронно на текущем потоке безопасности.  Но, если брать данную задачу с предыдущей, то нет отличий в работе Task {} и Task { @MainActor }
