//
//  CoverImageView.swift
//  Africa
//
//  Created by Andoni Da silva on 27/5/21.
//

import SwiftUI

struct CoverImageView: View {
    // MARK: PROPERTIES
    
    let coveredImages: [CoverImage] = Bundle.main.decode("covers.json")
    
    // MARK: BODY
    
    var body: some View {
        TabView {
            ForEach(coveredImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            } //: LOOP
        } //: TAB
        .tabViewStyle(PageTabViewStyle())
    }
}

// MARK: PREVIEW

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
