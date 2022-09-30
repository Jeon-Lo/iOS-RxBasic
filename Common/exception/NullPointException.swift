//
//  NullPointException.swift
//  ChangoTuri
//
//  Created by 전종훈 on 2021/08/30.
//

import Foundation

class NullPointException : Exception {
    
    init(_ desc : String) {
        super.init("NullPointException", desc)
    }
}


