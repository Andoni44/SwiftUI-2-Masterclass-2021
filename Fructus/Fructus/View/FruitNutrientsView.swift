//
//  FruitNutrientsView.swift
//  Fructus
//
//  Created by Andoni Da silva on 22/4/21.
//

import SwiftUI

struct FruitNutrientsView: View {
    
    // MARK: PROPERTIES
    
    var fruit: Fruit
    let nutrients: [String] = ["Energy", "Sugar", "Fat", "Protein", "Vitamins", "Minerals"]
    // MARK: BODY
    
    var body: some View {
        GroupBox() {
            DisclosureGroup("Nutritional value per 100g") {
                ForEach(0...(nutrients.count - 1), id: \.self) { item in
                    Divider().padding(.vertical, 2)
                    HStack {
                        Group {
                            Image(systemName: "info.cirlce")
                            Text(nutrients[item])
                        }
                        .foregroundColor(fruit.gradientColors[1])
                        .font(Font.system(.body).bold())
                        Spacer(minLength: 25)
                        Text(fruit.nutrition[item])
                        .multilineTextAlignment(.trailing)
                    }//: HS
                }//: LOOP
            }//: DG
        }//: GB
    }
}

// MARK: PREVIEW

struct FruitNutrientsView_Previews: PreviewProvider {
    static var previews: some View {
        FruitNutrientsView(fruit: fruitsData[0])
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 375, height: 480))
            .padding()
    }
}
