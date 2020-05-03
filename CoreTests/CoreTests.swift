//
//  CoreTests.swift
//  CoreTests
//
//  Created by Dima Virych on 02.05.2020.
//  Copyright © 2020 Virych. All rights reserved.
//

import XCTest
import Core

class CoreTests: XCTestCase {
    
    let parser: Parcering = Parcer()

    func testExample() throws {
        
        let shell = Shell.execute("instruments -s devices")
        let aaa = parser.parceDeviceList(from: shell)
        
        XCTAssertNotEqual(aaa.count, 0)
    }
}
