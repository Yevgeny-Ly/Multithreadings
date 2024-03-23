//
//  RightPrioritiesViewController.swift
//  Multithreading
//
//

import UIKit

class RightPrioritiesViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Создаем и запускаем поток
        let thread1 = ThreadprintDemon()
        let thread2 = ThreadprintAngel()
        
        /// Меняем приоритеты (1, 2)
//        thread1.qualityOfService = .userInteractive
//        thread2.qualityOfService = .background
        
        /// Меняем приоритеты (2, 1)
        thread1.qualityOfService = .background
        thread2.qualityOfService = .userInteractive
        
        /// Меняем приоритеты (вперемешку)
//        thread1.qualityOfService = .userInitiated
//        thread2.qualityOfService = .userInitiated
        
        thread1.start()
        thread2.start()
        
    }

    class ThreadprintDemon: Thread {
        override func main() {
            for _ in (0..<100) {
                print("1")
            }
        }
    }
    class ThreadprintAngel: Thread {
        override func main() {
            for _ in (0..<100) {
                print("2")
            }
        }
    }
}
