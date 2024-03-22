//
//  RMOperationViewController.swift
//  Multithreading
//
//

import UIKit

protocol RMOperationProtocol {
    // Приоритеты
    var priority: DispatchQoS.QoSClass { get }
    // Выполняемы блок
    var completionBlock: (() -> Void)? { get }
    // Выполняется ли операция
    var isExecuting: Bool { get }
    // Завершена ли операция
    var isFinished: Bool { get }
    // Метод для запуска операций
    func start()
}

class RMOperation: RMOperationProtocol {
    
    var priority: DispatchQoS.QoSClass = .background
    var completionBlock: (() -> Void)?
    var isExecuting = false
    var isFinished = false
    
    /// В методе start. реализуйте все через глобальную паралельную очередь с приоритетами.
    func start() {
        self.completionBlock?()
        isFinished = true
    }
}

class RoadMapViewController: UIViewController {
    let operationFirst = Operation()
    let operationSecond = Operation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        operationFirst.qualityOfService = .background
        operationFirst.completionBlock = {
            for _ in 0..<50 {
                print(2)
            }
            print(Thread.current)
            print("Операция полностью завершена!")
        }
        operationFirst.start()
        
        operationSecond.qualityOfService = .background
        operationSecond.completionBlock = {
            for _ in 0..<50 {
                print(1)
            }
            print(Thread.current)
            print("Операция полностью завершена!")
        }
        operationSecond.start()
    }
}

