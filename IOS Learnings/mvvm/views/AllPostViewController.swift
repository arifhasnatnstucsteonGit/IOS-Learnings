//
//  TopicsViewController.swift
//  IOS Learnings
//
//  Created by DREAMONLINE on 25/11/21.
//

import UIKit


class AllPostViewController: UIViewController {
    
    private var allPostViewModel : AllPostDataViewModel!
    //var postViewModel:PostViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("output")
        print(allPostViewModel)
        
        //let allPostData = await allPostViewModel.populateRecipesByCategory()
        
//        Task {
//            let allPostData = await allPostViewModel.populateRecipesByCategory()
//            print("result: \(allPostData)")
//        }

        
        //print( allPostViewModel.populateRecipesByCategory().count)
 
    }
    



}
