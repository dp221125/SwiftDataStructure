//
//  SingleLinkedListTests.swift
//  SwiftDataStructureTests
//
//  Created by Milkyo on 2022/05/01.
//

import XCTest

class SingleLinkedListTests: BaseTestCase {

    var singleLinkedList: SingleLinkedList<String>!
    
    func test_SingleLinkedList_create() {
        given {
            self.singleLinkedList = SingleLinkedList<String>()
        }
        
        when {
            self.singleLinkedList.create(data: "A")
            self.singleLinkedList.create(data: "B")
            self.singleLinkedList.create(data: "C")
            self.singleLinkedList.create(data: "D")
        }
        
        then {
            XCTAssertEqual(self.singleLinkedList.description, "A -> B -> C -> D")
        }
    }
    
    func test_SingleLinkedList_insert() {
        given {
            self.singleLinkedList = SingleLinkedList<String>()
        }
        
        when {
            self.singleLinkedList.create(data: "A")
            self.singleLinkedList.create(data: "B")
            self.singleLinkedList.create(data: "C")
            self.singleLinkedList.create(data: "D")
            self.singleLinkedList.insert(data: "E", at: 4)
        }
        
        then {
            XCTAssertEqual(self.singleLinkedList.description, "A -> B -> C -> D -> E")
        }
    }
    
    func test_SingleLinkedList_중간에_insert() {
        given {
            self.singleLinkedList = SingleLinkedList<String>()
        }
        
        when {
            self.singleLinkedList.create(data: "A")
            self.singleLinkedList.create(data: "B")
            self.singleLinkedList.create(data: "C")
            self.singleLinkedList.create(data: "D")
            self.singleLinkedList.insert(data: "E", at: 3)
        }
        
        then {
            XCTAssertEqual(self.singleLinkedList.description, "A -> B -> C -> E -> D")
        }
    }
    
    func test_SingleLinkedList_범위를_벗어난_insert() {
        given {
            self.singleLinkedList = SingleLinkedList<String>()
        }
        
        when {
            self.singleLinkedList.create(data: "A")
            self.singleLinkedList.create(data: "B")
            self.singleLinkedList.create(data: "C")
            self.singleLinkedList.create(data: "D")
            self.singleLinkedList.insert(data: "E", at: 5)
        }
        
        then {
            XCTAssertEqual(self.singleLinkedList.description, "A -> B -> C -> D")
        }
    }
    
    func test_SingleLinkedList_아무것도_없는데_insert() {
        given {
            self.singleLinkedList = SingleLinkedList<String>()
        }
        
        when {
            self.singleLinkedList.insert(data: "A", at: 0)
        }
        
        then {
            XCTAssertEqual(self.singleLinkedList.description, "A")
        }
    }
    
    func test_SingleLinkedList_아무것도_없는데_범위도_벗어난_insert() {
        given {
            self.singleLinkedList = SingleLinkedList<String>()
        }
        
        when {
            self.singleLinkedList.insert(data: "A", at: 40)
        }
        
        then {
            XCTAssertNil(self.singleLinkedList.search(data: "A"))
        }
    }
    
    
    func test_SingleLinkedList_search() {
        
        var node: Node<String>!
        
        given {
            self.singleLinkedList = SingleLinkedList<String>()
        }
        
        when {
            self.singleLinkedList.create(data: "A")
            self.singleLinkedList.create(data: "B")
            self.singleLinkedList.create(data: "C")
            self.singleLinkedList.create(data: "D")
            
            let search = self.singleLinkedList.search(data: "A")
            node = search
        }
        
        then {
            XCTAssertEqual(node.data, "A")
            XCTAssertEqual(node.next?.data, "B")
        }
    }
    
    func test_SingleLinkedList_아무것도_없는데_search() {
        
        var node: Node<String>!
        
        given {
            self.singleLinkedList = SingleLinkedList<String>()
        }
        
        when {
            let search = self.singleLinkedList.search(data: "A")
            node = search
        }
        
        then {
            XCTAssertNil(node)
        }
    }
    
    func test_SingleLinkedList_removeLast() {
        given {
            self.singleLinkedList = SingleLinkedList<String>()
        }
        
        when {
            self.singleLinkedList.create(data: "A")
            self.singleLinkedList.create(data: "B")
            self.singleLinkedList.create(data: "C")
            self.singleLinkedList.create(data: "D")
            self.singleLinkedList.removeLast()
        }
        
        then {
            XCTAssertEqual(self.singleLinkedList.description, "A -> B -> C")
        }
    }
    
    func test_SingleLinkedList_removeAt() {
        given {
            self.singleLinkedList = SingleLinkedList<String>()
        }
        
        when {
            self.singleLinkedList.create(data: "A") // 0
            self.singleLinkedList.create(data: "B") // 1
            self.singleLinkedList.create(data: "C") // 2
            self.singleLinkedList.create(data: "D") // 3
            self.singleLinkedList.remove(at: 2)
        }
        
        then {
            XCTAssertEqual(self.singleLinkedList.description, "A -> B -> D")
        }
    }
    
    func test_SingleLinkedList_범위를_벗어난_removeAt() {
        given {
            self.singleLinkedList = SingleLinkedList<String>()
        }
        
        when {
            self.singleLinkedList.create(data: "A")
            self.singleLinkedList.create(data: "B")
            self.singleLinkedList.create(data: "C")
            self.singleLinkedList.create(data: "D")
            self.singleLinkedList.remove(at: 200)
        }
        
        then {
            XCTAssertEqual(self.singleLinkedList.description, "A -> B -> C -> D")
        }
    }


}

