//
//  TwoFingersChordsTests.swift
//  TwoFingersChordsTests
//
//  Created by Nikita Simakov on 10.12.16.
//  Copyright © 2016 Nikita Simakov. All rights reserved.
//

import XCTest
@testable import TwoFingersChords

class NoteTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testBasicInitializer() {
        let note = Note("C3")
        XCTAssertEqual(note.note, "C")
        XCTAssertEqual(note.octave, 3)
    }
    
    func testValueInitializer() {
        let note = Note(value: 60)
        XCTAssertEqual(note.code, "C5")
    }
    
    func testTranspose() {
        let note = Note("C3")
        XCTAssertEqual(note.transpose(0), Note("C3"))
        XCTAssertEqual(note.transpose(5), Note("F3"))
        XCTAssertEqual(note.transpose(-7), Note("F2"))
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
