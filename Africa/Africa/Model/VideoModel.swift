//
//  VideoModel.swift
//  Africa
//
//  Created by Andoni Da silva on 2/6/21.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    var thumbnail: String {
        return "video-\(id)"
    }
}
