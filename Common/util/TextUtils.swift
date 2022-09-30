//
//  TextUtils.swift
//  ChangoTuri
//
//  Created by 전종훈 on 2021/08/26.
//

import Foundation

class TextUtils {
    static func isEmpty(_ text : String) -> Bool {
        return text.isEmpty
    }
    
    static func isEmpty(_ text : String?) -> Bool {
        guard let t = text else {
            return true
        }
        return t.isEmpty
    }
    
    static func isTrueValue(_ text : String?, _ defaultValue : Bool = false) -> Bool {
        guard let t = text else {
            return defaultValue
        }
        return t == "Y"
    }
}
