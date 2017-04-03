//
//  Dispatch.swift
//  ACT_ios
//
//  Created by Victor Amelin on 1/23/17.
//  Copyright © 2017 Victor Amelin. All rights reserved.
//

import Foundation

public extension DispatchQueue {
    private static var _onceTracker = [String]()
    public class func once(token: String, block: (Void)->Void) {
        //for mutex
        objc_sync_enter(self); defer { objc_sync_exit(self) }
        if _onceTracker.contains(token) {
            return
        }
        _onceTracker.append(token)
        block()
    }
}

