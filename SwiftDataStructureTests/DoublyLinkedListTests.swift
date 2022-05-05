//
//  DoublyLinkedListTests.swift
//  SwiftDataStructureTests
//
//  Created by Milkyo on 2022/05/05.
//

import Foundation
import XCTest

class DoublyLinkedListTests: BaseTestCase {

    var doublyLinkedList: DoublyLinkedList<String>!
    
    func test_DoublyLinkedList_create() {
        given {
            self.doublyLinkedList = DoublyLinkedList<String>()
        }
        
        when {
            self.doublyLinkedList.create(data: "A")
            self.doublyLinkedList.create(data: "B")
            self.doublyLinkedList.create(data: "C")
            self.doublyLinkedList.create(data: "D")
        }
        
        then {
            XCTAssertEqual(self.doublyLinkedList.description, "A -> B -> C -> D")
            XCTAssertEqual(self.doublyLinkedList.descriptionFromTail, "D -> C -> B -> A")
        }
    }
    
    func test_DoublyLinkedList_insert() {
        given {
            self.doublyLinkedList = DoublyLinkedList<String>()
        }

        when {
            self.doublyLinkedList.create(data: "A")
            self.doublyLinkedList.create(data: "B")
            self.doublyLinkedList.create(data: "C")
            self.doublyLinkedList.create(data: "D")
            self.doublyLinkedList.insert(data: "E", at: 4)
        }

        then {
            XCTAssertEqual(self.doublyLinkedList.description, "A -> B -> C -> D -> E")
            XCTAssertEqual(self.doublyLinkedList.descriptionFromTail, "E -> D -> C -> B -> A")
        }
    }
    
    func test_DoublyLinkedList_0번째_insert() {
        given {
            self.doublyLinkedList = DoublyLinkedList<String>()
        }

        when {
            self.doublyLinkedList.create(data: "B")
            self.doublyLinkedList.create(data: "C")
            self.doublyLinkedList.create(data: "D")
            self.doublyLinkedList.insert(data: "A", at: 0)
        }

        then {
            XCTAssertEqual(self.doublyLinkedList.description, "A -> B -> C -> D")
            XCTAssertEqual(self.doublyLinkedList.descriptionFromTail, "D -> C -> B -> A")
        }
    }
    
    func test_DoublyLinkedList_중간에_insert() {
        given {
            self.doublyLinkedList = DoublyLinkedList<String>()
        }

        when {
            self.doublyLinkedList.create(data: "A")
            self.doublyLinkedList.create(data: "B")
            self.doublyLinkedList.create(data: "C")
            self.doublyLinkedList.create(data: "D")
            self.doublyLinkedList.insert(data: "E", at: 3)
        }

        then {
            XCTAssertEqual(self.doublyLinkedList.description, "A -> B -> C -> E -> D")
            XCTAssertEqual(self.doublyLinkedList.descriptionFromTail, "D -> E -> C -> B -> A")
        }
    }
    
    func test_DoublyLinkedList_범위를_벗어난_insert() {
        given {
            self.doublyLinkedList = DoublyLinkedList<String>()
        }

        when {
            self.doublyLinkedList.create(data: "A")
            self.doublyLinkedList.create(data: "B")
            self.doublyLinkedList.create(data: "C")
            self.doublyLinkedList.create(data: "D")
            self.doublyLinkedList.insert(data: "E", at: 5)
        }

        then {
            XCTAssertEqual(self.doublyLinkedList.description, "A -> B -> C -> D")
            XCTAssertEqual(self.doublyLinkedList.descriptionFromTail, "D -> C -> B -> A")
        }
    }
    
    func test_DoublyLinkedList_아무것도_없는데_insert() {
        given {
            self.doublyLinkedList = DoublyLinkedList<String>()
        }

        when {
            self.doublyLinkedList.insert(data: "A", at: 0)
        }

        then {
            XCTAssertEqual(self.doublyLinkedList.description, "A")
            XCTAssertEqual(self.doublyLinkedList.descriptionFromTail, "A")
        }
    }
//
    func test_DoublyLinkedList_아무것도_없는데_범위도_벗어난_insert() {
        given {
            self.doublyLinkedList = DoublyLinkedList<String>()
        }

        when {
            self.doublyLinkedList.insert(data: "A", at: 40)
        }

        then {
            XCTAssertNil(self.doublyLinkedList.searchNodeFromHead(data: "A"))
        }
    }

    
    func test_DoublyLinkedList_searchNodeFromHead() {
        
        var node: DoublelyNode<String>!
        
        given {
            self.doublyLinkedList = DoublyLinkedList<String>()
        }
        
        when {
            self.doublyLinkedList.create(data: "A")
            self.doublyLinkedList.create(data: "B")
            self.doublyLinkedList.create(data: "C")
            self.doublyLinkedList.create(data: "D")
            
            let search = self.doublyLinkedList.searchNodeFromHead(data: "A")
            node = search
        }
        
        then {
            XCTAssertNil(node.prev)
            XCTAssertEqual(node.data, "A")
            XCTAssertEqual(node.next?.data, "B")
        }
    }
    
