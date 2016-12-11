//
//  ViewController.swift
//  TwoFingersChords
//
//  Created by Nikita Simakov on 10.12.16.
//  Copyright © 2016 Nikita Simakov. All rights reserved.
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

    @IBAction func chordButtonDown(_ sender: UIButton) {
        debugPrint("chord: ", sender.currentTitle!)
    }

    @IBAction func noteButtonDown(_ sender: UIButton) {
        debugPrint("note down:", sender.currentTitle!)
    }
    
    @IBAction func noteButtonUp(_ sender: UIButton) {
        debugPrint("note up:", sender.currentTitle!)
    }
    
}

