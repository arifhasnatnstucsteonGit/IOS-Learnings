//
//  PostListViewModel.swift
//  IOS Learnings
//
//  Created by DREAMONLINE on 29/11/21.
//

import UIKit

class PostListViewModel {
    var posts:[AllPost] = [AllPost]()
    
//    init(posts: [AllPost]){
//        self.posts = posts
////        for post in posts{
////
////        }
//    }
    
    init(webServices: WebService2, completion: @escaping() -> ()){
        WebService2().loadPostData {posts in
            self.posts = posts
            DispatchQueue.main.async {
                completion()
            }
          
        }
    }
    
    
//    func displayPostData(posts: [AllPost]){
//        self.posts = posts
//    }

}
