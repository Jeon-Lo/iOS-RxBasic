//
//  BaseFlow.swift
//  Rx-Basic
//
//  Created by 전종훈 on 2022/09/29.
//

import UIKit
import RxFlow
import RxSwift
import RxCocoa

protocol NavigateProtocol {
    func navigateProtocol(to step : AppStep) -> FlowContributors
}

class BaseFlow : Flow {
    var delegate : NavigateProtocol!
    var root: Presentable {
        return self.rootViewController
    }
    
    lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        return viewController
    }()
    
    init() {
    }
    
    func navigateFromBase(to step: AppStep) -> FlowContributors {
        switch step {
        default :
            return .none
        }
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else {
            return .none
        }
        return delegate.navigateProtocol(to: step)
    }
    
    func endScreen(_ completion: (() -> Void)? = nil) -> Void {
        self.rootViewController.dismiss(animated: false, completion: completion)
    }
    
    func navigationToTargetScreen(_ stepper : Stepper, _ flow : BaseFlow) -> FlowContributors {
        Flows.use(flow, when: .ready) { [unowned self] (root: UINavigationController) in
            root.modalPresentationStyle = .fullScreen
            self.rootViewController.present(root, animated: true)
        }
        return .one(flowContributor: FlowContributor.contribute(withNextPresentable: flow, withNextStepper: stepper))
    }
    
}
