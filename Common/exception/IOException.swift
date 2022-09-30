//
//  IOException.swift
//  ChangoTuri
//
//  Created by 전종훈 on 2021/08/30.
//

class IOException : Exception {
    
    init(_ desc : String) {
        super.init("IOException", desc)
    }
    
}
