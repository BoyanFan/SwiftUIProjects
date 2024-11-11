//
//  LineNumberView.swift
//  EleganceAlpha
//
//  Created by fanboyan on 2024/1/18.
//

import SwiftUI

struct LineNumberView: View {
    /// The total number of lines of the presented content
    let length: Int
    
    /// The selected lines
    var selection: Range<Int>
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 7) {
            ForEach(Range(1...length), id: \.self) { index in
                Text("\(index)")
                    .font(.custom("SF Mono", size: NSFont.systemFontSize))
                    .opacity(selection.contains(index) ? 1.0 : 0.5)
            }
            
            // Placeholder
            Text("000").opacity(0)
            
            Spacer()
        }
    }
}
