//
//  DebugException.swift
//  ChangoTuri
//
//  Created by 전종훈 on 2021/08/30.
//

class DebugException : Exception {
    
    init(_ desc : String) {
        super.init("DebugException", desc)
    }
}
