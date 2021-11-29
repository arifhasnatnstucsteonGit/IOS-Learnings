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
    private var webService: WebService2 = WebService2()
   // var posts:[AllPost] = [AllPost]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        postTableView.delegate = self
        postTableView.dataSource = self
        self.postTableView.estimatedRowHeight = 90
        self.postTableView.rowHeight = UITableView.automaticDimension
        self.postTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
       
        
       // self.postListViewModel = PostListViewModel()
        
      // data will load viewcotnroller through webservices and asigned data viewmodel. ViewControler will use the
      // viewmodel data after that
        
//        WebService2().loadPostData {posts in
//            self.postListViewModel.displayPostData(posts: posts)
//            self.postTableView.reloadData()
//        }
        
       
        
        // data will load from viewcotnroller throught webservices
        self.postListViewModel = PostListViewModel(webServices: self.webService, completion: {
            self.postTableView.reloadData()
        })

        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return posts.count
        return postListViewModel.posts.count
        //return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = postTableView.dequeueReusableCell(withIdentifier: "cell") as! PostTableViewCell
        cell.postTitle.text = postListViewModel.posts[indexPath.row].title?.rendered!
        cell.postDescription.text = postListViewModel.posts[indexPath.row].content?.rendered!
        //let url = URL(string: prevideoUrl)
        //cell.postImage.kf.setImage(with: url)
        cell.postImage.image = UIImage(named: "post")
        
        return cell
        
    }
    



}
