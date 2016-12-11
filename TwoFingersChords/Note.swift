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
    
    var code: String // text representation of note+chord
    var octave: Int
    var note: String
    
    var midiCode: Int {
        debugPrint(note, octave, (octave * 12 + note_offset[note]!))
        
        return self.toInt()
    }
    
    init(_ code: String) {
        self.code = code
        self.octave = Int(String(code.characters.last!))! // last character represents octave
        self.note = String(code.characters.dropLast()) // find 1 or 2 characters represent note
    }
    
    init(value: Int) {
        self.octave = value / 12
        self.note = note_offset.filter { $0.1 == value % 12 }.first!.key
        self.code = note + String(octave)
    }
    
    func transpose(_ steps: Int) -> Note {
        let noteValue = self.toInt() + steps
        return Note(value: noteValue)
    }
    
    private func toInt() -> Int {
        return octave * 12 + note_offset[note]!
    }
}

// MARK: Equatable

extension Note: Equatable {}

func ==(lhs: Note, rhs: Note) -> Bool {
    return lhs.code == rhs.code
}

// MARK: CustomStringConvertible

extension Note: CustomStringConvertible {
    // MARK: CustomStringConvertible
    
    var description: String {
        return "Note(\(code))"
    }
}
