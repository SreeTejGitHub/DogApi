//
//  ServiceLayer.swift
//  DogApi
//
//  Created by Sree Tej Peddaiahgari on 1/26/23.
//
import Foundation

class ApiManager {
    
    static let shared = ApiManager()
        
    func getDogApiResponse(type: TypesOfViews, completion: @escaping (Result<DogModel, ErrorModel>) -> ()) {
        var url = ""
        switch type {
        case .allDogs:
            url = "https://dog.ceo/api/breed/hound/images"
        case .random:
            url = "https://dog.ceo/api/breed/hound/images/random"
        case .numberOfDogs(let number):
            url = "https://dog.ceo/api/breed/hound/images/random/\(number)"
        }
        guard let url = URL(string: url) else {
            self.executeCompletionHandler(with: .failure(.invalidEndpoint), completion: completion)
            return
        }
        
        loadURLAndDecode(url: url, completion: completion)
    }
    
    private func loadURLAndDecode<D: Decodable>(url: URL, completion: @escaping (Result<D, ErrorModel>) -> ()) {

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                self.executeCompletionHandler(with: .failure(.apiError), completion: completion)
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                self.executeCompletionHandler(with: .failure(.invalidResponse), completion: completion)
                return
            }
            
            guard let data = data else {
                self.executeCompletionHandler(with: .failure(.noData), completion: completion)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(D.self, from: data)
                self.executeCompletionHandler(with: .success(decodedResponse), completion: completion)
            } catch {
                self.executeCompletionHandler(with: .failure(.serializationError), completion: completion)
            }
        }.resume()
    }
    
    func executeCompletionHandler<D: Decodable>(with result: Result<D, ErrorModel>, completion: @escaping (Result<D, ErrorModel>) -> ()) {
        DispatchQueue.main.async {
            completion(result)
        }
    }
}





