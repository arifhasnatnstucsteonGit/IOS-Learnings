//
//  MVVMnetworkCallViewController.swift
//  IOS Learnings
//
//  Created by DREAMONLINE on 29/11/21.
//

import UIKit

class MVVMnetworkCallViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
  
    

    @IBOutlet weak var postTableView: UITableView!
    
    
    private var postListViewModel: PostListViewModel!
    var posts:[AllPost] = [AllPost]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        postTableView.delegate = self
        postTableView.dataSource = self
        
        self.postListViewModel = PostListViewModel()
        
        print("post data")
        WebService2().loadPostData {posts in
            self.postListViewModel.displayPostData(posts: posts)
            self.posts = posts
            //print(self.posts)
            self.postTableView.reloadData()
        }
        
        print(posts)

        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = postTableView.dequeueReusableCell(withIdentifier: "cell") as! PostTableViewCell
        cell.postTitle.text = posts[indexPath.row].title?.rendered!
        cell.postDescription.text = posts[indexPath.row].content?.rendered!
        return cell
        
    }
    



}
