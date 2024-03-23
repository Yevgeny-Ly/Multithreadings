//
//  ConsoleOrderViewController.swift
//  Multithreading
//
//  Created by Евгений Л on 19.03.2024.
//

import UIKit

class ConsoleOrderViewController: UIViewController {
    
    private let lockQueue = DispatchQueue(label: "mane.lock.queue")
    private var name = "Введите имя"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateName()
    }
    
    func updateName() {
        DispatchQueue.global().async {
            self.lockQueue.async {
                self.name = "I love RM" /// Перезаписываем имя в другом потоке
                print(Thread.current)
                print(self.name)
            }
        }
        
        lockQueue.async {
            print(self.name) /// Считываем имя из main
        }

    }
}

/// Оба потока хотят использовать один и тот же блок кода и получается конфликт под названием "гонка данных" чтобы его решить нужно эти два потока синхронизировать. В этом нам поможет блокировка lock.
