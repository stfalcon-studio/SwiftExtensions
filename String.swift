//
//  String.swift
//
//  Created by Roman Rybachenko on 4/3/17.
//  Copyright © 2017 Roman Rybachenko. All rights reserved.
//

import Foundation
import UIKit

extension String {
    var length: Int {
        return self.characters.count
    }
    
    func containsString(str: String) -> Bool {
        return self.range(of: str) != nil ? true : false
    }
    
    func index(of string: String, options: CompareOptions = .literal) -> Index? {
        return range(of: string, options: options)?.lowerBound
    }
    
    func indexes(of string: String, options: CompareOptions = .literal) -> [Index] {
        var result: [Index] = []
        var start = startIndex
        while let range = range(of: string, options: options, range: start..<endIndex) {
            result.append(range.lowerBound)
            start = range.upperBound
        }
        return result
    }
    
    func range(of string: String) -> Range<Index>? {
        let options = String.CompareOptions.literal
        return range(of: string,
                     options: options,
                     range: startIndex..<endIndex)
    }
    
    func allRanges(of string: String, options: CompareOptions = .literal) -> [Range<Index>] {
        var result: [Range<Index>] = []
        var start = startIndex
        while let range = range(of: string, options: options, range: start..<endIndex) {
            result.append(range)
            start = range.upperBound
        }
        return result
    }
    
    func range(of string: String) -> NSRange {
        let nsStr = self as NSString
        let range = nsStr.range(of: string)
        return range
    }
    
    func range(of string: String, from range: NSRange) -> NSRange {
        let nsStr = self as NSString
        let options = String.CompareOptions.literal
        return nsStr.range(of: string, options: options, range: range)
    }
    
    func allRanges(of string: String) -> [NSRange] {
        var ranges: [NSRange] = []
        
        var range = NSMakeRange(0, self.length)
        while range.location != NSNotFound {
            range = self.range(of: string, from: range)
            
            if range.location != NSNotFound {
                ranges.append(range)
                
                range.location = range.location + range.length
                range.length = self.length - range.location
            }
        }
        return ranges
    }
    
    
}


// MARK: String + Calculation
extension String {
    func usedSize(maxWidth: Float, maxHeight: Float, font: UIFont) -> CGSize {
        let textStorage = NSTextStorage.init(string: self)
        let textContainer = NSTextContainer.init(size: CGSize(width: CGFloat(maxWidth), height: CGFloat(maxHeight)))
        let layoutManager = NSLayoutManager()
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)
        
        let range = NSRange.init(location: 0, length: textStorage.length)
        textStorage.addAttribute(NSFontAttributeName, value: font, range: range)
        textContainer.lineFragmentPadding = 0.0
        
        layoutManager.glyphRange(for: textContainer)
        let frame = layoutManager.usedRect(for: textContainer)
        
        let width = Int(ceil(Float(frame.size.width)))
        let height = Int(ceilf(Float(frame.size.height)))
        
        return CGSize(width: width, height: height)
    }
}
