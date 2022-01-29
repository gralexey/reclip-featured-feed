//
//  Video.swift
//  ReclipFeaturedFeed
//
//  Created by Alexey Grabik on 29.01.2022.
//

import Foundation

struct Video: Identifiable, Decodable {
    let id: String
    let share: Share
    let createdAt: Date

    struct Share: Decodable {
        let videoTitle: String
        let videoUrl: String
        let username: String
    }
    
    var fromCaption: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateFormat = "EEEE"
        let dateString = formatter.string(from: createdAt)
        
        return "\(dateString) from @\(share.username)"
    }
}
