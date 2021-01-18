//
//  ServiceHandler.swift
//  SureshRewar
//
//Created by Suresh Rewar on 18/01/21.
//

import Foundation

class ServiceHandler {
    
    static func executeServiceCall(completion: @escaping (Data?,Any?,Error?) -> Void)
    {
        
        guard let url = URL(string: "https://itunes.apple.com/search?term=Michael+jackson") else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            completion(data,nil,nil)
        }.resume()
    }
}
