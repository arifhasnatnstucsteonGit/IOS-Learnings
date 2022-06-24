//
//  ViewController.swift
//  IOS Learnings
//
//  Created by DREAMONLINE on 19/11/21.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func go(_ sender: Any) {
        
//        
//        let bundle = Bundle(for: ReorderTableviewViewController.self)
//        let navigatingPage = ReorderTableviewViewController(nibName: "ReorderTableviewViewController", bundle: bundle)
//        self.navigationController?.pushViewController(navigatingPage, animated: true )
//        UIApplication.shared.windows.first?.rootViewController = navigationController
//        UIApplication.shared.windows.first?.makeKeyAndVisible()
        
        
                let bundle = Bundle(for: ReorderTableviewViewController.self)
                let loginVC = ReorderTableviewViewController(nibName: "ReorderTableviewViewController", bundle: bundle)
                let navigationController = UINavigationController.init(rootViewController: loginVC)
                navigationController.setNavigationBarHidden(true, animated: false)
                //let navigationController = UINavigationController.init(rootViewController: loginVC)
                //navigationController.setNavigationBarHidden(true, animated: false)
                UIApplication.shared.windows.first?.rootViewController = navigationController
                UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
}

