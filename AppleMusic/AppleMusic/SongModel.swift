//
//  SongModel.swift
//  AppleMusic
//
//  Created by fanboyan on 2022/8/1.
//

import Foundation

struct Song {
    let title: String
    let artist: String
    let coverName: String
    let length: Int
    let state: SongState
    let lyrics: Array<String>

    enum SongState {
        case demo, published, deprecated
    }
}
