//
//  LineRange.swift
//  EleganceAlpha
//
//  Created by fanboyan on 2024/1/18.
//

import SwiftUI

extension StringProtocol {
    func lineRange(for selection: NSRange) -> Range<Int> {
        var lowerBound = 1
        var upperBound = 1
        
        var parser = startIndex
        var counter = 0
        
        // Find lower bound
        while parser < endIndex && counter < selection.lowerBound {
            if self[parser] == "\n" { lowerBound += 1 }
            
            counter += 1
            parser = self.index(after: parser)
        }
        
        upperBound = lowerBound
        
        // Find upper bound
        while parser < endIndex && counter < (selection.upperBound - 1) {
            if self[parser] == "\n" { upperBound += 1 }
            
            counter += 1
            parser = self.index(after: parser)
        }
        
        return Range(lowerBound...upperBound)
    }
}
