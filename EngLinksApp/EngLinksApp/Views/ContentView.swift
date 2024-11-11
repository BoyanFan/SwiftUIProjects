//
//  ContentView.swift
//  EngLinksApp
//
//  Created by fanboyan on 2023/4/11.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var engLinks: EngLinksApp
    
    @State var currentView: ViewIsShowing = .tutoringView
    
    var body: some View {
        ZStack {
            switch currentView {
                case .accountView: AccountView(model: engLinks)
                case .eventsView: EventsView(model: engLinks)
                case .resourcesView: ResourcesView(model: engLinks)
                case .tutoringView: TutoringView(model: engLinks)
            }
            
            navegationBar
        }
        
    }
    
    var navegationBar: some View {
        VStack {
            Spacer()
            
            HStack(spacing: 30) {
                VStack(spacing: 5) {
                    Image(systemName: currentView == .tutoringView ? "clipboard.fill" : "clipboard")
                        .font(.system(size: 26))
                        .frame(height: 34)
                    Text("Tutoring")
                        .fontWeight(currentView == .tutoringView ? .bold : .regular)
                        .font(.system(size: 16))
                }
                
                VStack(spacing: 5) {
                    Image(systemName: currentView == .resourcesView ? "newspaper.flag" : "newspaper")
                        .font(.system(size: 28))
                        .frame(height: 34)
                    Text("Resources")
                        .fontWeight(currentView == .resourcesView ? .bold : .regular)
                        .font(.system(size: 16))
                }
                
                VStack(spacing: 5) {
                    Image(systemName: currentView == .eventsView ? "flag.fill" : "flag")
                        .font(.system(size: 28))
                        .frame(height: 34)
                    Text("Events")
                        .fontWeight(currentView == .eventsView ? .bold : .regular)
                        .font(.system(size: 16))
                }
                
                VStack(spacing: 5) {
                    Image(systemName: currentView == .accountView ? "person.fill" : "person")
                        .font(.system(size: 28))
                        .frame(height: 34)
                    Text("Account")
                        .fontWeight(currentView == .accountView ? .bold : .regular)
                        .font(.system(size: 16))
                }
            }
            .foregroundColor(.white)
            .frame(width: 500)
            .padding(.bottom, 26)
            .padding(.top, 10)
            .background(Rectangle().foregroundColor(.accentColor))
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static let test = EngLinksApp()
    
    static var previews: some View {
        ContentView(engLinks: test)
    }
}
