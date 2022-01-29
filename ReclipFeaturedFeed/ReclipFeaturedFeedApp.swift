//
//  ReclipFeaturedFeedApp.swift
//  ReclipFeaturedFeed
//

import SwiftUI

@main
class ReclipFeaturedFeedApp: App {
    
    private let dataSource = DataService()
    private lazy var contentView = FeedView(dataService: self.dataSource)
    
    var body: some Scene {
        WindowGroup {
            contentView
        }
    }
    
    required init() {}
}
