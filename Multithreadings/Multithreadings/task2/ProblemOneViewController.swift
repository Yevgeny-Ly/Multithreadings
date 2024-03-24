//
//  ProblemOneViewController.swift
//  Multithreading
//
//

import UIKit

class ProblemOneViewController: UIViewController {
    
    let serialQueue = DispatchQueue(label: "com.example.myQueue")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        
        serialQueue.async {
            self.serialQueue.async {
                print("This will never be printed")
            }
        }
    }
}

/// данная проблема называет блокировкой вызова на серийной очереди - когда поток используя серийную очередь и добавляет задачу которая будет выполняться синхронно с остальными задачами. А на данной очереди чтобы началась следующая задача надо чтобы закончилась предыдущая.
