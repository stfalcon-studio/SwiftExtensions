//
//  ReusableCell.swift
//
//  Created by Roman Rybachenko on 1/17/17.
//  Copyright © 2017 Roman Rybachenko. All rights reserved.
//

import Foundation

protocol ReusableCell: class {
    static func height() -> CGFloat
}

extension ReusableCell where Self: UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    static var nibName: String {
        return String(describing: self)
    }
}


