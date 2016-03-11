//
//  ViewController.swift
//  T2E2
//
//  Created by Cristian Contreras Velásquez on 08-03-16.
//  Copyright © 2016 Cristian Contreras Velásquez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "SeguePersonalizado"){
        
        let destino = segue.destinationViewController as! SecondViewController
        
        destino.etiqueta = "Hola Mundo"
        }
    }

}

