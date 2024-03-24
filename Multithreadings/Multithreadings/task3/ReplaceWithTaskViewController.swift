//
//  ReplaceWithTaskViewController.swift
//  Multithreadings
//
//

import UIKit

class ReplaceWithTaskViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(1)
        Task {
            print(2)
        }
        print(3)
    }
    
}

/// Код выполняется сверху вниз в main поэтому первым запринтится 1, после распечатается 3, и потом 2 потому что задача находится внутри замыкания и будет выполнена асинхронно, после того как синхронные принты 1 и 3 будут выполнены.
