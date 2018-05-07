//
//  Model.swift
//  SortVisualize
//
//  Created by Sergii Lisnyi on 5/7/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation

class Model {
    
    var array: [Int] = [1,6,8,0,2]
    var step = 0
    
    
    func createArray() -> [Int] {
        var tmpArray: [Int] = []
        for _ in 0..<10 {
            tmpArray.append(Int(arc4random_uniform(UInt32(10))))
        }
        return tmpArray
    }
    
    
    func sortBubble() -> (at: Int, to: Int, finish: Bool) {
        for barrier in (step..<array.endIndex).reversed() {
            step = barrier
            for var i in 0..<barrier {
                if array[i] > array[i + 1] {
                    let tmp = array[i]
                    array[i] = array[i + 1]
                    array[i + 1] = tmp

                    print(array)
                    print("i \(i)")
                    return (at: i, to: i + 1, finish: false)

                }
            }
        }
        
        return (at: 0, to: 0, finish: true)

    }
    
//    func sortBubble (_ array: [Int]) -> [Int] {
//        var arr = array
//        for barrier in (0..<arr.endIndex).reversed() {
//
//            for var i in 0..<barrier {
//                if arr[i] > arr[i + 1] {
//                    let tmp = arr[i]
//                    arr[i] = arr[i + 1]
//                    arr[i + 1] = tmp
//
//                    print(arr)
//                }
//            }
//        }
//        return arr
//    }
//
    
    
    
    
    // sort "Insert"
    func sortInsert (_ array: [Int]) -> [Int] {
        var arr = array
        for k in (1..<arr.endIndex) {
            let newElement = arr[k]
            var location = k - 1
            while ((location >= 0) && (arr[location]) > newElement) {
                arr[location + 1] = arr[location]
                location = location - 1
            }
            arr [location + 1] = newElement
        }
        return arr
    }
    
    // sort "Selection"
    func sortSelection (_ array: [Int]) -> [Int] {
        var arr = array
        for barrier in (0..<arr.endIndex) {
            var index = barrier + 1
            for index in 0..<barrier {
                if arr[barrier] < arr[index] {
                    let tmp = arr[index]
                    arr[index] = arr[barrier]
                    arr[barrier] = tmp
                }
            }
        }
        return arr
    }
    
    
    
}
