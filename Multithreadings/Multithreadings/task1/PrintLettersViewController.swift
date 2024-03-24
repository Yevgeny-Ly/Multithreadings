//
//  PrintLettersViewController.swift
//  Multithreading
//
//  Created by Евгений Л on 19.03.2024.
//

import UIKit

class PrintLettersViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("A")
        
        DispatchQueue.main.async {
            print("B")
        }
        print("C")
    }
}

/// A, C, B  код выполняется сверху вниз и наша B встает в очередь на выполнение, так как она будет выполняться в асинхронном коде. Выполнение ее произойдет после C
