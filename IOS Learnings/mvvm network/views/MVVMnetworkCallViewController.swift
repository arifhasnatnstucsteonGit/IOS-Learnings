//
//  MVVMnetworkCallViewController.swift
//  IOS Learnings
//
//  Created by DREAMONLINE on 29/11/21.
//

import UIKit

class MVVMnetworkCallViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("post data")
        WebService2().loadPostData {posts in
            print(posts)
        }

        
    }
    



}
