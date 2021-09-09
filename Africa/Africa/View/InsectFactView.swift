//
//  InsectFactView.swift
//  Africa
//
//  Created by Andoni Da silva on 29/5/21.
//

import SwiftUI

struct InsectFactView: View {
    // MARK: PROPERTIES
    
    let animal: Animal
    
    // MARK: BODY
    
    var body: some View {
        GroupBox {
            TabView() {
                ForEach(animal.fact, id: \.self) { fact in
                    Text(fact)
                }
                    
            } //: TAB
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        }
    }
}

// MARK: PREVIEW

struct InsectFactView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsectFactView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
