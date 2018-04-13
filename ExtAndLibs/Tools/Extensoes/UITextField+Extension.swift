//
//  UITextField+Extension.swift
//  inspetor
//
//  Created by Claudio on 24/10/16.
//  Copyright © 2016 MPT. All rights reserved.
//

import UIKit

extension UITextField {
    func roundWithColor(cor: UIColor) {
        self.layer.cornerRadius = 8.0
        self.layer.masksToBounds = true
        self.layer.borderColor = cor.cgColor
        self.layer.borderWidth = 1.0
    }
}
