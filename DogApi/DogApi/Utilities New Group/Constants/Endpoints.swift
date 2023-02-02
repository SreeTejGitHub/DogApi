//
//  Endpoints.swift
//  DogApi
//
//  Created by Sree Tej Peddaiahgari on 2/1/23.
//

import Foundation
enum Endpoint {
    enum DogsApi {
        static let allDogs = "https://dog.ceo/api/breed/hound/images"
        static let randomDogs = "https://dog.ceo/api/breed/hound/images/random/%@"
    }
}
