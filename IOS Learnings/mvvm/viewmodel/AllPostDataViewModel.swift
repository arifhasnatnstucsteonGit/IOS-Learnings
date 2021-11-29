//
//  AllPostDataViewModel.swift
//  IOS Learnings
//
//  Created by DREAMONLINE on 26/11/21.
//

import Foundation

class AllPostDataViewModel {
    
    var posts: [AllPost] = [AllPost]()
    func populateRecipesByCategory() async -> [AllPost]{
        
        do {
            
            let recipeResponse = try await Webservice().get(url: URL(string: "http://arifhasnat.com/wp-json/wp/v2/posts")!) { data in
                return try? JSONDecoder().decode([AllPost].self, from: data)
            }
            self.posts = recipeResponse
            print(self.posts)
            
        } catch {
            print(error)
        }
        
        return self.posts
    }
    
}
