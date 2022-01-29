//
//  ContentView.swift
//  ReclipFeaturedFeed
//

import SwiftUI

struct FeedView: View {
    
    @ObservedObject var dataService: DataService
    
    var body: some View {
        switch dataService.state {
        case .loaded:
            NavigationView {
                List {
                    ForEach(dataService.videos) { video in
                        NavigationLink(video.share.videoTitle,
                                       destination: VideoPlayerView(video: video)
                                        .edgesIgnoringSafeArea(.all))
                    }
                }
                .navigationTitle("Reclip Videos")
            }
            
        case .error:
            Text("Error happened")
            
        case .loading:
            Text("Loading...")
            
        case .initial:
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let video1 = Video(id: "1",
                           share: Video.Share(videoTitle: "Video Title 1",
                                              videoUrl: "",
                                              username: ""),
                           createdAt: Date())
        let video2 = Video(id: "2",
                           share: Video.Share(videoTitle: "Video Title 2",
                                              videoUrl: "",
                                              username: ""),
                           createdAt: Date())
        let dataService = DataService()
        dataService.setVideos([video1, video2])
        
        return FeedView(dataService: dataService)
    }
}
