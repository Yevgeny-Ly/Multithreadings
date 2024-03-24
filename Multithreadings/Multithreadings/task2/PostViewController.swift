//
//  PostViewController.swift
//  Multithreading
//
//

import UIKit

class PostViewController: UIViewController {
    
    class Post: @unchecked Sendable {
        
    }
    
    enum State1: Sendable {
        case loading
        case data(String)
    }
    
    enum State2: Sendable {
        case loading
        case data(String)
    }
}
