//
//  ViewModel.swift
//  Rx-Basic
//
//  Created by 전종훈 on 2022/09/29.
//

import UIKit
import Reusable

protocol ViewModel {
}

protocol ViewModelBased: AnyObject {
    associatedtype ViewModelType: ViewModel
    var viewModel: ViewModelType! { get set }
}

extension ViewModelBased where Self: StoryboardBased & UIViewController {
    static func instantiate<ViewModelType> (withViewModel viewModel: ViewModelType) -> Self where ViewModelType == Self.ViewModelType {
        let viewController = Self.instantiate()
        viewController.viewModel = viewModel
        return viewController
    }
}