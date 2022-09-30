//
//  Exception.swift
//  ChangoTuri
//
//  Created by 전종훈 on 2021/08/26.
//

import Foundation

class Exception: LocalizedError, CustomStringConvertible {
    var desc: String
    var title: String

    init(_ title: String, _ desc: String) {
        self.desc = desc
        self.title = title
        printStackTrace()
    }
    
    var description: String {
        return String.localizedStringWithFormat("%@: %@", NSLocalizedString(title, comment: ""), NSLocalizedString(desc, comment: ""))
    }
    
    public var localizedDescription: String {
        get {
            return description
        }
    }
    
    func printStackTrace() {
        print(localizedDescription)
    }
}
