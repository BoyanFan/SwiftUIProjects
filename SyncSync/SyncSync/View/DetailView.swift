//
//  DetailView.swift
//  SyncSync
//
//  Created by fanboyan on 2023/1/14.
//

import SwiftUI

struct DetailView: View {
    var media: Media
    
    var body: some View {
        // Some View for detail...
        
        VStack {
            // Cover
            Image(media.cover)
                .resizable()
                .aspectRatio(media.mediaType == .music ? 1/1 : 2/3, contentMode: .fit)
                .frame(width: 300)
                .mask(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 20)
                .padding(.vertical, 50)
            
            // Title and author
            Text(media.title).font(.title).fontWeight(.bold).padding(5)
            Text(media.author).font(.headline).foregroundColor(.secondary)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var testBook = Media(title: "Nineteen Eighty Four", author: "Someone", cover: "_C1",
                                mediaType: .book, mediaTag: [.futuristic, .sad, .action], state: .unmarked)
    
    static var previews: some View {
        DetailView(media: testBook)
    }
}
