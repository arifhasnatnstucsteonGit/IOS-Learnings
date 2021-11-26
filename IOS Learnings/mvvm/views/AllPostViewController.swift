//
//  TopicsViewController.swift
//  IOS Learnings
//
//  Created by DREAMONLINE on 25/11/21.
//

import UIKit
import AVFoundation

class AllPostViewController: UIViewController {
    
    private var allPostViewModel : AllPostViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func callToViewModelForUIUpdate(){
        
        self.allPostViewModel =  AllPostViewModel()
        self.allPostViewModel.bindAllPostViewModelToController = {
            //author
            //self.updateDataSource()
        }
    }
    
    


}
