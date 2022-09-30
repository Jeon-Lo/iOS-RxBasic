//
//  NeedAuthorizationException.swift
//  ChangoTuri
//
//  Created by 전종훈 on 2021/08/30.
//

class NeedAuthorizationException : Exception {
    
    init(_ desc : String) {
        super.init("NeedAuthorizationException", desc)
    }
}
