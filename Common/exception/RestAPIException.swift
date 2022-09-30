//
//  RestAPIException.swift
//  ChangoTuri
//
//  Created by 전종훈 on 2021/08/30.
//

class RestAPIException : Exception {
    
    init(_ desc : String) {
        super.init("RestAPIException", desc)
    }
}

