//
//  EleganceEditorView.swift
//  EleganceAlpha
//
//  Created by fanboyan on 2024/1/18.
//

import SwiftUI

struct EleganceEditorView: View {
    @State private var content: String = "Hello World!"
    @State private var selection: Range<Int> = 1..<2
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            HStack(alignment: .top, spacing: 0) {
                LineNumberView(length: content.components(separatedBy: .newlines).count, selection: selection)
                    .frame(minWidth: 30, maxWidth: 30)
                    .padding(.init(top: 5, leading: 5, bottom: 0, trailing: 10))
                    .background(Color("EditorBackground"))
                
                EleganceEditorTextField(content: $content, selection: $selection, isEditable: true)
                    .frame(minWidth: 200, maxWidth: .infinity, minHeight: 200, maxHeight: .infinity)
                    .border(Color.clear, width: 0)
                    .padding(.init(top: 5, leading: 0, bottom: 0, trailing: 0))
            }
        }
        .background(Color("EditorBackground"))
    }
}
