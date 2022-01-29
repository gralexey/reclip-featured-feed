//
//  DataSource.swift
//  ReclipFeaturedFeed
//
//  Created by Alexey Grabik on 25.01.2022.
//

import Foundation

class DataService: ObservableObject {
    
    enum State {
        case initial, loading, loaded, error
    }
    
    enum FeedError: Error {
        case general(Error), decoding(Error), noData
    }
    
    @Published private(set) var state = State.initial
    
    @Published private(set) var videos = [Video]()
    
    init() {
        state = .loading
        requestVideos { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let videos):
                print("items succesfully loaded")
                self.setVideos(videos)
                
            case .failure(let error):
                print("feed error: \(error.localizedDescription)")
                self.state = .error
            }
        }
    }
    
    // MARK: Service
    
    func setVideos(_ videos: [Video]) {
        self.videos = Self.videosByRemovingDublicates(videos)
        self.state = .loaded
    }
    
    func requestVideos(callback: @escaping (Result<[Video], FeedError>) -> ()) {
        URLSession.shared.dataTask(with: FeaturedFeedAPI.endpoint) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    callback(.failure(.general(error)))
                }
            }
            else if let data = data {
                do {
                    let videos = try FeaturedFeedAPI.jsonDecoder.decode([Video].self, from: data)
                    DispatchQueue.main.async {
                        callback(.success(videos))
                    }
                }
                catch {
                    DispatchQueue.main.async {
                        callback(.failure(.decoding(error)))
                    }
                }
            }
            else {
                DispatchQueue.main.async {
                    callback(.failure(.noData))
                }
            }
        }.resume()
    }
    
    private static func videosByRemovingDublicates(_ videos: [Video]) -> [Video] {
        var addedDict = [String : Bool]()
        let unique = videos.filter {
            addedDict.updateValue(true, forKey: $0.id) == nil
        }
        return unique
    }
}
