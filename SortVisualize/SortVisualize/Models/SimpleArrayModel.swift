//
//  SortedArrayModel.swift
//  SortVisualize
//
//  Created by Sergii Lisnyi on 5/11/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation

class SimpleArrayModel: TypeArrayModelProtocol {
    
    var name: String = InputDataEnum.simple.title
    var dictionaryData: [Int: [Int]]
    var type: InputDataEnum = .simple
    
    init() {
        let data1k = Array.createArray(size: 1000)
        let data2k = Array.createArray(size: 2000)
        let data4k = Array.createArray(size: 4000)
        let data8k = Array.createArray(size: 8000)
        let data16k = Array.createArray(size: 1000) //16K
        dictionaryData = [1000 : data1k, 2000: data2k, 4000 : data4k, 8000: data8k,16000 : data16k]
    }
    
    var count: Int {
        get {
            return dictionaryData.count
        }
    }
}
