//
//  JeonTest.swift
//  ChangoTuri
//
//  Created by 전종훈 on 2021/08/26.
//

import Foundation
import UIKit

open class JeonTest: UILabel {
    var overlayView = UIView()
    var backView = UIView()
    var lbl = UILabel()
    
    class var shared: JeonTest {
        struct Static {
            static let instance : JeonTest = JeonTest()
        }
        return Static.instance
    }
    
    open func short(_ txt_msg: String) {
        guard let vc = UIApplication.shared.keyWindow!.rootViewController else {
            return
        }
        guard let view = vc.view else {
            return
        }
        
        DispatchQueue.main.async {
            
        }
    }
}
