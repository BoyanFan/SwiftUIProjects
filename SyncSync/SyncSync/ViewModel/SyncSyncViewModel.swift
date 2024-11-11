//
//  SyncSyncViewModel.swift
//  SyncSync
//
//  Created by fanboyan on 2023/1/14.
//

import Foundation

class SyncSyncViewModel: ObservableObject {
    // Some books from database server...
    var books: Array<Media> = [Media(title: "Nineteen Eighty Four", author: "Someone", cover: "_C1", mediaType: .book,
                                    mediaTag: [.futuristic, .sad, .action]),
                              Media(title: "Hunger Games", author: "Someone", cover: "_C2", mediaType: .book,
                                    mediaTag: [.futuristic, .fear, .action]),
                              Media(title: "Cats Cradle", author: "Someone", cover: "_C5", mediaType: .book,
                                    mediaTag: [.futuristic, .happy, .action]),
                              Media(title: "Life of Pi", author: "Someone", cover: "_C6", mediaType: .book,
                                    mediaTag: [.modern, .sad, .action]),
                              Media(title: "Good Omens", author: "Someone", cover: "_C7", mediaType: .book,
                                    mediaTag: [.futuristic, .happy, .comedy]),
                              Media(title: "Call of the Wild", author: "Someone", cover: "_C8", mediaType: .book,
                                    mediaTag: [.modern, .happy, .action]),
                              Media(title: "Beloved", author: "Someone", cover: "_C10", mediaType: .book,
                                    mediaTag: [.old, .sad, .comedy]),
                              Media(title: "Little Women", author: "Someone", cover: "_C11", mediaType: .book,
                                    mediaTag: [.old, .happy, .romance]),
                              Media(title: "The Little Prince", author: "Someone", cover: "_C1", mediaType: .book,
                                    mediaTag: [.old, .happy, .action])
    ]
    
    // Some music from database server...
    var musics: Array<Media> = [Media(title: "IGOR", author: "Tylor the Creator", cover: "_A1", mediaType: .music, mediaTag: [.happy]),
                                Media(title: "Dawn FM", author: "The Weeknd", cover: "_A2", mediaType: .music, mediaTag: [.sad]),
                                Media(title: "Dearmland", author: "Glass Animal", cover: "_A3", mediaType: .music, mediaTag: [.happy])]
    
    // Some movies from database server...
    var movies: Array<Media> = [Media(title: "1917", author: "Someone", cover: "_M1", mediaType: .movie, mediaTag: [.sad]),
                                Media(title: "Intersteller", author: "Someone", cover: "_M2", mediaType: .movie, mediaTag: [.sad]),
                                Media(title: "Tenet", author: "Someone", cover: "_M3", mediaType: .movie, mediaTag: [.sad])]
    
    // Some movies from database server...
    var friends: Array<Friend> = [Friend(name: "Neil", color: .yellow),
                                  Friend(name: "Emma", color: .pink),
                                  Friend(name: "Imogen", color: .blue),
                                  Friend(name: "William", color: .green),
                                  Friend(name: "Add...", color: .gray)
    ]
    
    // A function for marking this book as the favorite and remove this from books array currently displaying
    func favorited(this book: Media) {
        books[index(of: book)].favorited()
    }
    
    // A function for marking this book as disliked and remove this from books array currently displaying
    func disliked(this book: Media) {
        books[index(of: book)].disliked()
    }
    
    // A function for find the index of this book in the book array
    private func index(of media: Media) -> Int {
        for index in 0..<books.count {
            if media.id == books[index].id { return index }
        }
        return 0
    }
}
