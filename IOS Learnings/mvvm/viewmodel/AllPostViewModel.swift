//
//  AllPostViewModel.swift
//  IOS Learnings
//
//  Created by DREAMONLINE on 25/11/21.
//

import UIKit

class AllPostViewModel: NSObject {
    
    //var title:String = ""
    
//    var title:String{
//        didSet {
//            title = ""
//        }
//    }
    
//    var x: Int {
//        didSet {
//            x = x * 2
//        }

    private var apiService : ApiService!
    //public var allPostData:AllPost
    private(set) var empData : AllPost! {
        didSet {
            self.bindAllPostViewModelToController()
        }
    }
    
    var bindAllPostViewModelToController : (() -> ()) = {}
    
    
 
    
    override init() {
        super.init()
        //self.title = "sdfds"
        self.apiService =  ApiService()
       
        //self.allPostData = AllPost
        callFuncToGetEmpData()
    }
    
    func callFuncToGetEmpData() {
        self.apiService.apiToGetAllPostData { (empData) in
            self.empData = empData
            
        }
    }
    
    func getAllPostData(){
        self.apiService.apiToGetAllPostData { (empData) in
            self.empData = empData
            
            
        }
    }
    
}
