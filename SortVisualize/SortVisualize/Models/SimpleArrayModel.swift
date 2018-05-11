//
//  SortedArrayModel.swift
//  SortVisualize
//
//  Created by Sergii Lisnyi on 5/11/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation

class SimpleArrayModel: TypeArrayModelProtocol {
    
    var name: String = TypeArrayEnum.simple.title
    var dictionary: [Int: [Int]]

    init() {
        let data1k = Array<Int>.createArray(count: 1000)
        let data2k = Array<Int>.createArray(count: 2000)
        let data4k = Array<Int>.createArray(count: 4000)
        let data8k = Array<Int>.createArray(count: 8000)
        let data16k = Array<Int>.createArray(count: 1000) 
        dictionary = [1000 : data1k, 2000: data2k, 4000 : data4k, 8000: data8k,16000 : data16k]
    }
    
    var count: Int {
        get {
            return dictionary.count
        }
    }
    
}
