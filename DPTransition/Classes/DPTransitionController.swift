//
//  DPTransitionController.swift
//  DPTemplate
//
//  Created by Dave on 23/07/2019.
//

import UIKit

open class DPTransitionController: UIViewController {

    public var transition: DPTransition? {
        didSet {
            transitioningDelegate = self
            modalPresentationStyle = .custom
        }
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension DPTransitionController: UIViewControllerTransitioningDelegate {
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimationFromPresent()
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimationFromDismiss()
    }
}
