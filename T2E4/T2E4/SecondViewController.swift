//
//  SecondViewController.swift
//  T2E4
//
//  Created by Cristian Contreras Velásquez on 14-03-16.
//  Copyright © 2016 Cristian Contreras Velásquez. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UIViewControllerTransitioningDelegate {
    
    var transition : Transition!
    
    
    
    func animationControllerForPresentedController(presented:
        UIViewController, presentingController presenting: UIViewController,
        sourceController source: UIViewController) ->
        UIViewControllerAnimatedTransitioning? {
        return self.transition
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.transition = Transition()        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender:
        AnyObject?) {
        if (segue.identifier == "showCustomTransition2"){
        let toVC : UIViewController = segue.destinationViewController
        as UIViewController
        toVC.transitioningDelegate = self
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
