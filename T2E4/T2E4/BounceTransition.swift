//
//  BounceTransition.swift
//  T2E4
//
//  Created by Cristian Contreras Velásquez on 14-03-16.
//  Copyright © 2016 Cristian Contreras Velásquez. All rights reserved.
//

import UIKit

class BounceTransition: NSObject,UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval{ return 2.0}


    func animateTransition(transitionContext: UIViewControllerContextTransitioning){
        
            //Obtenemos los controladores implicados en la transición
            let toViewController : UIViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        
            let fromViewController : UIViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
            //Obtenemos el tamaño de la pantalla
        
            let screenBounds : CGRect = UIScreen.mainScreen().bounds
            //Obtenemos la vista contenedor, donde se realiza la transicion
        
            let containerView : UIView = transitionContext.containerView()!
            //Agregamos las vistas sobre el contenedor
        
            containerView.addSubview(fromViewController.view)
            containerView.addSubview(toViewController.view)
        
            //movemos la vista final para que se coloque fuera de los límitesde la pantalla
        
            toViewController.view.frame = CGRectOffset(screenBounds, 0,screenBounds.size.height)
            //Obtenemos la duración de la transición
        
            let duration : NSTimeInterval = transitionDuration(transitionContext)
        
            //Realizamos las animaciones
        
            UIView.animateWithDuration(0.4, animations: {() in fromViewController.view.transform = CGAffineTransformMakeScale(0.9, 0.9)
            }, completion: {(finished) in UIView.animateWithDuration(duration-0.4, delay: 0.0, usingSpringWithDamping: 0.35, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.CurveLinear, animations: {() in toViewController.view.frame = screenBounds
            
            }, completion: {(finished) in
            //Finalizamos el contexto
            
                transitionContext.completeTransition(true)
            })
            
            })
    }
    
}
