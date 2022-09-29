//
//  UIViewController+Ext.swift
//  Rx-Basic
//
//  Created by 전종훈 on 2022/09/29.
//

import Foundation
import RxSwift
import RxCocoa

extension BehaviorRelay {
    public var v : Element {
        get {
            return value
        }
        set(value) {
            self.accept(value)
        }
    }
}


extension UIViewController {
    /*
    var errorAlert: Binder<(Error)> {
        return Binder(self) { vc, error in
            let p = {
                let e = error as! Exception
                let alert = UIAlertController(title: "오류", message: e.localizedDescription, preferredStyle: .alert)
                let ok = UIAlertAction(title: "확인", style: .default, handler: { a in
                    //                    self?.idTextInput.becomeFirstResponder()
                })
                alert.addAction(ok)
                vc.present(alert, animated: false, completion: nil)
            }
            if Thread.isMainThread {
                p()
            } else {
                DispatchQueue.main.async {
                    p()
                }
            }
        }
    }
    
    var toastShow: Binder<(String)> {
        return Binder(self) { vc, msg in
            let p = {
                Toast.init(text: msg).show()
                vc.dismissKeyboard()
            }
            if Thread.isMainThread {
                p()
            } else {
                DispatchQueue.main.async {
                    p()
                }
            }
        }
    }*/
}
