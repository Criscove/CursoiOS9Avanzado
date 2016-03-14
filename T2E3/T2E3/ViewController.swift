//
//  ViewController.swift
//  T2E3
//
//  Created by Cristian Contreras Velásquez on 14-03-16.
//  Copyright © 2016 Cristian Contreras Velásquez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func boton1(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle:
            NSBundle.mainBundle())
        let viewController:UIViewController =
        storyboard.instantiateViewControllerWithIdentifier("NuevoViewController"
            ) as UIViewController
        self.presentViewController(viewController, animated: true,
            completion: nil)
    }

    @IBAction func boton2(sender: AnyObject) {
            let vc = NewViewControllerClass()
            self.presentViewController(vc, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

