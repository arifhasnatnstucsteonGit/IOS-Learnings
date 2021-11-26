//
//  ApiService.swift
//  IOS Learnings
//
//  Created by DREAMONLINE on 25/11/21.
//

import UIKit

class ApiService: NSObject {

    private let sourcesURL = URL(string: "http://arifhasnat.com/wp-json/wp/v2/posts")!
    
    func apiToGetAllPostData(completion : @escaping (AllPost) -> ()){
        
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            if let data = data {
                
                let jsonDecoder = JSONDecoder()
                
                let empData = try! jsonDecoder.decode(AllPost.self, from: data)
            
                    completion(empData)
            }
            
        }.resume()
    }
}
