//
//  Transition.swift
//  T2E4
//
//  Created by Cristian Contreras Velásquez on 14-03-16.
//  Copyright © 2016 Cristian Contreras Velásquez. All rights reserved.
//

import UIKit

class Transition: NSObject,UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval{ return 2.0}
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning){
        //Obtenemos los controladores implicados en la transición
        
        let toView: UIView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        
        let fromView: UIView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        
        let containerView: UIView = transitionContext.containerView()!
        
        containerView.addSubview(toView)
        
        containerView.sendSubviewToBack(toView)
        
        let duration:NSTimeInterval = self.transitionDuration(transitionContext)
        
        UIView.animateWithDuration(duration, animations: {() in
        fromView.alpha = 0.0
        }, completion: {(finished) in
        if(transitionContext.transitionWasCancelled()){
        fromView.alpha = 1.0
    }
        else{
        fromView.removeFromSuperview()
        fromView.alpha = 1.0
        }
        transitionContext.completeTransition(true)
        })
    }
}
