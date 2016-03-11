//
//  SecondViewController.swift
//  T2E2
//
//  Created by Cristian Contreras Velásquez on 11-03-16.
//  Copyright © 2016 Cristian Contreras Velásquez. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBAction func button(sender: AnyObject) {
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    @IBOutlet weak var label: UILabel!
    var etiqueta = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = etiqueta

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
