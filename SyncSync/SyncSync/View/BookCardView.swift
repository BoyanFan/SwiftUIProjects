//
//  BookCardView.swift
//  SyncSync
//
//  Created by fanboyan on 2023/1/14.
//

import SwiftUI

struct BookCardView: View {
    // This is the view for the book card, which takes a Media and presente it as a CardView
    var book: Media
    
    var something: Int = 3
    
    @State var state: Media.State = .unmarked
    
    var body: some View {
        HStack(spacing: 25) {
            // The cover for this book
            Image(book.cover)
                .resizable()
                .aspectRatio(2/3, contentMode: .fit)
                .frame(maxWidth: 100)
                .mask(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 10)
                .padding(5)
            
            VStack(alignment: .leading, spacing: 20) {
                // The title of this book
                Text(book.title).font(.system(size: 20, weight: .bold))
                
                // Show the state of this book
                if state == .unmarked { buttons }
                if state == .favorite { favorited }
                if state == .disliked { disliked }
            }
            
            Spacer()
        }
        .padding(20)
        .frame(width: 350, height: 200)
        .background(.white)
        .mask(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 10)
    }
    
    var buttons: some View {
        HStack(spacing: 20) {
            // Button for favorite
            Button(action: { state = .favorite }) {
                Image(systemName: "suit.heart.fill")
                    .foregroundColor(.pink)
                    .font(.system(size: 30))
                    .padding(10)
                    .background(Circle().foregroundColor(.pink.opacity(0.2)))
            }
            
            // Button for dislike
            Button(action: { state = .disliked }) {
                Image(systemName: "trash.fill")
                    .foregroundColor(.gray)
                    .font(.system(size: 30))
                    .padding(10)
                    .background(Circle().foregroundColor(.gray.opacity(0.2)))
            }
        }
    }
    
    var favorited: some View {
        Text("favorited".uppercased())
            .font(.system(size: 15, weight: .bold))
            .foregroundColor(.pink)
            .padding(5)
            .padding(.horizontal, 10)
            .background(RoundedRectangle(cornerRadius: 20).foregroundColor(.pink.opacity(0.2)))
    }
    
    var disliked: some View {
        Text("disliked".uppercased())
            .font(.system(size: 15, weight: .bold))
            .foregroundColor(.secondary)
            .padding(5)
            .padding(.horizontal, 10)
            .background(RoundedRectangle(cornerRadius: 20).foregroundColor(.secondary.opacity(0.2)))
    }
}

struct BookCardView_Previews: PreviewProvider {
    static var testBook = Media(title: "Nineteen Eighty Four", author: "Someone", cover: "_C1",
                                mediaType: .book, mediaTag: [.futuristic, .sad, .action], state: .unmarked)
    
    static var previews: some View {
        BookCardView(book: testBook)
    }
}
