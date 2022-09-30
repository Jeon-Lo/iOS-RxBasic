//
//  ExecutionException.swift
//  ChangoTuri
//
//  Created by 전종훈 on 2021/08/30.
//

class ExecutionException : Exception {
    
    init(_ desc : String) {
        super.init("ExecutionException", desc)
    }
}
