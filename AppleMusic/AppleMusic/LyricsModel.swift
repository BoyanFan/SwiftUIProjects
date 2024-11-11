//
//  LyricsModel.swift
//  AppleMusic
//
//  Created by fanboyan on 2022/8/1.
//

import Foundation

struct LyricsModel {
    let title: String
    let artist: String
    let coverName: String
    let length: Int
    let state: Song.SongState
    var lyrics: Array<Lyrics>
    var songHasBeenPlayed: Int
    
    var nowOnStage: Int {
        willSet { lyrics[newValue].isOnStage = true }
        didSet {
            if oldValue >= 0 { lyrics[oldValue].isOnStage = false }
        }
    }
    
    var songRemianed: Int { return length - songHasBeenPlayed }
    var progress: Float { return Float(songHasBeenPlayed) / Float(length) }
    
    init(song: Song, lyrics: (Array<String>) -> Array<Lyrics>) {
        self.title = song.title
        self.artist = song.artist
        self.length = song.length
        self.state = song.state
        self.lyrics = lyrics(song.lyrics)
        self.coverName = song.coverName
        self.nowOnStage = -1
        self.songHasBeenPlayed = 0
    }
    
    struct Lyrics: Identifiable {
        let id: Int
        let content: String
        var isOnStage: Bool
        
        init(content: String, id: Int) {
            self.content = content
            self.id = id
            self.isOnStage = false
        }
    }
    
    mutating func nextLyrics() {
        if nowOnStage <= lyrics.endIndex { nowOnStage += 1 }
    }
    
    mutating func playing() {
        if songHasBeenPlayed <= length {
            songHasBeenPlayed += 1
        }
    }
}
