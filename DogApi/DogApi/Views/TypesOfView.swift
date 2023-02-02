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
                Text(Localized(.homeTitle))
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.blue)
                NavigationLink(destination: AllDogsView(typeOfView: .allDogs)) {
                    Text(Localized(.typeOfView1))
                }
                NavigationLink(destination: AllDogsView(typeOfView: .numberOfDogs(number: 3))) {
                    Text(Localized(.typeOfView2))
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
