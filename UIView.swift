//
//  UIImage.swift
//  cargo
//
//  Created by Victor Amelin on 2/16/17.
//  Copyright © 2017 Victor Amelin. All rights reserved.
//

import UIKit

public extension UIView {
    public func addGradient(colors: [CGColor], startPoint: CGPoint, endPoint: CGPoint) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = colors
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    public func addDashedLine(startPoint: CGPoint, endPoint: CGPoint, color: UIColor, lineWidth: CGFloat, step: Int) {
        let line = CAShapeLayer()
        let linePath = UIBezierPath()
        linePath.move(to: startPoint)
        linePath.addLine(to: endPoint)
        line.path = linePath.cgPath
        line.strokeColor = color.cgColor
        line.lineWidth = lineWidth
        line.lineJoin = kCALineJoinRound
        line.lineDashPattern = NSArray(objects: NSNumber(value: step), NSNumber(value: step)) as? [NSNumber]
        self.layer.addSublayer(line)
    }
    
    public func snapshotImage() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(bounds.size, isOpaque, 0)
        drawHierarchy(in: bounds, afterScreenUpdates: false)
        let snapshotImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return snapshotImage
    }
    
    public func snapshotImageView() -> UIImageView? {
        if let snapshotImage = snapshotImage() {
            return UIImageView(image: snapshotImage)
        } else {
            return nil
        }
    }
}
