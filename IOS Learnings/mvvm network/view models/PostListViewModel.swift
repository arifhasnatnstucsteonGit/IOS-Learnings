//
//  PostListViewModel.swift
//  IOS Learnings
//
//  Created by DREAMONLINE on 29/11/21.
//

import UIKit

class PostListViewModel {
    var posts:[AllPost] = [AllPost]()
    
    init(completion: @escaping() -> ()){
        WebService2().loadPostData {posts in
            self.posts = posts
            DispatchQueue.main.async {
                completion()
            }

        }
    }
    
}
