//
//  UIViewController.swift
//  ChangoTuri
//
//  Created by 전종훈 on 2021/08/26.
//

import UIKit
import Reusable
import RxSwift
import RxFlow
import RxCocoa

class UIViewStepController<M:BaseViewModel> : UIViewController {
    var steps = PublishRelay<Step>()
    var viewModel: M!
    
    public func initView() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    public func initObservable(_ disposeBag : DisposeBag) {
        viewModel.error.asObservable()
            .skip(1)
            .map {
                $0!
            }
            .bind(to: self.errorAlert)
            .disposed(by: disposeBag)
        viewModel.toast.asObservable()
            .skip(1)
            .map {
                $0
            }
            .bind(to: self.toastShow)
            .disposed(by: disposeBag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
        self.initObservable(viewModel.disposeBag)
    }
}

extension UIViewController {
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
    }
    
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
            action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}


extension UIScrollView {
    
    // Scroll to a specific view so that it's top is at the top our scrollview
    func scrollToView(view:UIView) {
        if let origin = view.superview {
            // Get the Y position of your child view
            let childStartPoint = origin.convert(view.frame.origin, to: self)
            let bottomOffset = scrollBottomOffset()
            if (childStartPoint.y > bottomOffset.y) {
                setContentOffset(bottomOffset, animated: true)
            } else {
                setContentOffset(CGPoint(x: 0, y: childStartPoint.y), animated: true)
            }
        }
    }
    
    // Bonus: Scroll to top
    func scrollToTop() {
        let topOffset = CGPoint(x: 0, y: -contentInset.top)
        setContentOffset(topOffset, animated: true)
    }
    
    // Bonus: Scroll to bottom
    func scrollToBottom() {
        let bottomOffset = scrollBottomOffset()
        if(bottomOffset.y > 0) {
            setContentOffset(bottomOffset, animated: true)
        }
    }
    
    private func scrollBottomOffset() -> CGPoint {
        return CGPoint(x: 0, y: contentSize.height - bounds.size.height + contentInset.bottom)
    }
    
}


