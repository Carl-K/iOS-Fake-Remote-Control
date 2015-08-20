//
//  ViewController.swift
//  KrukC-Homework4
//
//  Created by Ryan Kruk on 5/3/15.
//  Copyright (c) 2015 DePaul University. All rights reserved.
//

import UIKit

enum PowerOptions : String
{
    case On = "ON "
    case Off = "OFF"
    var state: String
    {
        return self.rawValue
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        TVPowerLabel.text! = PowerOptions.Off.state
        SpeakerVolumeLabel.text! = "50"
        ChannelLabel.text! = "00000"
        
        PowerSwitch.on = false
        VolumeSlider.enabled = false
        
        zeroButton.enabled = false
        oneButton.enabled = false
        twoButton.enabled = false
        threeButton.enabled = false
        fourButton.enabled = false
        fiveButton.enabled = false
        sixButton.enabled = false
        sevenButton.enabled = false
        eightButton.enabled = false
        nineButton.enabled = false
        ChannelUp.enabled = false
        ChannelDown.enabled = false
        
        Favorites.enabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    @IBAction func NumberSelector(sender: UIButton) {
        if (didCrement == true)
        {
            ChannelLabel.text! = "00000"
            didCrement = false
        }
        ChannelLabel.text! = ChannelLabel.text!.substringFromIndex(advance(ChannelLabel.text!.startIndex, 1)) + sender.currentTitle!
        channel = ChannelLabel.text!.toInt()!
    }
    
    @IBAction func powerSelector(sender: UISwitch) {
        if (!PowerSwitch.on)
        {
            TVPowerLabel.text! = PowerOptions.Off.state
            
            VolumeSlider.enabled = false
            
            zeroButton.enabled = false
            oneButton.enabled = false
            twoButton.enabled = false
            threeButton.enabled = false
            fourButton.enabled = false
            fiveButton.enabled = false
            sixButton.enabled = false
            sevenButton.enabled = false
            eightButton.enabled = false
            nineButton.enabled = false
            ChannelUp.enabled = false
            ChannelDown.enabled = false
            
            Favorites.enabled = false
        }
        else
        {
            TVPowerLabel.text! = PowerOptions.On.state
            
            VolumeSlider.enabled = true
            
            zeroButton.enabled = true
            oneButton.enabled = true
            twoButton.enabled = true
            threeButton.enabled = true
            fourButton.enabled = true
            fiveButton.enabled = true
            sixButton.enabled = true
            sevenButton.enabled = true
            eightButton.enabled = true
            nineButton.enabled = true
            ChannelUp.enabled = true
            ChannelDown.enabled = true
            
            Favorites.enabled = true
        }
    }
    
    @IBAction func volumeChange(sender: UISlider) {
        SpeakerVolumeLabel.text! = String(Int(sender.value))
    }
    
    @IBAction func channelChange(sender: UIButton) {
        var title = sender.currentTitle!
        if (title == "Ch +" && channel < 99999)
        {
            channel += 1
            if (channel < 10)
            {
                ChannelLabel.text! = "0000"
            }
            else if (channel < 100)
            {
                ChannelLabel.text! = "000"
            }
            else if (channel < 1000)
            {
                ChannelLabel.text! = "00"
            }
            else if (channel < 10000)
            {
                ChannelLabel.text! = "0"
            }
            else
            {
                ChannelLabel.text! = ""
            }
            ChannelLabel.text! = ChannelLabel.text! + String(channel)
            didCrement = true
        }
        else if (title == "Ch -" && channel > 0)
        {
            channel -= 1
            if (channel < 10)
            {
                ChannelLabel.text! = "0000"
            }
            else if (channel < 100)
            {
                ChannelLabel.text! = "000"
            }
            else if (channel < 1000)
            {
                ChannelLabel.text! = "00"
            }
            else if (channel < 10000)
            {
                ChannelLabel.text! = "0"
            }
            else
            {
                ChannelLabel.text! = ""
            }
            ChannelLabel.text! = ChannelLabel.text! + String(channel)
            didCrement = true
        }
        
    }
    
    @IBAction func favoritesPick(sender: UISegmentedControl) {
        var name = sender.titleForSegmentAtIndex(sender.selectedSegmentIndex)
        
        switch(name!)
        {
            case "ABC" :
                ChannelLabel.text! = "00007"
                break
            case "NBC" :
                ChannelLabel.text! = "00005"
                break
            case "CBS" :
                ChannelLabel.text! = "00038"
                break
            case "FOX" :
                ChannelLabel.text! = "00026"
                break
            default :
                break
        }
        
        didCrement = true
    }
    
    var channel = 0
    var didCrement = false

    @IBOutlet weak var TVPowerLabel: UILabel!
    
    @IBOutlet weak var SpeakerVolumeLabel: UILabel!
    
    @IBOutlet weak var ChannelLabel: UILabel!

    //------
    
    @IBOutlet weak var PowerSwitch: UISwitch!
    
    @IBOutlet weak var VolumeSlider: UISlider!
    
    
    @IBOutlet weak var zeroButton: UIButton!
    
    @IBOutlet weak var oneButton: UIButton!
    
    @IBOutlet weak var twoButton: UIButton!
    
    @IBOutlet weak var threeButton: UIButton!
    
    @IBOutlet weak var fourButton: UIButton!
    
    @IBOutlet weak var fiveButton: UIButton!
    
    @IBOutlet weak var sixButton: UIButton!
    
    @IBOutlet weak var sevenButton: UIButton!
    
    @IBOutlet weak var eightButton: UIButton!
    
    @IBOutlet weak var nineButton: UIButton!
    
    @IBOutlet weak var ChannelUp: UIButton!
    
    @IBOutlet weak var ChannelDown: UIButton!
    
    @IBOutlet weak var Favorites: UISegmentedControl!
    
    
    
    
    
    
    
    
    
}

