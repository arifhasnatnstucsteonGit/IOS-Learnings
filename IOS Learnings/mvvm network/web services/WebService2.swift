//
//  WebService.swift
//  IOS Learnings
//
//  Created by DREAMONLINE on 29/11/21.
//

import UIKit

private var url =  URL(string: "http://arifhasnat.com/wp-json/wp/v2/posts")!

class WebService2 {
    
    
    func loadPostData(completion: @escaping ([AllPost]) -> ()){
        URLSession.shared.dataTask(with: url) { data, _,_ in
            if let data = data {
         
                let jsonDecoder = JSONDecoder()
                
                let empData = try! jsonDecoder.decode([AllPost].self, from: data)
                DispatchQueue.main.async {
                    completion(empData)
                }
                
            }
            
        }.resume()
    }
    
}
