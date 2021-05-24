//
//  FruitModel.swift
//  Fructus
//
//  Created by Andoni Da silva on 16/4/21.
//

import SwiftUI

// MARK: - FRUITS DATA MODEL

struct Fruit: Identifiable {
    
    let id = UUID()
    let title: String
    let headline: String
    let image: String
    let gradientColors: [Color]
    let description: String
    let nutrition:  [String]
}

