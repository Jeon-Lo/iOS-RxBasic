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

class SplashViewController: UIViewStepController<SplashViewModel>, StoryboardBased, ViewModelBased, Stepper {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
}

