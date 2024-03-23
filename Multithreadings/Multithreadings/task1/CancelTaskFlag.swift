//
//  CancelTaskFlag.swift
//  Multithreading
//
//

import UIKit

class CancelTaskFlag: UIViewController {
    
    override func viewDidLoad () {
        super.viewDidLoad()
        
        /// Создаем и запускаем поток
        let infinityThread = InfinityLoop()
        infinityThread.start()
        print(infinityThread.isExecuting)
        
        /// Подождем некоторое время, а затем отменяем выполнение потока
        sleep(2)
        
        /// Отменяем тут
        infinityThread.cancel()
        print(infinityThread.isCancelled)
    }
}

class InfinityLoop: Thread {
    var counter = 0
    
    override func main() {
        while counter < 30 && !isCancelled {
            Timer.scheduledTimer(withTimeInterval: 0, repeats: true) { _ in
                self.counter += 1
                print(self.counter)
                InfinityLoop.sleep(forTimeInterval: 1)
            }
            RunLoop.current.run(until: Date() + 5)
        }
    }
}

