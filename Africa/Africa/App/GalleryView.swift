//
//  GalleryView.swift
//  Africa
//
//  Created by Andoni Da silva on 26/5/21.
//

import SwiftUI

struct GalleryView: View {
    // MARK: PROPERTIES

    @State private var selectedAnimal: String = "lion"

    let animals: [Animal] = Bundle.main.decode("animals.json")
    private let hapticImpact = UIImpactFeedbackGenerator(style: .medium)

    // SIMPLE GRID DEFINITION
    // let gridLayout: [GridItem] = [
    //     GridItem(.flexible()),
    //     GridItem(.flexible()),
    //     GridItem(.flexible())
    // ]

    // EFICIENT GRID DEFINITION
    //let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)

    // DYNAMIC GRID LAYOUT
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColum: Double = 3.0

    private func gridSwitch() {
        gridLayout =  Array(repeating: GridItem(.flexible()), count: Int(gridColum))
    }

    // MARK: BODY

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 30) {
                // MARK:  IMAGE

                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))

                // MARK: GLIDER

                Slider(value: $gridColum, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColum, perform: { value in
                        gridSwitch()
                    })

                // MARK: GRID
                /*
                 The grid is “lazy,” in that the grid view does not create items until they are needed.
                 */
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { animal in
                        Image(animal.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = animal.image
                                hapticImpact.impactOccurred()
                            }
                    }
                } //: LVG
                .animation(.easeOut)
                .onAppear(perform: {
                    gridSwitch()
                })
                .padding(.horizontal, 10)
                .padding(.vertical, 50)
            } //: VS
        } //: SCROLL
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

// MARK: PREVIEW

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
