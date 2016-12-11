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
    var chord = "Maj"

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
        self.chord = sender.currentTitle!
    }

    @IBAction func noteButtonDown(_ sender: UIButton) {
//        debugPrint("note down:", sender.currentTitle!)
        playChord(chord: self.chord, root: Note(sender.currentTitle!))
    }
    
    @IBAction func noteButtonUp(_ sender: UIButton) {
//        debugPrint("note up:", sender.currentTitle!)
        muteChord(chord: self.chord, root: Note(sender.currentTitle!))
    }
    
    private func playChord(chord: String, root: Note) {
        for note in calculateChord(chord: chord, root: root) {
            midi.sendNoteOnMessage(noteNumber: note.midiCode, velocity: 100)
        }
    }
    
    private func muteChord(chord: String, root: Note) {
        for note in calculateChord(chord: chord, root: root) {
            midi.sendNoteOffMessage(noteNumber: note.midiCode, velocity: 100)
        }
    }
    
    private func calculateChord(chord: String, root: Note) -> [Note] {
        return [Note("C3"),Note("E3"),Note("G3")]
    }
    
}

