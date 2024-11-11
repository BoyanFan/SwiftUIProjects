//
//  ColorThemeProvider.swift
//  EleganceAlpha
//
//  Created by fanboyan on 2024/1/19.
//

import SwiftUI

class ColorThemeProvider {
    /// Regex
    static let numbers = "(\\b\\d*\\.?\\d+\\b)"
    static let comments = "(\\/\\/.+)"
    
    static let declaration = "(\\bvar\\b|\\blet\\b|\\bfunc|\\benum|\\bimport|\\bdisable|\\binit|\\bdeinit|\\boptional)"
    static let abstruction = "(\\bstruct\\b|\\bclass\\b|\\bprotocol|\\bextension|\\bprotocol)"
    static let encapsulation = "(\\bprivate\\b|\\bpublic\\b|\\bstatic\\b|\\bimport|\\bextends|\\bimplements)"
    static let closures = "(\\bwhere\\b|\\bin\\b)"
    static let generics = "(\\bsome\\b|\\bself\\b|\\bany\\b)"
    static let casts = "(\\bas\\b|\\btry\\b)"
    static let modifiers = "(\\@[a-z]+)"
    static let flow = "(\\bforeach\\b|\\binout\\b|\\breturn\\b|\\boperator|\\bfor|\\bif|\\belse|\\band|\\bor|\\bthrows)"
    
    static let properties = "(\\@([A-Z])\\w+)"
    static let types = "((?<=\\:)\\s?([A-Z])\\w+|(?<=\\:)\\s+([A-Z])\\w+)"
    static let references = "((?<=\\.)\\w+)"
    static let strings = "(\\\".+\\\")"
    static let symbols = "(\\.|\\:|\\s+\\:|w+\\:|\\[|\\()"
    
    /// Color Themes
    static let plainAppearcance = [NSAttributedString.Key.foregroundColor : NSColor.textColor]
    static let numberAppearcance = [NSAttributedString.Key.foregroundColor : NSColor(Color("EditorNumber"))]
    static let keywordAppearcance = [NSAttributedString.Key.foregroundColor : NSColor(Color("EditorKeyword"))]
    static let typeAppearcance = [NSAttributedString.Key.foregroundColor : NSColor(Color("EditorType"))]
    static let referenceAppearcance = [NSAttributedString.Key.foregroundColor : NSColor(Color("EditorReference"))]
    static let stringAppearcance = [NSAttributedString.Key.foregroundColor : NSColor(Color("EditorString"))]
    static let commentAppearcance = [NSAttributedString.Key.foregroundColor : NSColor(Color("EditorComment"))]
    
    /// Field Highlights
    static let theme: [String : [NSAttributedString.Key : Any]] = [
        numbers       : numberAppearcance,
        comments      : commentAppearcance,
        encapsulation : keywordAppearcance,
        declaration   : keywordAppearcance,
        abstruction   : keywordAppearcance,
        closures      : keywordAppearcance,
        generics      : keywordAppearcance,
        casts         : keywordAppearcance,
        modifiers     : keywordAppearcance,
        properties    : typeAppearcance,
        types         : typeAppearcance,
        references    : referenceAppearcance,
        strings       : stringAppearcance,
        symbols       : plainAppearcance,
        flow          : keywordAppearcance
    ]
}
