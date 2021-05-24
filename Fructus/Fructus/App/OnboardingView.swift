//
//  OnboardingView.swift
//  Fructus
//
//  Created by Andoni Da silva on 15/4/21.
//

import SwiftUI

struct OnboardingView: View {
    
    // MARK: PROPERTIES
    
    var fruits: [Fruit] = fruitsData
    
    // MARK: BODY
    
    var body: some View {
        TabView {
            ForEach(fruits[0...5]) { fruit in
                FruitCardView(fruit: fruit)
            }//: LOOP
        }//: TABVIEW
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
    }
}

// MARK: PREVIEW

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(fruits: fruitsData)
    }
}
