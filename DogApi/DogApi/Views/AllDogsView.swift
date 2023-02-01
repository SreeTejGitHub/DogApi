//
//  ContentView.swift
//  DogApi
//
//  Created by Sree Tej Peddaiahgari on 1/26/23.
//

import SwiftUI
enum TypesOfViews {
    case allDogs
    case random
    case numberOfDogs(number: Int)
}

struct AllDogsView: View {
    @ObservedObject var dogImageList : DogState
    
    init(typeOfView: TypesOfViews) {
        self.dogImageList = DogState(typeOfView: typeOfView)
    }
    
    var body: some View {
        VStack {
            if self.dogImageList.isLoading {
                LoadingView()
            } else {
                if let images = self.dogImageList.images {
                    ScrollView {
                        let imageWidth = (UIScreen.main.bounds.size.width/3)-10
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 20) {
                            ForEach(0...images.count-1, id: \.self) { index in
                                Image(uiImage: images[index])
                                    .resizable()
                                    .frame(width: imageWidth, height: imageWidth)
                                    .aspectRatio(contentMode: .fit)
                            }
                        }
                    }
                }
            }
        }.onAppear(perform: self.dogImageList.getDogApiResponse)
            .navigationTitle("Photos of Dogs")
    }
}


struct LoadingView: View {
    @State private var isAnimating: Bool = false

    var body: some View {
        Circle()
            .trim(from: 0, to: 0.7)
            .stroke(lineWidth: 4)
            .frame(width: 50, height: 50)
            .rotationEffect(.degrees(isAnimating ? 360 : 0))
            .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
            .onAppear {
                self.isAnimating = true
            }
    }
}
