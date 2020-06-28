//
//  NetworkManager.swift
//  AxxessAssignment
//
//  Created by Dhanraj Subhash Bhandari on 27/06/20.
//  Copyright © 2020 Dhanraj Subhash Bhandari. All rights reserved.
//

import Foundation




enum NetworkError: Error {
       case invalidURL
       case invalidResponse(Data?, URLResponse?)
   }

//MARK:- Singleton Class

class NetworkManager {
    static let shared: NetworkManager = NetworkManager()
   
    //MARK:- API Call Public Method

    public func get(urlString: String, completionBlock: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completionBlock(.failure(NetworkError.invalidURL))
            return
        }
                
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                completionBlock(.failure(error!))
                return
            }

            guard
                let responseData = data,
                let httpResponse = response as? HTTPURLResponse,
                200 ..< 300 ~= httpResponse.statusCode else {
                    completionBlock(.failure(NetworkError.invalidResponse(data, response)))
                    return
            }

            completionBlock(.success(responseData))
        }
        task.resume()
    }
}
