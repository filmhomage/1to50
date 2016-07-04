//
//  Extension.swift
//  oneTo50
//
//  Created by earth on 7/4/16.
//  Copyright © 2016 kokaru.com. All rights reserved.
//

import Foundation

extension Array {
    
    var shuffle:[Element] {
        var elements = self
        for index in 0..<elements.count {
            let newIndex = Int(arc4random_uniform(UInt32(elements.count-index)))+index
            if index != newIndex {
                swap(&elements[index], &elements[newIndex])
            }
        }
        return elements
    }
    func groupOf(n:Int)-> [[Element]] {
        var result:[[Element]]=[]
        for i in 0...(count/n)-1 {
            var tempArray:[Element] = []
            for index in 0...n-1 {
                tempArray.append(self[index+(i*n)])
            }
            result.append(tempArray)
        }
        
        return result
    }
}
