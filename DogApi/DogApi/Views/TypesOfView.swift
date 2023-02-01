//
//  TypesOfView.swift
//  DogApi
//
//  Created by Sree Tej Peddaiahgari on 1/28/23.
//

import SwiftUI

struct TypesOfView: View {
    var body: some View {
        NavigationView {
            List {
                Text("Fetch photos of:")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.blue)
                NavigationLink(destination: AllDogsView(typeOfView: .allDogs)) {
                    Text("All Dogs")
                }
                NavigationLink(destination: AllDogsView(typeOfView: .numberOfDogs(number: 3))) {
                    Text("3 Random Dogs")
                }
            }
        }
    }
}

struct TypesOfView_Previews: PreviewProvider {
    static var previews: some View {
        TypesOfView()
    }
}
