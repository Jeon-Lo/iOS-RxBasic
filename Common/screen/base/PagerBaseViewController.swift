//
//  PagerBaseViewController.swift
//  ChangoTuri
//
//  Created by 전종훈 on 2021/08/31.
//

class PagerBaseViewController<T:BaseViewModel> : UIViewStepController<T> {
    var pageIndex = 0
    var delegate : PagerDelegate? = nil
}
