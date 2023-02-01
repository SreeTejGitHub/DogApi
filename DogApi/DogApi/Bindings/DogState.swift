//
//  DogState.swift
//  DogApi
//
//  Created by Sree Tej Peddaiahgari on 1/26/23.
//

import Foundation
import UIKit

class DogState: ObservableObject {
    
    @Published var dogModel: DogModel?
    @Published var isLoading: Bool = true
    @Published var error: ErrorModel?
    @Published var images: [UIImage]?

    let typeOfView: TypesOfViews
    
    init(typeOfView: TypesOfViews) {
        self.typeOfView = typeOfView
    }
    
    func getDogApiResponse(){
        self.dogModel = nil
        self.isLoading = true
        self.images = nil
        
        ApiManager.shared.getDogApiResponse(type: self.typeOfView) { [weak self] (result) in
            guard let self = self else { return }
            
            switch result {
            case .success(let dogModel):
                self.dogModel = dogModel
                self.getImages(urlList: dogModel.message)
            case .failure(let error):
                self.isLoading = false
                self.error = error as ErrorModel
            }
        }
    }
    
    func getImages(urlList: [String]) {
        let dispatchGroup = DispatchGroup()
        var tempImagesArray = [UIImage]()
        dispatchGroup.enter()
        for (index,imageURL) in urlList.enumerated() {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: URL(string: imageURL)!) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            tempImagesArray.append(image)
                        }
                        if index == urlList.count - 1 {
                                dispatchGroup.leave()
                        }
                    }
                }
            }
        }
        dispatchGroup.notify(queue: DispatchQueue.main) {
            self.images = tempImagesArray
            self.isLoading = false
        }
    }
}
