//
//  VideoListView.swift
//  Africa
//
//  Created by Andoni Da silva on 26/5/21.
//

import SwiftUI

struct VideoListView: View {
    // MARK: PROPERTIES
    
    @State var videos: [Video] = Bundle.main.decode("videos.json")
    
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    // MARK: BODY
    
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { video in
                    NavigationLink(destination: VideoPlayerView(videoSelected: video.id, videoTitle: video.name)) {
                        VideoListItemView(video: video)
                            .padding(.vertical, 8)
                    }
                } //: LOOP
            } //: LIST
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos", displayMode: .inline)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    }) {
                        Image(systemName: "arrow.2.squarepath")
                    }
                }
            })
        } //: NAVIGATION
    }
}

// MARK: PREVIEW

struct VideoListView_Previews: PreviewProvider {
    static let videos: [Video] = Bundle.main.decode("videos.json")
    static var previews: some View {
        VideoListView()
    }
}
