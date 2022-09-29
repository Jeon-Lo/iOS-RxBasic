//
//  AppFlow.swift
//  Rx-Basic
//
//  Created by 전종훈 on 2022/09/29.
//
import RxFlow
import RxSwift
import RxCocoa

class AppFlow: Flow {
    var root: Presentable {
        return self.rootWindow
    }
    private let rootWindow: UIWindow
    
    let viewController = BehaviorRelay<UIViewController?>(value: nil)
    
    init(withWindow window: UIWindow) {
        self.rootWindow = window
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else { return FlowContributors.none }
        switch step {
        case .splash:
            return navigationToSplashScreen()
        default:
            return FlowContributors.none
        }
    }
    
    private func navigationToSplashScreen() -> FlowContributors {
        let flow = SplashFlow()
        
        Flows.use(flow, when: .ready) { [unowned self] (root) in
            self.rootWindow.rootViewController = root
            self.viewController.accept(root)
        }
        return .one(flowContributor: FlowContributor.contribute(withNextPresentable: flow, withNextStepper: OneStepper(withSingleStep: AppStep.splash)))
    }
}

class AppStepper: Stepper {
    var steps = PublishRelay<Step>()
    
    init() {
    }
    
    var initialStep: Step {
        return AppStep.splash
    }
    
}
