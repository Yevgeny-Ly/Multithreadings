//
//  TransferDataAsyncAwaitViewController.swift
//  Multithreadings
//
//

import UIKit

class TransferDataAsyncAwaitViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            let result = await randomD6()
            print(result)
        }
        
        func randomD6() async -> Int {
            Int.random(in: 1...6)
        }
    }
}
