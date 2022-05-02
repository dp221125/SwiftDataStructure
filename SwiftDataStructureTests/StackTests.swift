//
//  StackTests.swift
//  SwiftDataStructureTests
//
//  Created by Milkyo on 2022/05/01.
//

import XCTest

class StackTests: BaseTestCase {

    var stack: Stack<Int>!
    
    func test_push() {
        given {
            self.stack = Stack<Int>()
        }
        
        when {
            self.stack.push(data: 1)
            self.stack.push(data: 2)
            self.stack.push(data: 3)
            self.stack.push(data: 4)
            self.stack.push(data: 5)
        }
        
        then {
            XCTAssertEqual(self.stack.description,
            """
            5
            4
            3
            2
            1
            """
            )
            
            XCTAssertEqual(self.stack.count, 5)
            XCTAssertFalse(self.stack.isEmpty)
        }
    }
    
    func test_push_pop() {
        
        var popResult: Node<Int>!
        
        given {
            self.stack = Stack<Int>()
        }
        
        when {
            self.stack.push(data: 1)
            self.stack.push(data: 2)
            self.stack.push(data: 3)
            self.stack.push(data: 4)
            self.stack.push(data: 5)
            popResult = self.stack.pop()
        }
        
        then {
            XCTAssertEqual(self.stack.description,
            """
            4
            3
            2
            1
            """
            )
            
            XCTAssertEqual(popResult.data, 5)
            XCTAssertEqual(self.stack.count, 4)
            XCTAssertFalse(self.stack.isEmpty)
        }
    }
    
    func test_빈스택에_pop() {
        
        var popResult: Node<Int>!
        
        given {
            self.stack = Stack<Int>()
        }
        
        when {
            popResult = self.stack.pop()
        }
        
        then {
            XCTAssertEqual(self.stack.description,
            """
            """
            )
            
            XCTAssertNil(popResult)
            XCTAssertEqual(self.stack.count, 0)
            XCTAssert(self.stack.isEmpty)
        }
    }
    
    func test_여러개_pop() {
        
        var popResult = [Node<Int>]()
        
        given {
            self.stack = Stack<Int>()
        }
        
        when {
            self.stack.push(data: 1)
            self.stack.push(data: 2)
            self.stack.push(data: 3)
            self.stack.push(data: 4)
            self.stack.push(data: 5)
            popResult.append(self.stack.pop()!)
            popResult.append(self.stack.pop()!)
            popResult.append(self.stack.pop()!)
        }
        
        then {
            XCTAssertEqual(self.stack.description,
            """
            2
            1
            """
            )
            
            XCTAssertEqual([5,4,3], popResult.map { $0.data} )
            XCTAssertEqual(self.stack.count, 2)
            XCTAssertFalse(self.stack.isEmpty)
        }
    }
    
    func test_전부다_pop() {
        
        var popResult = [Node<Int>]()
        
        given {
            self.stack = Stack<Int>()
        }
        
        when {
            self.stack.push(data: 1)
            self.stack.push(data: 2)
            self.stack.push(data: 3)
            self.stack.push(data: 4)
            self.stack.push(data: 5)
            popResult.append(self.stack.pop()!)
            popResult.append(self.stack.pop()!)
            popResult.append(self.stack.pop()!)
            popResult.append(self.stack.pop()!)
            popResult.append(self.stack.pop()!)
        }
        
        then {
            XCTAssertEqual(self.stack.description,
            """
            """
            )
            
            XCTAssertEqual([5,4,3,2,1], popResult.map { $0.data} )
            XCTAssertEqual(self.stack.count, 0)
            XCTAssert(self.stack.isEmpty)
        }
    }
}

