//
//  MVVMnetworkCallViewController.swift
//  IOS Learnings
//
//  Created by DREAMONLINE on 29/11/21.
//

import UIKit

class MVVMnetworkCallViewController: UIViewController{
  
    @IBOutlet weak var postTableView: UITableView!
    private var postListViewModel: PostListViewModel!
    private var webService: WebService2 = WebService2()
    
    private var dataSource : AllPostTableViewDataSource<PostTableViewCell,AllPost>!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //postTableView.delegate =Q«Ω£«ΩÍΩÅΩ«                                  self
       // postTableView.dataSource = self
        self.postTableView.estimatedRowHeight = 90
        self.postTableView.rowHeight = UITableView.automaticDimension
        self.postTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
       
        self.postListViewModel = PostListViewModel(completion: {
             // self datasource
            //self.postTableView.reloadData()
            
            // singleton datasource
            self.updateDataSource()
        })
        
    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        return postListViewModel.posts.count
//
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = postTableView.dequeueReusableCell(withIdentifier: "cell") as! PostTableViewCell
//        cell.postTitle.text = postListViewModel.posts[indexPath.row].title?.rendered!
//        cell.postDescription.text = postListViewModel.posts[indexPath.row].content?.rendered!
//        //let url = URL(string: prevideoUrl)
//        //cell.postImage.kf.setImage(with: url)
//        cell.postImage.image = UIImage(named: "post")
//
//        return cell
//
//    }
    
    
    func updateDataSource(){
        
        self.dataSource = AllPostTableViewDataSource(cellIdentifier: "cell", items: self.postListViewModel.posts, configureCell: { (cell, evm) in
            cell.postTitle.text  = evm.title?.rendered!
            cell.postDescription.text = evm.content?.rendered!
            cell.postImage.image = UIImage(named: "post")
        })
        
        DispatchQueue.main.async {
            self.postTableView.dataSource = self.dataSource
            self.postTableView.reloadData()
        }
    }
    



}
