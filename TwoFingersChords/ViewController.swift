//
//  ViewController.swift
//  TwoFingersChords
//
//  Created by Nikita Simakov on 10.12.16.
//  Copyright © 2016 Nikita Simakov. All rights reserved.
//

import UIKit
import AudioKit

class ViewController: UIViewController {
    
    var midi = AKMIDI()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        midi.openOutput()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func chordButtonDown(_ sender: UIButton) {
        debugPrint("chord: ", sender.currentTitle!)
    }

    @IBAction func noteButtonDown(_ sender: UIButton) {
//        debugPrint("note down:", sender.currentTitle!)
        midi.sendNoteOnMessage(noteNumber: Note(sender.currentTitle!).toMidiNote, velocity: 100)
    }
    
    @IBAction func noteButtonUp(_ sender: UIButton) {
//        debugPrint("note up:", sender.currentTitle!)
        midi.sendNoteOffMessage(noteNumber: Note(sender.currentTitle!).toMidiNote, velocity: 100)
    }
    
}

