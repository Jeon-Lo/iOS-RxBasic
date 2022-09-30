//
//  NotificationUtils.swift
//  ChangoTuri
//
//  Created by 전종훈 on 2021/08/26.
//

import Foundation

class NotificationUtils {
    static func post(_ name : String, _ param : [AnyHashable : Any]? = nil) {
        NotificationCenter.default.post(name: NSNotification.Name(name), object: nil, userInfo : param ?? [:])
    }
    
    static func register(_ observer : Any, _ name : String, _ selector : Selector) {
        NotificationCenter.default.addObserver(observer, selector: selector, name: NSNotification.Name(name),object: nil)
    }
    
    static func remove(_ observer : Any, _ name : String) {
        NotificationCenter.default.removeObserver(observer, name: NSNotification.Name(name), object: nil)
    }
    
    static func getValue<T>(_ notification: Notification, _ key : String) -> T? {
        guard let result = notification.userInfo?[key] as? T else {
            return nil
        }
        return result
    }
}
