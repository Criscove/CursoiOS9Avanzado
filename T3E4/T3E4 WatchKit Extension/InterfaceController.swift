//
//  InterfaceController.swift
//  T3E4 WatchKit Extension
//
//  Created by Cristian Contreras Velásquez on 24-03-16.
//  Copyright © 2016 Cristian Contreras Velásquez. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    @IBOutlet var slider: WKInterfaceSlider!
    @IBOutlet var picker: WKInterfacePicker!
    @IBAction func pulsarBoton() {
        
        let cancel = WKAlertAction(title: "Cancel", style:
            WKAlertActionStyle.Cancel, handler: { () -> Void in
        })
        let action = WKAlertAction(title: "Pulsa", style:
            WKAlertActionStyle.Default, handler: { () -> Void in
        })
        
        self.presentAlertControllerWithTitle("Titulo", message: "Mensaje para la alerta", preferredStyle:WKAlertControllerStyle.SideBySideButtonsAlert, actions: [cancel, action])    }
    

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        var pickerItems: [WKPickerItem] = []
        for i in 1...10 {
            let item = WKPickerItem()
            item.title = "Picker item \(i)"
            pickerItems.append(item)
        }
        self.picker.setItems(pickerItems)
    
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
