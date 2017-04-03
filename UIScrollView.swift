//
//  ScrollView.swift
//
//  Created by Victor Amelin on 1/31/17.
//  Copyright © 2017 Victor Amelin. All rights reserved.
//

import UIKit

public extension UIScrollView {
    public func calculateContentSize(offset: CGFloat, font: UIFont) {
        var height: CGFloat = 0.0
        for item in self.subviews {
            if item.isMember(of: UILabel.self) {
                let size = CGSize(width: UIScreen.main.bounds.size.width, height: CGFloat.greatestFiniteMagnitude)
                if ((item as! UILabel).text?.characters.count)! > 0 {
                    height += (item as! UILabel).text!.boundingRect(with: size, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName:font], context: nil).size.height
                }
            }
        }
        self.contentSize.height = height + offset
    }
}
