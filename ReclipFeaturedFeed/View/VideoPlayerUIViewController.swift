//
//  VideoPlayerUIViewController.swift
//  ReclipFeaturedFeed
//
//  Created by Alexey Grabik on 29.01.2022.
//

import UIKit
import SwiftUI
import AVKit

struct VideoPlayerUIViewControllerWrapper: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = VideoPlayerUIViewController
    
    let url: URL?
    
    func makeUIViewController(context: Context) -> VideoPlayerUIViewController {
        return VideoPlayerUIViewController()
    }
    
    func updateUIViewController(_ uiViewController: VideoPlayerUIViewController, context: Context) {
        uiViewController.url = url
    }
}

class VideoPlayerUIViewController: UIViewController {
    
    private let player = AVPlayer()
    
    private let playerLayer = AVPlayerLayer()

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

    private func commonInit() {
        view.layer.addSublayer(playerLayer)

        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspectFill

        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapVideo)))
    }

    @objc private func didTapVideo() {
        if player.timeControlStatus == .paused {
            player.play()
        } else {
            player.pause()
        }
    }
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        playerLayer.frame = view.bounds
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        player.play()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        player.pause()
    }
}
