//
//  RecipeViewController.swift
//  Multithreading
//
//

import UIKit

class RecipeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.global().async {
            self.thread1()
        }
        
        DispatchQueue.global(qos: .userInteractive).async {
            self.thread2()
        }
    }
    
    let resourceASemaphore = DispatchSemaphore(value: 1)
    let resourceBSemaphore = DispatchSemaphore(value: 1)
    
    func thread1() {
        resourceBSemaphore.wait()
        resourceASemaphore.wait()
        
        print("Поток 1 пытается захватить Ресурс A")
        print("Поток 1 пытается захватить Ресурс B")
        
        Thread.sleep(forTimeInterval: 1)

        print("Поток 1 захватил оба ресурса A и B")

        resourceASemaphore.signal()
        resourceBSemaphore.signal()
    }

    func thread2() {
        resourceBSemaphore.wait()
        resourceASemaphore.wait()
        
        print("Поток 2 пытается захватить Ресурс B")
        print("Поток 2 пытается захватить Ресурс A")
        
        Thread.sleep(forTimeInterval: 1)

        print("Поток 2 захватил оба ресурса A и B")

        resourceASemaphore.signal()
        resourceBSemaphore.signal()
    }
}

/// В данной ситуации проблема многопоточности под названием liveLock. Когда два потока не могут продвинуться в выполнении задач или завершить задачу из-за того, что постоянного реагируют друг на друга. 

