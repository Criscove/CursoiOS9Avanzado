//
//  SeguePersonalizado.swift
//  T2E2
//
//  Created by Cristian Contreras Velásquez on 11-03-16.
//  Copyright © 2016 Cristian Contreras Velásquez. All rights reserved.
//

import UIKit

class SeguePersonalizado: UIStoryboardSegue {
    
    override func perform(){
        
        let source : UIViewController = self.sourceViewController as UIViewController
        
        let destination : UIViewController = self.destinationViewController as UIViewController
        
        UIGraphicsBeginImageContext(source.view.bounds.size)
        
        source.view.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        
        let sourceImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()
        
        destination.view.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        
        let destinationImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        let sourceImageView : UIImageView = UIImageView (image: sourceImage)
        
        let destinationImageView : UIImageView = UIImageView (image: destinationImage)
        
        source.view.addSubview(sourceImageView)
        
        source.view.addSubview(destinationImageView)
        
        destinationImageView.transform = CGAffineTransformMakeTranslation(destinationImageView.frame.size.width,0)
        
        UIView.animateWithDuration(1.0, animations: { () in sourceImageView.transform = CGAffineTransformMakeTranslation(-sourceImageView.frame.size.width, 0)
        
        destinationImageView.transform = CGAffineTransformMakeTranslation(0, 0)
        
        }, completion: { (finished) in
        // Una vez hecha la animación es importante hacer realmente la transición.
            
        source.presentViewController(destination, animated: false, completion: { () -> Void in
        // Eliminamos las imágenes creadas en el contexto
        
        sourceImageView.removeFromSuperview()
            
        destinationImageView.removeFromSuperview()
        })
            
        })
    }
}
