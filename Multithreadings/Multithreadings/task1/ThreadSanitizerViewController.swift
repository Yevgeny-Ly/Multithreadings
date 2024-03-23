//
//  ThreadSanitizerViewController.swift
//  Multithreading
//
//

import UIKit

class ThreadSanitizerViewController: UIViewController {
    
    var lock = NSLock()
    private lazy var name = "I love RM"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateName()
    }
    
    func updateName() {
        DispatchQueue.global().async {
            self.lock.lock()
            print(self.name) /// Считываем имя из global
            print(Thread.current)
            self.lock.unlock()
        }
        lock.lock()
        print(self.name) /// Считываем имя из main
        lock.unlock()
    }
}

/// Оба потока хотят одновременно достучаться к одному и тому же ресурсу. В итоге получается конфликт под названием "гонка данных" чтобы его решить, нужно потоки синхронизировать. В этом поможет более узконаправленный механизм (по сравнениею с private let lockQueue = DispatchQueue(label: "mane.lock.queue")) NSLock. Блокируем сначала один поток, он выполняет задачу и после выполнения разблокируем. Тоже самое делаем и с вторым потоком.
