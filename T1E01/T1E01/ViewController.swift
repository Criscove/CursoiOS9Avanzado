//
//  ViewController.swift
//  T1E01
//
//  Created by Cristian Contreras Velásquez on 29-02-16.
//  Copyright © 2016 Cristian Contreras Velásquez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        var numeros:[Int] = [0,0,0,0,0,0,0,0,0,0]
        
        print("Cristian Contreras")
        
        for index in 1...10{
            
            numeros[index-1] = index
        }
        
        print(reciveArraySuma(numeros))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func reciveArraySuma(numbers:[Int])->Int{
        
       var suma = 0
        
        for index in numbers{
            
            suma = suma + index
        }
        
        return suma
    }


}