    func test_DoublyLinkedList_searchNodeFromTail() {
        
        var node: DoublelyNode<String>!
        
        given {
            self.doublyLinkedList = DoublyLinkedList<String>()
        }
        
        when {
            self.doublyLinkedList.create(data: "A")
            self.doublyLinkedList.create(data: "B")
            self.doublyLinkedList.create(data: "C")
            self.doublyLinkedList.create(data: "D")
            
            let search = self.doublyLinkedList.searchNodeFromTail(data: "C")
            node = search
        }
        
        then {
            XCTAssertEqual(node.prev?.data, "B")
            XCTAssertEqual(node.data, "C")
            XCTAssertEqual(node.next?.data, "D")
        }
    }
    
    func test_DoublyLinkedList_아무것도_없는데_searchNodeFromHead() {
        
        var node: DoublelyNode<String>!
        
        given {
            self.doublyLinkedList = DoublyLinkedList<String>()
        }
        
        when {
            let search = self.doublyLinkedList.searchNodeFromHead(data: "A")
            node = search
        }
        
        then {
            XCTAssertNil(node)
        }
    }
    
    func test_DoublyLinkedList_아무것도_없는데_searchNodeFromTail() {
        
        var node: DoublelyNode<String>!
        
        given {
            self.doublyLinkedList = DoublyLinkedList<String>()
        }
        
        when {
            let search = self.doublyLinkedList.searchNodeFromHead(data: "A")
            node = search
        }
        
        then {
            XCTAssertNil(node)
        }
    }
    
    func test_DoublyLinkedList_removeLast() {
        given {
            self.doublyLinkedList = DoublyLinkedList<String>()
        }
        
        when {
            self.doublyLinkedList.create(data: "A")
            self.doublyLinkedList.create(data: "B")
            self.doublyLinkedList.create(data: "C")
            self.doublyLinkedList.create(data: "D")
            self.doublyLinkedList.removeLast()
        }
        
        then {
            XCTAssertEqual(self.doublyLinkedList.description, "A -> B -> C")
            XCTAssertEqual(self.doublyLinkedList.descriptionFromTail, "C -> B -> A")
        }
    }
    
    func test_DoublyLinkedList_removeAt() {
        given {
            self.doublyLinkedList = DoublyLinkedList<String>()
        }
        
        when {
            self.doublyLinkedList.create(data: "A") // 0
            self.doublyLinkedList.create(data: "B") // 1
            self.doublyLinkedList.create(data: "C") // 2
            self.doublyLinkedList.create(data: "D") // 3
            self.doublyLinkedList.remove(at: 2)
        }
        
        then {
            XCTAssertEqual(self.doublyLinkedList.description, "A -> B -> D")
            XCTAssertEqual(self.doublyLinkedList.descriptionFromTail, "D -> B -> A")
        }
    }
    
    func test_DoublyLinkedList_removeAt_마지막() {
        given {
            self.doublyLinkedList = DoublyLinkedList<String>()
        }
        
        when {
            self.doublyLinkedList.create(data: "A") // 0
            self.doublyLinkedList.create(data: "B") // 1
            self.doublyLinkedList.create(data: "C") // 2
            self.doublyLinkedList.create(data: "D") // 3
            self.doublyLinkedList.remove(at: 3)
        }
        
        then {
            XCTAssertEqual(self.doublyLinkedList.description, "A -> B -> C")
            XCTAssertEqual(self.doublyLinkedList.descriptionFromTail, "C -> B -> A")
        }
    }
    
    func test_DoublyLinkedList_범위를_벗어난_removeAt() {
        given {
            self.doublyLinkedList = DoublyLinkedList<String>()
        }
        
        when {
            self.doublyLinkedList.create(data: "A")
            self.doublyLinkedList.create(data: "B")
            self.doublyLinkedList.create(data: "C")
            self.doublyLinkedList.create(data: "D")
            self.doublyLinkedList.remove(at: 200)
        }
        
        then {
            XCTAssertEqual(self.doublyLinkedList.description, "A -> B -> C -> D")
            XCTAssertEqual(self.doublyLinkedList.descriptionFromTail, "D -> C -> B -> A")
        }
    }


}

