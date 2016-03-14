//
//  ViewController.swift
//  T2E4
//
//  Created by Cristian Contreras Velásquez on 14-03-16.
//  Copyright © 2016 Cristian Contreras Velásquez. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIViewControllerTransitioningDelegate {
    
    var bounce : BounceTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bounce = BounceTransition()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func animationControllerForPresentedController(presented:
        UIViewController, presentingController presenting: UIViewController,
        sourceController source: UIViewController) ->
        UIViewControllerAnimatedTransitioning? {
        return self.bounce
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender:
        AnyObject?) {
        if (segue.identifier == "showCustomTransition"){
        let toVC : UIViewController = segue.destinationViewController
        as UIViewController
        toVC.transitioningDelegate = self
        }
    }

}

