//
//  DuoContainerController.swift
//  TransitionTest
//
//  Created by Joseph Falcone on 9/22/17.
//  Copyright © 2017 Joseph Falcone. All rights reserved.
//

import UIKit

class DuoContainerController: UIViewController
{
    let c_Header = HeaderController()
    //var c_Body = WTPBodyController()
    let c_Body = UINavigationController()
    
    let gesture_EdgePanLeft = UIScreenEdgePanGestureRecognizer()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        gesture_EdgePanLeft.addTarget(self, action: #selector(handleGesture(_:)))
        gesture_EdgePanLeft.edges = .left
        
        addChildViewController(c_Header)
        addChildViewController(c_Body)
        
        view.addSubview(c_Header.view)
        view.addSubview(c_Body.view)
        
        if  let vh = c_Header.view,
            let vb = c_Body.view
        {
            vh.constrain_edges(to: self.view, excludingEdge: .bottom)
            vb.constrain_topToBottom(of: vh)
            vb.constrain_edges(to: self.view, excludingEdge: .top)
        }
        
        // Nav controller testing
        c_Body.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0.5, alpha: 1.0)
        c_Body.isNavigationBarHidden = true
        
        let c1 = SimpleChildController()
        let c2 = SimpleChildController()
        let c3 = SimpleChildController()
        
        c1.label_Title.text = "C1\nHeader 100"
        c2.label_Title.text = "Controller2\nHeader 200"
        c3.label_Title.text = "C3\nHeader100"
        
        c1.action_prev = { self.c_Body.popViewController(animated: true) }
        c1.action_next = { self.c_Body.pushViewController(c2, animated: true) }
        c2.action_prev = { self.c_Body.popViewController(animated: true) }
        c2.action_next = { self.c_Body.pushViewController(c3, animated: true) }
        c3.action_prev = { self.c_Body.popViewController(animated: true) }
        
        c_Body.pushViewController(c1, animated: false)
        c_Body.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.view.addGestureRecognizer(gesture_EdgePanLeft)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.view.removeGestureRecognizer(gesture_EdgePanLeft)
    }
    
    @objc func handleGesture(_ g : UIGestureRecognizer)
    {   
        if g == gesture_EdgePanLeft
        {
            let gesture = gesture_EdgePanLeft
            let percent = gesture.translation(in: gesture.view!).x / gesture.view!.bounds.size.width
            
            //print("gesture_EdgePanLeft: \(percent)")
            
            if gesture.state == .began
            {
                // if the navigation controller wasn't, itself, presented with a custom transition,
                // you insert this `guard` statement to prevent interactive dismissal performed below.
                //
                // guard viewControllers.count > 1 else {
                //     gesture.state = .cancelled
                //     return
                // }
                
                interactionController = UIPercentDrivenInteractiveTransition()
                if c_Body.viewControllers.count > 1 {
                    c_Body.popViewController(animated: true)
                } else {
                    dismiss(animated: true)
                }
            }
            else if gesture.state == .changed
            {
                interactionController?.update(percent)
                
                print("Update IC: \(interactionController?.percentComplete)")
            }
            else if gesture.state == .ended
            {
                if percent > 0.5 && gesture.state != .cancelled {
                    interactionController?.finish()
                } else {
                    interactionController?.cancel()
                }
                interactionController = nil
            }
        }
    }
    
    // This is our Interaction Controller, which conforms to UIViewControllerInteractiveTransitioning. Apple's concrete class suits our needs.
    var interactionController : UIPercentDrivenInteractiveTransition?
}

extension DuoContainerController: UIViewControllerTransitioningDelegate
{
}

extension DuoContainerController : UINavigationControllerDelegate
{
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        //        viewController.transitioningDelegate = self
        //        navigationController.transitioningDelegate = self
    }
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
            return PushAnimator()
        }
        if operation == .pop {
            return PopAnimator()
        }
        return nil
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactionController
    }
}
