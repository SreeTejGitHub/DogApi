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
                Text("Loading...")
            } else {
                if let images = self.dogImageList.images {
                    ScrollView {
                        let imageWidth = (UIScreen.main.bounds.size.width/3)-10
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 20) {
                            ForEach(0...images.count-1, id: \.self) { index in
                                Image(uiImage: images[index])
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: imageWidth, height: imageWidth)
                            }
                        }
                    }
                }
            }
        }.onAppear(perform: self.dogImageList.getDogApiResponse)
    }
}
