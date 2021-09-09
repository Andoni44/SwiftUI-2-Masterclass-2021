//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Andoni Da silva on 6/6/21.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileFormat: String) -> AVPlayer? {
    guard let resource = Bundle.main.url(forResource: fileName, withExtension: "mp4") else {
        return nil
    }
    
    videoPlayer = AVPlayer(url: resource)
    videoPlayer?.play()
    return videoPlayer
}
