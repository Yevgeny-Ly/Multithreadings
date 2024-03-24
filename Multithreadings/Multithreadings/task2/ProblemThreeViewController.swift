//
//  ProblemThreeViewController.swift
//  Multithreading
//
//

import UIKit

class ProblemThreeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let customQueue = DispatchQueue(label: "customQueue", attributes: .concurrent)
        
        let people1 = People1()
        let people2 = People2()
        
        let dispatchWorkItem = DispatchWorkItem {
            let thread1 = Thread {
                people1.walkPast(with: people2)
            }
            people2.isDifferendDirection = true
            thread1.start()
        }
        
        
        dispatchWorkItem.notify(queue: .main, execute: {
            let thread2 = Thread {
                people2.walkPast(with: people1)
            }
            people1.isDifferendDirection = true
            thread2.start()
        })
        customQueue.sync(execute: dispatchWorkItem)
    }
}

class People1 {
    var isDifferendDirection = false
    
    func walkPast(with people: People2) {
        while (!people.isDifferendDirection) {
            print("People1 не может обойти People2")
            sleep(2)
        }
        
        print("People1 смог пройти прямо")
        isDifferendDirection = true
    }
}

class People2 {
    var isDifferendDirection = false
    
    func walkPast(with people: People1) {
        while (!people.isDifferendDirection) {
            print("People2 не может обойти People1")
            sleep(3)
        }
        
        print("People2 смог пройти прямо")
        isDifferendDirection = true
    }
}

/// Данная проблема называется liveLock (взаимная блокировка). Когда два потока не могут продвинуться в выполнении задач или завершить задачу из-за того, что постоянного реагируют друг на друга. 

