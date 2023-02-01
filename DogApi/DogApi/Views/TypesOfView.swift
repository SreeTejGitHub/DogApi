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
                NavigationLink(destination: AllDogsView(typeOfView: .allDogs)) {
                    Text("All Dogs")
                }
                NavigationLink(destination: AllDogsView(typeOfView: .numberOfDogs(number: 3))) {
                    Text("Random Dog")
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
