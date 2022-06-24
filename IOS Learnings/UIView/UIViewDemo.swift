//
//  UIViewDemo.swift
//  IOS Learnings
//
//  Created by DREAMONLINE on 17/5/22.
//

import UIKit

class UIViewDemo: UIView {

    //@IBOutlet var contentView: UIViewDemo!
    
    @IBOutlet var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("UIViewDemo", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
       
        
    }
  
}
