//
//  ReclipFeaturedFeedTests.swift
//  ReclipFeaturedFeedTests
//

import XCTest
@testable import ReclipFeaturedFeed

class ReclipFeaturedFeedTests: XCTestCase {
    
    var sup: DataService?

    override func setUp() {
        sup = DataService()
    }
    
    override func tearDown() {
        sup = nil
    }

    func testVideosDedublicating() throws {

        let video = Video(id: "1",
                          share: Video.Share(videoTitle: "Video Title 1",
                                             videoUrl: "",
                                             username: "alex"),
                          createdAt: Date())
        let dublicatedVideo = video
        let videos = [video, dublicatedVideo]
        
        sup?.setVideos(videos)
        
        let workingVideos = sup?.videos
        XCTAssert(workingVideos?.count == 1, "Dedublicating error")
    }
}
