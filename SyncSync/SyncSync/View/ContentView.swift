//
//  ContentView.swift
//  SyncSync
//
//  Created by fanboyan on 2023/1/14.
//

import SwiftUI

struct ContentView: View {
    // The main view for this app...
    
    // The ViewModel for this view
    @ObservedObject var data: SyncSyncViewModel
    
    // Current displaying view
    @State var mainView: CurrentView = .recommentation
    
    // View Body
    var body: some View {
        if mainView == .preference { preference }
        if mainView == .recommentation { recommentation }
        
        // There will be more views...
    }
    
    enum CurrentView {
        case preference, recommentation
    }
    
    // The Preference View
    var preference: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 30) {
                    ForEach(data.books) { book in
                        BookCardView(book: book)
                    }
                    
                    // The button after like or dislike
                    Button(action: { mainView = .recommentation }) {
                        Text("Next")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(10)
                            .padding(.horizontal, 20)
                            .background(RoundedRectangle(cornerRadius: 20).foregroundColor(.primary))
                            
                    }
                }
                .padding()
            }
            .navigationTitle("Select your books")
        }
    }
    
    // The Recommentation View
    var recommentation: some View {
        NavigationStack {
            ScrollView {
                // Book Recommentation View
                bookRecommentation
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    // Music Recommentation View
                    Text("Music").font(.title).fontWeight(.bold).padding(.horizontal, 20)
                    musicRecommentation
                    
                    // Movie Recommentation View
                    Text("Movie").font(.title).fontWeight(.bold).padding(.horizontal, 20)
                    movieRecommentation
                    
                    // Friend Recommentation View
                    Spacer().frame(height: 20)
                    Text("Friends").font(.title).fontWeight(.bold).padding(.horizontal, 20)
                    friendRecommentation
                }
            }
            .navigationTitle("Recommentation")
        }
    }
    
    // Book Recommentation View
    var bookRecommentation: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(data.books) { book in
                    NavigationLink(destination: DetailView(media: book)) {
                        Image(book.cover)
                            .resizable()
                            .aspectRatio(2/3, contentMode: .fit)
                            .frame(height: 300)
                            .padding(.horizontal, 5)
                            .padding(.vertical, 20)
                            .shadow(color: .black.opacity(0.5), radius: 10)
                    }
                }
            }
            .padding(.horizontal, 15)
        }
    }
    
    // Music Recommentation View
    var musicRecommentation: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(data.musics) { music in
                    VStack(alignment: .leading, spacing: 3) {
                        NavigationLink(destination: DetailView(media: music)) {
                            Image(music.cover)
                                .resizable()
                                .aspectRatio(1/1, contentMode: .fit)
                                .frame(height: 200)
                                .mask(RoundedRectangle(cornerRadius: 10))
                                .padding(.vertical, 5)
                        }
                        Text(music.title).font(.headline)
                        Text(music.author).foregroundColor(.secondary)
                    }
                }
            }
            .padding(.horizontal, 20)
        }
    }
    
    // Movie Recommentation View
    var movieRecommentation: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(data.movies) { movie in
                    VStack(alignment: .leading, spacing: 3) {
                        NavigationLink(destination: DetailView(media: movie)) {
                            Image(movie.cover)
                                .resizable()
                                .aspectRatio(2/3, contentMode: .fit)
                                .frame(height: 300)
                                .mask(RoundedRectangle(cornerRadius: 10))
                                .padding(.vertical, 5)
                        }
                        Text(movie.title).font(.headline)
                        Text(movie.author).foregroundColor(.secondary)
                    }
                }
            }
            .padding(.horizontal, 20)
        }
    }
    
    // Friend Recommentation View
    var friendRecommentation: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(data.friends) { friend in
                    VStack(alignment: .center, spacing: 10) {
                        Image(systemName: "person.circle")
                            .font(.system(size: 50))
                            .foregroundColor(friend.color)
                            .padding(15)
                            .background(Circle().foregroundColor(friend.color).opacity(0.3))
                            .padding(.horizontal, 5)
                        Text(friend.name).fontWeight(.bold)
                    }
                }
            }
            .padding(.horizontal, 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    private static var data = SyncSyncViewModel()
    
    static var previews: some View {
        ContentView(data: data)
    }
}
