//
//  EleganceEditorTextField.swift
//  EleganceAlpha
//
//  Created by fanboyan on 2024/1/16.
//

import SwiftUI

struct EleganceEditorTextField: NSViewRepresentable {
    /// The content the EleganceEditor needs to present
    @Binding var content: String
    
    /// Current editing line
    @Binding var selection: Range<Int>
        
    /// The permission to modify the content: Read-only, Read-and-write
    var isEditable = true
    
    let textStorage = NSTextStorage()
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeNSView(context: Context) -> NSTextView {
        let layoutManager = NSLayoutManager()
        let container = NSTextContainer()
        
        container.widthTracksTextView = true
        layoutManager.addTextContainer(container)
        
        textStorage.addLayoutManager(layoutManager)
        textStorage.append(makeAttributedString(for: content))
        
        let textView = NSTextView(frame: .zero, textContainer: container)
        
        textView.delegate = context.coordinator
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.autoresizingMask = [.width, .height]
        
        // Configurations
        textView.isAutomaticQuoteSubstitutionEnabled = false
        textView.isAutomaticDashSubstitutionEnabled = false
        
        textView.importsGraphics = true
        textView.allowsUndo = true
        textView.isEditable = isEditable
        textView.backgroundColor = NSColor(Color("EditorBackground"))
        
        return textView
    }
    
    func updateNSView(_ nsView: NSTextView, context: Context) {
        if (nsView.string != content) {
            nsView.textStorage!.setAttributedString(makeAttributedString(for: content))
        }
        
        context.coordinator.updateAttributedString(for: content)
    }
    
    func makeAttributedString(for content: String) -> NSMutableAttributedString {
        // Make the content "attributable"
        let attributedString = NSMutableAttributedString(string: content)
        
        // Make paragraph style
        let paragraphStyle = NSMutableParagraphStyle()
        
        // Properties
        let range = NSRange(location: 0, length: attributedString.length)
        let size = NSFont.systemFontSize
        let font = [NSAttributedString.Key.font: NSFont(name: "SF Mono", size: size) ?? NSFont.systemFont(ofSize: size)]
        let color = [NSAttributedString.Key.foregroundColor: NSColor.textColor]
        
        paragraphStyle.lineSpacing = 7
        let spacing = [NSAttributedString.Key.paragraphStyle: paragraphStyle]

        // Set font
        attributedString.addAttributes(font, range: range)
        
        // Set color
        attributedString.addAttributes(color, range: range)
        
        // Set spacing
        attributedString.addAttributes(spacing, range: range)
        
        return attributedString
    }
    
    class Coordinator: NSObject, NSTextViewDelegate {
        let parent: EleganceEditorTextField
        
        init(parent: EleganceEditorTextField) {
            self.parent = parent
            super.init()
        }
        
        func textDidChange(_ notification: Notification) {
            if let textView = notification.object as? NSTextView {
                parent.content = textView.string
            }
        }
        
        /// Get the current edting line
        func textViewDidChangeSelection(_ notification: Notification) {
            if let textView = notification.object as? NSTextView {
                let selectedRange = textView.selectedRange()
                let selectedLineRange = (textView.string as NSString).lineRange(for: selectedRange)
                
                // Get the line number of the selected line
                let selectedLine = textView.string.lineRange(for: selectedLineRange)
                parent.selection = selectedLine
            }
        }
        
        /// Highlight content
        func updateAttributedString(for content: String) {
            parent.textStorage.addAttributes(ColorThemeProvider.plainAppearcance, range: NSRange(content.startIndex..., in: content))
            
            for (pattern, attribute) in ColorThemeProvider.theme {
                let regex = try? NSRegularExpression(pattern: pattern)
                let range = NSRange(content.startIndex..., in: content)
                
                regex?.enumerateMatches(in: content, range: range) { match, _, _ in
                    if let matches = match?.range(at: 1) { parent.textStorage.addAttributes(attribute, range: matches) }
                }
            }
        }
        
        /// Show autocompletion
        //        func showAutocompleteSuggestions(in textView: NSTextView) {
        //            // Get the range for the word to complete
        //            let wordRange = textView.rangeForUserCompletion
        //
        //            // Return if there is nothing to complete for the current cursor position
        //            if (wordRange.length == 0) { return }
        //
        //            // Get completions
        //            var selectedItem: Int = 0
        //            let selectedItemPointer: UnsafeMutablePointer<Int>? = .init(&selectedItem)
        //            let completions: [String]? = textView.completions(forPartialWordRange: textView.rangeForUserCompletion,
        //                                                              indexOfSelectedItem: selectedItemPointer!)
        //        }
    }
}
