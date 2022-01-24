//
//  VideoPlayerView.swift
//  ReclipFeaturedFeed
//

import AVKit
import UIKit
import SwiftUI

struct VideoPlayerView: UIViewRepresentable {

    let url: URL

    func makeUIView(context: Context) -> VideoPlayerUIView {
        return VideoPlayerUIView()
    }

    func updateUIView(_ uiView: VideoPlayerUIView, context: Context) {
        uiView.url = url
    }

}

class VideoPlayerUIView: UIView {

    var url: URL? {
        get {
            ((player.currentItem?.asset) as? AVURLAsset)?.url
        }
        set {
            if let newURL = newValue {
                player.replaceCurrentItem(with: AVPlayerItem(url: newURL))
            } else {
                player.replaceCurrentItem(with: nil)
            }
        }
    }

    private let player = AVPlayer()

    override static var layerClass: AnyClass {
        return AVPlayerLayer.self
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        guard let playerLayer = layer as? AVPlayerLayer else {
            fatalError("Unexpected layer type.")
        }

        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspectFill

        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapVideo)))
    }

    @objc private func didTapVideo() {
        if player.timeControlStatus == .paused {
            player.play()
        } else {
            player.pause()
        }
    }

}
