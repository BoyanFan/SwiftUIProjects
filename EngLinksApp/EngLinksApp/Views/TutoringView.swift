//
//  TutoringView.swift
//  EngLinksApp
//
//  Created by fanboyan on 2023/4/11.
//

import SwiftUI

struct TutoringView: View {
    @ObservedObject var model: EngLinksApp
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 14) {
                SearchBar()
                ProfileView()
            }
            
            Text("Requests").font(.title).fontWeight(.bold).padding(.vertical, 10)
            
            HStack(spacing: 12) {
                CardView(title: "Incoming", icon: "calendar", color: Color.green)
                CardView(title: "Accepted", icon: "checkmark", color: Color.yellow)
            }.padding(.bottom, 4)
            
            HStack(spacing: 12) {
                CardView(title: "Accomplished", icon: "doc.plaintext", color: Color.gray)
                CardView(title: "Accepted", icon: "checkmark", color: Color.yellow).opacity(0)
            }
            
            Text("Credentials").font(.title).fontWeight(.bold).padding(.top, 20)
            
            VStack(spacing: 0) {
                Selection(content: "Aquire a credential", icon: "star.bubble")
                
                ZStack {
                    Rectangle().frame(width: 340, height: 1).opacity(0.2).offset(x: 36)
                    Rectangle().frame(width: 350, height: 1).opacity(0.06)
                }
                
                Selection(content: "View my credential", icon: "scroll")
            }.mask(RoundedRectangle(cornerRadius: 10))
            
//            Text("A notification will be sent during the reviewing. The credential will be reviewed by Engineering Council. Please email them if you have any questions.".uppercased())
//                .frame(width: 350)
//                .opacity(0.3)
//                .font(.system(size: 14))
//                .padding(.horizontal, 3)
            
            Text("Report").font(.title).fontWeight(.bold).padding(.top, 20)
            
            Selection(content: "Report a problem", icon: "exclamationmark.bubble")
                .mask(RoundedRectangle(cornerRadius: 10))
            
//            Text("If you have any questions or need any help while tutring matching, please contact the EngLinks team.".uppercased())
//                .frame(width: 350)
//                .opacity(0.3)
//                .font(.system(size: 14))
//                .padding(.horizontal, 3)
            
            Spacer()
        }
    }
}

struct SearchBar: View {
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 280, height: 40)
                .foregroundColor(.gray).opacity(0.12)
            HStack(spacing: 5) {
                Image(systemName: "magnifyingglass")
                Text("Search")
            }.foregroundColor(.secondary).padding(.horizontal, 15)
        }
    }
}

struct Selection: View {
    let content: String
    let icon: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 0)
                .frame(width: 350, height: 40)
                .foregroundColor(.gray).opacity(0.12)
            
            HStack(spacing: 5) {
                Image(systemName: icon)
                Text(content).font(.system(size: 16))
            }.foregroundColor(.black).padding(.horizontal, 15)
        }
    }
}

struct ProfileView: View {
    var body: some View {
        Image("Profile")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 50)
            .mask(Circle())
    }
}

struct CardView: View {
    let title: String
    let icon: String
    let color: Color
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 170, height: 100)
                .foregroundColor(.gray).opacity(0.12)
            
            VStack(alignment: .leading, spacing: 10) {
                Circle().fill(color).overlay {
                    Image(systemName: icon).foregroundColor(.white).font(.system(size: 22))
                }
                Text(title).fontWeight(.bold)
            }
            .padding(15)
            .frame(height: 100)
        }
        
    }
}

struct TutoringView_Previews: PreviewProvider {
    static var previews: some View {
        TutoringView(model: EngLinksApp())
    }
}
