//
//  NSLayoutConstraint+Description.swift
//  brazilianfriends
//
//  Created by Claudio on 18/12/15.
//  Copyright © 2015 iDeiasMob. All rights reserved.
//

import UIKit
extension NSLayoutConstraint {
    
    override open var description: String {
        let id = identifier ?? ""
        return "id: \(id), constant: \(constant)" //you may print whatever you want here
    }
}
