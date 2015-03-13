//
//  Person.swift
//  MVCSwift
//
//  Created by Rajeev Sharma on 2015-03-13.
//  Copyright (c) 2015 Rajeev. All rights reserved.
//

import Foundation
import UIKit

class Person  {
    
    var name: NSString
    var jobTitle: NSString?
    var address: NSString?
    var imageView: UIImageView = UIImageView()

    init(name: String, job: String?, image: UIImage?) {
        self.name = name
        self.jobTitle = job
        self.imageView.image = image
    }
}
