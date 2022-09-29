//
//  SplashViewController.swift
//  Rx-Basic
//
//  Created by 전종훈 on 2022/09/29.
//

import UIKit
import Reusable
import RxSwift
import RxFlow
import RxCocoa

class SplashViewController: UIViewStepController, StoryboardBased, ViewModelBased, Stepper {
    var viewModel: SplashViewModel!
    
    private func initView() {
    }
    
    private func initObservable(_ disposeBag : DisposeBag) {
        /*
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
            .disposed(by: disposeBag)*/
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
        self.initObservable(viewModel.disposeBag)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
}

