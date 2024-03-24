//
//  TaskDetachedViewController.swift
//  Multithreadings
//
//

import UIKit

class TaskDetachedViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Task 1 is finished")
        
        Task.detached(priority: .userInitiated, operation: {
            for i in 0..<50 {
                print(i)
            }
            print("Task 2 is finished")
            print(Task.currentPriority)
        })
        print("Task 3 is finished")
    }
    
}

/// Task.detached это создание потока и этот поток не будет блокировать основной поток. Метод detached может работать самостоятельно и не быть привязанным к основному потоку и когда этот поток завершит свое действие, то не повлияет пагубно на работу всей программы
