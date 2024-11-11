//
//  LyricsViewModel.swift
//  AppleMusic
//
//  Created by fanboyan on 2022/8/1.
//

import Foundation

class LyricsViewModel: ObservableObject {
    private static let nowPlaying = Song(
        title: "来自星空的问候",
        artist: "柏岩Boyan",
        coverName: "albumCover_starBlessing",
        length: 202,
        state: .demo,
        lyrics: [
            "ꔷ ꔷ ꔷ",
            "只是许久未曾仰望星空",
            "只是埋头生活直到雪崩",
            "只是忘了",
            "头顶还有星河璀璨",
            "直到消失",
            "抬头不见才懂遗憾",
            "天上是乌云还是星罗棋布",
            "她眼中的是憧憬还是 沧海一粟",
            "天上繁星喧哗着我们渺小",
            "她眼中却是灿烂还有炊烟袅袅",
            "为何夜晚会被霓虹染色",
            "为何梦里依然旧歌响彻",
            "为何不爱",
            "明明心里清楚答案",
            "直到消失",
            "抬头不见才懂遗憾",
            "天上是乌云还是星罗棋布",
            "她眼中的是憧憬还是 沧海一粟",
            "天上繁星喧哗着我们渺小",
            "她眼中却是灿烂还有炊烟袅袅",
            "看不清的脸庞",
            "连空白都恰到好处",
            "追不上的背影",
            "换做是谁都会义无反顾",
            "分秒针的错过",
            "重逢奈何不停脚步",
            "最浪漫的告别",
            "不过梦醒各自继续赶路",
            ""
        ])
    
    typealias Lyrics = Array<LyricsModel.Lyrics>
    typealias SongState = Song.SongState

    @Published var model = LyricsModel(song: nowPlaying) { lyrics in
        var collection = Array<LyricsModel.Lyrics>()
        
        for _index in lyrics.indices{
            collection.append(LyricsModel.Lyrics(content: lyrics[_index], id: _index))
        }
        
        return collection
    }
    
    var title: String { return model.title }
    var artist: String { return model.artist }
    var coverName: String { return model.coverName }
    var lyrics: Lyrics { return model.lyrics }
    var nowOnStage: Int { return model.nowOnStage }
    var songHasPlayedTime: String { return formatTime(model.songHasBeenPlayed) }
    var songRemainedTime: String { return "-" + formatTime(model.songRemianed) }
    var progress: Float { return model.progress }
    
    var stateText: String {
        switch state {
            case .demo: return "Demo"
            case .published: return "Published"
            case .deprecated: return "Deprecated"
        }
    }
    
    var stateImageName: String {
        switch state {
            case .demo: return "airpodsmax"
            case .published: return "square.and.arrow.up"
            case .deprecated: return "trash"
        }
    }
    
    private var state: SongState { return model.state }
    
    var isPlaying = false
    
    func nextLyrics() {
        model.nextLyrics()
    }
    
    func playing() {
        model.playing()
        
        print(model.songHasBeenPlayed, model.length, model.progress)
    }
    
    private func formatTime(_ time: Int) -> String {
        let minutes = time / 60
        let seconds = time % 60
        let formattedSecond = seconds < 10 ? "0\(seconds)" : "\(seconds)"

        return "\(minutes):\(formattedSecond)"
    }
}
