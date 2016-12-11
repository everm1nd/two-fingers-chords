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
        midi.sendNoteOnMessage(noteNumber: noteNameToCode(sender.currentTitle!), velocity: 100)
    }
    
    @IBAction func noteButtonUp(_ sender: UIButton) {
//        debugPrint("note up:", sender.currentTitle!)
        midi.sendNoteOffMessage(noteNumber: noteNameToCode(sender.currentTitle!), velocity: 100)
    }
    
    private func noteNameToCode(_ name: String) -> Int {
        let offset = ["C":0, "C#":1, "D":2, "D#":3, "E":4, "F":5, "F#":6, "G":7, "G#":8, "A":9, "A#":10, "B":11]
        let octave = Int(String(name.characters.last!))! // last character represents octave
        let note = String(name.characters.dropLast()) // find 1 or 2 characters represent note
        
        debugPrint(note, octave, (octave * 12 + offset[note]!))
        
        return octave * 12 + offset[note]!
    }
    
}

