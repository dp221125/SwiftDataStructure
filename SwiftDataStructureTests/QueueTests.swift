//
//  QueueTests.swift
//  SwiftDataStructureTests
//
//  Created by Milkyo on 2022/05/02.
//

import Foundation
import XCTest

class QueueTests: BaseTestCase {
    
    var queue: Queue<Int>!
    
    func test_enqueue() {
        given {
            self.queue = Queue<Int>()
        }
        
        when {
            self.queue.enqueue(data: 1)
            self.queue.enqueue(data: 2)
            self.queue.enqueue(data: 3)
            self.queue.enqueue(data: 4)
            self.queue.enqueue(data: 5)
        }
        
        then {
            XCTAssertEqual(self.queue.description, "1 - 2 - 3 - 4 - 5")
            XCTAssertEqual(self.queue.count, 5)
        }
    }
    
    func test_dequeue() {
        
        var popResult: Node<Int>!
        
        given {
            self.queue = Queue<Int>()
        }
        
        when {
            self.queue.enqueue(data: 1)
            self.queue.enqueue(data: 2)
            self.queue.enqueue(data: 3)
            self.queue.enqueue(data: 4)
            self.queue.enqueue(data: 5)
            popResult = self.queue.dequeue()
        }
        
        then {
            XCTAssertEqual(self.queue.description, "2 - 3 - 4 - 5")
            XCTAssertEqual(self.queue.count, 4)
            XCTAssertEqual(popResult.data, 1)
        }
    }
    
    func test_빈큐에_deueue() {
        
        var popResult: Node<Int>!
        
        given {
            self.queue = Queue<Int>()
        }
        
        when {
            self.queue.dequeue()
            popResult = self.queue.dequeue()
        }
        
        then {
            XCTAssertEqual(self.queue.description, "")
            XCTAssertEqual(self.queue.count, 0)
            XCTAssertNil(popResult)
        }
    }
    
    func test_여러개_deueue() {
        
        var popResult = [Node<Int>]()

        given {
            self.queue = Queue<Int>()
        }
        
        when {
            self.queue.enqueue(data: 1)
            self.queue.enqueue(data: 2)
            self.queue.enqueue(data: 3)
            self.queue.enqueue(data: 4)
            self.queue.enqueue(data: 5)
            popResult.append(self.queue.dequeue()!)
            popResult.append(self.queue.dequeue()!)
            popResult.append(self.queue.dequeue()!)
        }
        
        then {
            XCTAssertEqual(self.queue.description, "4 - 5")
            XCTAssertEqual(self.queue.count, 2)
            XCTAssertEqual([1,2,3], popResult.map { $0.data} )
        }
    }
    
    func test_전부다_pop() {
        
        var popResult = [Node<Int>]()
        
        given {
            self.queue = Queue<Int>()
        }
        
        when {
            self.queue.enqueue(data: 1)
            self.queue.enqueue(data: 2)
            self.queue.enqueue(data: 3)
            self.queue.enqueue(data: 4)
            self.queue.enqueue(data: 5)
            popResult.append(self.queue.dequeue()!)
            popResult.append(self.queue.dequeue()!)
            popResult.append(self.queue.dequeue()!)
            popResult.append(self.queue.dequeue()!)
            popResult.append(self.queue.dequeue()!)
        }
        
        then {
            XCTAssertEqual(self.queue.description, "")
            XCTAssertEqual([1,2,3,4,5], popResult.map { $0.data} )
            XCTAssertEqual(self.queue.count, 0)
        }
    }
}
