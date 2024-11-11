//
//  EngLinks.swift
//  EngLinksApp
//
//  Created by fanboyan on 2023/4/11.
//

import Foundation

class EngLinksApp: ObservableObject {
    private(set) var tutoring = Tutoring()
    
    @Published var something: String = "Nothing"
}
