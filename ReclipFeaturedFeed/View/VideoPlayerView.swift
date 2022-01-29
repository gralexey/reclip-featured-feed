//
//  VideoPlayerView.swift
//  ReclipFeaturedFeed
//

import UIKit
import SwiftUI

struct VideoPlayerView: View {
    
    let video: Video

    var body: some View {
        ZStack(alignment: .bottom) {
            VideoPlayerUIViewControllerWrapper(url: URL(string: video.share.videoUrl))
            VideoFooterView(item: video)
        }
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView(video: Video(id: "1a",
                                   share: Video.Share(videoTitle: "This is the reclip name",
                                                     videoUrl: "https://video.url",
                                                     username: "username"),
                                   createdAt: Date()))
    }
}
