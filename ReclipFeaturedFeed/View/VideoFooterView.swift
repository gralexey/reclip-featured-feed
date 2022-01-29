//
//  VideoFooterView.swift
//  ReclipFeaturedFeed
//
//  Created by Alexey Grabik on 29.01.2022.
//

import SwiftUI

struct VideoFooterView: View {
    
    let item: Video
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text(item.share.videoTitle)
                    .font(Font.system(size: 16,
                                      weight: .bold,
                                      design: .default))
                    .foregroundColor(.white)
                    .shadow(radius: 5)
                Text(item.fromCaption)
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                    .shadow(radius: 5)
            }
            .padding()
            Spacer()
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [.clear, Color.black.opacity(0.4)]),
                           startPoint: .top,
                           endPoint: .bottom)
        )
    }
}
