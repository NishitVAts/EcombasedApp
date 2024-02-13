//
//  asynSyncTest.swift
//  E-Commerce App
//
//  Created by Nishit Vats on 19/02/24.
//

import Foundation
func queueTesting(){
    let myQueue = DispatchQueue(label: "khi", attributes: .concurrent)
    
    myQueue.async {
        print("Task 1 Started")
        for index in 1...15{
            print("Task 1 executing \(index)")
        }
        print("Task 1 Ended")
    }
    
    myQueue.async {
        print("Task 2 Started")
        for index in 1...5{
            print("Task 2 executing \(index)")
        }
        print("Task 2 Ended")
    }
}

