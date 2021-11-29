//
//  PostViewModel.swift
//  IOS Learnings
//
//  Created by DREAMONLINE on 26/11/21.
//

import Foundation

@MainActor
class PostViewModel: ObservableObject {
    @Published var posts: [AllPost] = [AllPost]()
    //@Published var allPost: AllPost
    
    func populateRecipesByCategory(name: String) async {
        
        do {
            
            let recipeResponse = try await Webservice().get(url: URL(string: "http://arifhasnat.com/wp-json/wp/v2/posts")!) { data in
                return try? JSONDecoder().decode([AllPost].self, from: data)
            }
            self.posts = recipeResponse
            
        } catch {
            print(error)
        }
    }
    
}


struct PostsViewModel {
    
    private let allPost: AllPost
    
    init(_ allPost: AllPost) {
        self.allPost = allPost
    }
    
    var title: String {
        allPost.title?.rendered ??  ""
    }
    
//    var title: String {
//        recipe.title
//    }
//
//    var imageURL: URL? {
//        URL(string: recipe.imageUrl)
//    }
    
}

