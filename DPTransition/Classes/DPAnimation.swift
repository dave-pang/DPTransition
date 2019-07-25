//
//  DPAnimation.swift
//  DPTemplate
//
//  Created by Dave on 23/07/2019.
//

import UIKit

/// 모달 present 애니메이션 커스텀 구현
class AnimationFromPresent: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 2
    }
    
    func animateTransition(using ctx: UIViewControllerContextTransitioning) {
        guard let to = ctx.viewController(forKey: .to) else { return }
        
        to.beginAppearanceTransition(true, animated: true)
        to.view.transform = CGAffineTransform(translationX: 0, y: ctx.containerView.frame.height)
        ctx.containerView.addSubview(to.view)
        
        UIView.animate(withDuration: transitionDuration(using: ctx), delay:0, options: [], animations: { [weak to] in
            to?.view.transform = .identity
            }, completion: { [weak to] _ in
                ctx.completeTransition(!ctx.transitionWasCancelled)
                
                to?.endAppearanceTransition()
        })
    }
}

/// 모달 dismiss 애니메이션 커스텀 구현
class AnimationFromDismiss: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.35
    }
    
    func animateTransition(using ctx: UIViewControllerContextTransitioning) {
        guard let from = ctx.viewController(forKey: .from) else { return }
        guard let to = ctx.viewController(forKey: .to) else { return }
        
        from.beginAppearanceTransition(false, animated: true)
        
        ctx.containerView.insertSubview(to.view, belowSubview: from.view)
        
        UIView.animate(withDuration: transitionDuration(using: ctx), delay:0, options: [], animations: { [weak from] in
            from?.view?.transform = CGAffineTransform(translationX: 0, y: ctx.containerView.frame.height)
            }, completion: { [weak from] (finished: Bool) in
                ctx.completeTransition(!ctx.transitionWasCancelled)
                
                from?.endAppearanceTransition()
                
                if finished {
                    from?.view.removeFromSuperview()
                }
        })
    }
}
