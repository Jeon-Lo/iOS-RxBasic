//
//  ViewControllerProtocol.swift
//  ChangoTuri
//
//  Created by 전종훈 on 2021/08/31.
//

import RxSwift

protocol ViewControllerProtocol {
    associatedtype T : ViewModel
    
    func initView()
    
    func initObservable(_ disposeBag : DisposeBag)
}

