//
//  ResourcesView.swift
//  EngLinksApp
//
//  Created by fanboyan on 2023/4/11.
//

import SwiftUI

struct ResourcesView: View {
    @ObservedObject var model: EngLinksApp
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ResourcesView_Previews: PreviewProvider {
    static var previews: some View {
        ResourcesView(model: EngLinksApp())
    }
}
