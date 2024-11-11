//
//  MediaModel.swift
//  SyncSync
//
//  Created by fanboyan on 2023/1/14.
//

import Foundation

struct Media: Identifiable {
    // A struct for medias like movie, music, book...

    // The basic information of this media
    let title: String
    let author: String
    let cover: String

    // More properties for algorithm and furture detail
    let mediaType: MediaType
    let mediaTag: [Tag]
    var state: State = .unmarked
    
    // For making media identifiable, it requres an id
    var id = UUID()
    
    // The type of this media
    enum MediaType {
        case movie, music, book, podcast, television
    }
    
    // The tag for this media, where the algorithm will base on tags
    enum Tag {
        case modern, old, futuristic, sad, happy, fear, action, romance, comedy
    }
    
    enum State {
        case favorite, disliked, unmarked
    }
}

extension Media {
    // Some functionalities for media...
    
    // Function for mark this media as the favorite
    mutating func favorited() {
        self.state = .favorite
    }
    
    // Function for mark this media as the disliked
    mutating func disliked() {
        self.state = .disliked
    }
}
