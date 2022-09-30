//
//  BaseViewModel.swift
//  Rx-Basic
//
//  Created by 전종훈 on 2022/09/30.
//

import RxSwift
import RxCocoa

class BaseViewModel: ViewModel {
    var disposeBag = DisposeBag()
    
    internal let error = BehaviorRelay<Error?>(value: nil)
    internal let toast = BehaviorRelay<String>(value: "")
    
    required init() {
    }
}

