//
//  Animator.swift
//  TransitionTest
//
//  Created by Joseph Falcone on 9/22/17.
//  Copyright © 2017 Joseph Falcone. All rights reserved.
//

import UIKit

class PushAnimator : NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 2.0
    }
    
    func animateTransition(using context: UIViewControllerContextTransitioning) {
        let toView = context.viewController(forKey: .to)!.view!
        
        context.containerView.addSubview(toView)
        
        toView.alpha = 0.0
        
        UIView.animate(withDuration: transitionDuration(using: context), animations: {
            toView.alpha = 1.0
        }, completion: { finished in
            context.completeTransition(!context.transitionWasCancelled)
        })
    }
    
}

class PopAnimator : NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 2.0
    }
    
    func animateTransition(using context: UIViewControllerContextTransitioning) {
        let toView   = context.viewController(forKey: .to)!.view!
        let fromView = context.viewController(forKey: .from)!.view!
        
        context.containerView.insertSubview(toView, belowSubview: fromView)
        
        UIView.animate(withDuration: transitionDuration(using: context), animations: {
            fromView.alpha = 0.0
        }, completion: { finished in
            context.completeTransition(!context.transitionWasCancelled)
        })
    }
}

