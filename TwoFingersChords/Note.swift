//
//  Note.swift
//  TwoFingersChords
//
//  Created by Nikita Simakov on 11.12.16.
//  Copyright © 2016 Nikita Simakov. All rights reserved.
//

import Foundation

class Note {
    private let note_offset = ["C":0, "C#":1, "D":2, "D#":3, "E":4, "F":5, "F#":6, "G":7, "G#":8, "A":9, "A#":10, "B":11]
    
    var code = ""
    
    var toMidiNote: Int {
        let octave = Int(String(code.characters.last!))! // last character represents octave
        let note = String(code.characters.dropLast()) // find 1 or 2 characters represent note
        
        debugPrint(note, octave, (octave * 12 + note_offset[note]!))
        
        return octave * 12 + note_offset[note]!
    }
    
    init(_ code: String) {
        self.code = code
    }
}
