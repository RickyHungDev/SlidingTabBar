//
//  SlidingTabAnimationController.swift
//
//
//  Created by Adam Bardon on 02/03/16.
//  Copyright © 2016 Adam Bardon. All rights reserved.
//
//  This software is released under the MIT License.
//  http://opensource.org/licenses/mit-license.php

import UIKit

public class SlidingTabAnimatedTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
    
    public enum TransitioningDirection {
        case Left
        case Right
        case Both
        case Reverse
    }
    
    private let transitionDuration: NSTimeInterval
    private let shouldUseDirection: TransitioningDirection
    private let fromIndex: Int
    private let toIndex: Int
    
    public init(transitionDuration: NSTimeInterval, direction: TransitioningDirection? = .Both, fromIndex: Int, toIndex: Int) {
        self.transitionDuration = transitionDuration
        self.shouldUseDirection = direction!
        self.fromIndex = fromIndex
        self.toIndex = toIndex
        
    }
    
    public func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return transitionDuration
    }
    
    public func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        if let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey),
            let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) {
            
            let fromView = fromVC.view
            let toView = toVC.view
        
            let containerView = transitionContext.containerView()!
            
            containerView.clipsToBounds = false
            containerView.addSubview(toView)
            
            let toViewEndFrame = transitionContext.finalFrameForViewController(toVC)
            var toViewStartFrame = toViewEndFrame
            
            var fromViewEndFrame = fromView.frame
            
            switch shouldUseDirection {
            case .Both:
                let direction = self.toIndex - self.fromIndex
                // .Right
                if direction > 0 {
                    fromViewEndFrame.origin.x -= (containerView.frame.width)
                    toViewStartFrame.origin.x += (containerView.frame.width)
                }
                // .Left
                else {
                    fromViewEndFrame.origin.x += (containerView.frame.width)
                    toViewStartFrame.origin.x -= (containerView.frame.width)
                }
            case .Reverse:
                let direction = self.toIndex - self.fromIndex
                // .Right
                if direction > 0 {
                    fromViewEndFrame.origin.x += (containerView.frame.width)
                    toViewStartFrame.origin.x -= (containerView.frame.width)
                }
                    // .Left
                else {
                    fromViewEndFrame.origin.x -= (containerView.frame.width)
                    toViewStartFrame.origin.x += (containerView.frame.width)
                }
            case .Left:
                fromViewEndFrame.origin.x += (containerView.frame.width)
                toViewStartFrame.origin.x -= (containerView.frame.width)
            // .Right
            default:
                fromViewEndFrame.origin.x -= (containerView.frame.width)
                toViewStartFrame.origin.x += (containerView.frame.width)
            }
            
            toView.frame = toViewStartFrame
            
            UIView.animateWithDuration(transitionDuration(transitionContext), delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                toView.frame = toViewEndFrame
                fromView.frame = fromViewEndFrame
                }, completion: { (completed) -> Void in
                    fromView.removeFromSuperview()
                    transitionContext.completeTransition(completed)
                    containerView.clipsToBounds = true
            })                
        }
    }
    
}

