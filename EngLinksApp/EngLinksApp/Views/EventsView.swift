//
//  EventsView.swift
//  EngLinksApp
//
//  Created by fanboyan on 2023/4/11.
//

import SwiftUI

struct EventsView: View {
    @ObservedObject var model: EngLinksApp
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView(model: EngLinksApp())
    }
}
