//
//  BaseTestCase.swift
//  SwiftDataStructureTests
//
//  Created by Milkyo on 2022/05/01.
//

import XCTest

class BaseTestCase: XCTestCase {
    func given(_ task: () -> Void) {
        task()
    }
    
    func when(_ task: () -> Void) {
        task()
    }

    func then(_ task: () -> Void) {
        task()
    }
}
