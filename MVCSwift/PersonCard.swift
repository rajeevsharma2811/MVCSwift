//
//  PersonCard.swift
//  MVCSwift
//
//  Created by Rajeev Sharma on 2015-03-13.
//  Copyright (c) 2015 Rajeev. All rights reserved.
//

import UIKit

class PersonCard: UIView {

    // Global properties
    var imageView: UIImageView! = UIImageView()
    var name: UILabel! = UILabel()
    var jobLabel: UILabel! = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(name)
        self.addSubview(jobLabel)
        self.addSubview(imageView)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        var rect = self.bounds
       
        // Nice ehh! It will make that image round :)
        self.imageView.layer.cornerRadius = 50.0
        self.imageView.clipsToBounds = true
        ////////////////////////////////////////////
        
        self.imageView.frame = CGRect(x: 0, y: 80 , width: 100, height: 100)
        self.imageView.backgroundColor = UIColor.whiteColor()
        
        self.name.frame = CGRect(x: 0, y: self.imageView.frame.origin.y, width: rect.size.width, height: rect.size.height / 2.0)
        
        // Note +40 is the padding between those two labels
        self.jobLabel.frame = CGRect(x: 0, y: self.name.frame.origin.y + 40, width: rect.size.width, height: rect.size.height / 2.0)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
