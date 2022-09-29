//
//  SplashFlow.swift
//  Rx-Basic-Dev
//
//  Created by 전종훈 on 2022/09/29.
//

import UIKit
import RxFlow
import RxSwift
import RxCocoa
import Hero

class SplashFlow : Flow {
    var viewController = SplashViewController()
    
    private let viewModel = SplashViewModel()
    
    private lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        return viewController
    }()
    
    var root: Presentable {
        return self.rootViewController
    }
    
    init() { }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else {
            return .none
        }
        switch step {
        case .splash:
            return navigationToScreen()
        /*
        case .main:
            endScreen()
            return .end(forwardToParentFlowWithStep: step)*/
        default:
            return .none
        }
    }
    
    private func navigationToScreen() -> FlowContributors {
        viewController = SplashViewController.instantiate(withViewModel: self.viewModel)
        self.rootViewController.pushViewController(viewController, animated: false)
        
        return .one(flowContributor: FlowContributor.contribute(withNextPresentable: viewController, withNextStepper: viewController))
    }
    
    private func endScreen() -> Void {
        Hero.shared.defaultAnimation = HeroDefaultAnimationType.slide(direction: .left)
        self.rootViewController.hero.isEnabled = true
        self.rootViewController.dismiss(animated: false, completion: nil)
    }
}

class SplashStepper : Stepper {
    var steps = PublishRelay<Step>()
    init() {
    }
    
    var initialStep: Step {
        return AppStep.splash
    }
}
