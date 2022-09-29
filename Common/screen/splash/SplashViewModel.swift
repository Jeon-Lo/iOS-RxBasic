//
//  SplashViewModel.swift
//  Rx-Basic
//
//  Created by 전종훈 on 2022/09/29.
//

import RxSwift
import RxCocoa

class SplashViewModel: ViewModel, ViewModelBased {
    var viewModel: SplashViewModel!
    var disposeBag = DisposeBag()
    
    
    internal let error = BehaviorRelay<Error?>(value: nil)
    internal let toast = BehaviorRelay<String>(value: "")
    
    init() {
        
    }
}

