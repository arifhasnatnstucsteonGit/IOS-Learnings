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
    
    
    func displayPostData(posts: [AllPost]){
        self.posts = posts
    }

}
