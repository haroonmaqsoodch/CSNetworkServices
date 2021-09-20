//
//  NetworkService.swift
//  CSNetworkServices
//
//  Created by Haroon Maqsood on 9/19/21.
//

import Foundation

public class NetworkService {
    
    public static func serviceCall(urlRequest: URLRequest, completion: @escaping (Any?, HTTPURLResponse, NetworkErrors?) ->()) {
        URLSession.shared.dataTask(with: urlRequest) {data , response , error in
            let response = response as! HTTPURLResponse
            if error == nil {
                completion(data, response, nil)
            } else {
                completion(nil,response, .networkError)
            }
        }.resume()
    }
}
