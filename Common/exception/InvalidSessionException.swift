//
//  InvalidSessionException.swift
//  ChangoTuri
//
//  Created by 전종훈 on 2021/08/30.
//

class InvalidSessionException : Exception {
    
    init(_ desc : String) {
        super.init("InvalidSessionException", desc)
    }
}
