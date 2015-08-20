//
//  DVRViewController.swift
//  KrukC-Homework4
//DVR Remote Control

//  Created by Ryan Kruk on 5/9/15.
//  Copyright (c) 2015 DePaul University. All rights reserved.
//

import UIKit

class DVRViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        powerSwitch.on = false
        powerState.text! = "OFF"
        dvrState.text! = "OFF"
        for button in dvrButtons
        {
            button.enabled = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func powerSwitchActivated(sender: UISwitch) {
        
        if ( powerState.text! == "OFF")
        {
            powerState.text! = " ON"
            dvrState.text! = "STOP"
        }
        else
        {
            powerState.text! = "OFF"
            dvrState.text! = "OFF"
        }
        for button in dvrButtons
        {
            button.enabled = !button.enabled
        }
        
    }
    
    @IBAction func dvrSwitchActivated(sender: UIButton) {
        if let name = sender.currentTitle
        {
            if ( name == "Pause" || name == "Fast Forward" || name == "Fast Rewind" )
            {
                if (dvrState.text! == "Play")
                {
                    dvrState.text! = name
                }
                else
                {
                    popUp( name )
                }
            }
            else if ( name == "Record" )
            {
                if (dvrState.text! == "Stop")
                {
                    dvrState.text! = name
                }
                else
                {
                    popUp( name )
                }
            }
            else
            {
                dvrState.text! = name
            }
        }
    }
    
    func popUp (issue : String)
    {
        var message = issue + " is an invalid operation from the current dvr state\nDo you want to cancel operation change or force operation change?"
        let title = "ERROR"
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        let cancelAction1 = UIAlertAction(title: "Force", style: .Destructive, handler: { (_) -> Void in self.forceChange( issue ) } )
        alertController.addAction(cancelAction)
        alertController.addAction(cancelAction1)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    func forceChange(issue : String)
    {
        dvrState.text! = "FORCED DONE"
        
        var message = issue + " will now be applied"
        let title = "Issue Resolving"
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "OK", style: .Destructive, handler: { (_) -> Void in self.forceChangeHelper( issue ) } )
        alertController.addAction(cancelAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    func forceChangeHelper( issue : String )
    {
        dvrState.text! = issue
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func ToTVController(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBOutlet var dvrButtons: [UIButton]!
    
    @IBOutlet weak var powerState: UILabel!
    @IBOutlet weak var dvrState: UILabel!
    
    @IBOutlet weak var powerSwitch: UISwitch!
}
