//
//  main.swift
//  SwiftDataStructure
//
//  Created by Milkyo on 2022/05/01.
//

class Node<T> {
    var data: T
    var next: Node?
    
    init(data: T, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}
/*
 MARK: SingleLinkedList
 */
/*
 Value types are fixed structures and they occupy a fixed space in memory, in registers and the stack, depending on its size.
 That space is pre-determined by the type and must be known at compile time.
 */
class SingleLinkedList<T: Equatable> {
    private var head: Node<T>?
    
    //생성
    func create(data: T) {
        
        if head == nil {
            self.head = Node(data: data)
            return
        }
        
        var node = head
        
        while node?.next != nil {
            node = node?.next
        }
        node?.next = Node(data: data)
    }
    
    //탐색
    func search(data: T) -> Node<T>? {
        
        if head == nil { return nil }
        
        var node = head
        
        while node?.next != nil {
            guard node?.data != data else {
                break
            }
            node = node?.next
        }
        
        return node?.data == data ? node : nil
    }
    
    //삽입
    func insert(data: T, at index: Int) {
        
        if head == nil && index == 0 {
            self.head = Node(data: data)
            return
        } else if head == nil && index > 0 {
            return
        }
        
        var node = head
        var currentIndex = 0
        
        for i in 0 ..< index {
            currentIndex = i
            
            guard node?.next != nil else {
                break
            }
            
            if currentIndex != index - 1 {
                node = node?.next
            }
            
          
            
        }
        
        if currentIndex == index - 1 {
            let nextNode = node?.next
            node?.next = Node(data: data)
            node?.next?.next = nextNode
        }

    }
    
    //삭제
    func removeLast() {
        
        guard head != nil else {
            return
        }
        
        
        if head?.next == nil {
            head = nil
            return
        }
        
        var node = head
        while node?.next?.next != nil {
            node = node?.next
        }
        
        node?.next = node?.next?.next
        
    }
    
    func remove(at index: Int) {
        guard head != nil else {
            return
        }
        
        if index == 0 {
            head = head?.next
            return
        }
        
        var node = head
        var currentIndex = 0
        
        for i in 0 ..< index {
            currentIndex = i
           
            guard node?.next?.next != nil else {
                break
            }
            
            if currentIndex != index - 1 {
                node = node?.next
            }
            
           

        }
        
        if currentIndex == index - 1 {
            node?.next = node?.next?.next
        }
        
    }

}
extension SingleLinkedList: CustomStringConvertible {
    public var description: String {
        var result: String = ""
        
        var node = head
        
        while node?.next != nil {
            if let nodeData = node?.data {
                result += "\(String(describing: nodeData)) -> "
                node = node?.next
            }
        }
        
        result += "\(node!.data)"
        
        return result
    }
}

/*
 MARK: Stack
 */
class Stack<T: Equatable> {
    private var head: Node<T>?
    
    func push(data: T) {
        if head == nil {
            self.head = Node(data: data)
            return
        }
        
        var node = head
        
        while node?.next != nil {
            node = node?.next
        }
        node?.next = Node(data: data)
    }
    
    @discardableResult
    func pop() -> Node<T>? {
        guard head != nil else {
            return nil
        }
        
        
        if head?.next == nil {
            defer { head = nil }
            return head
        }
        
        var node = head
        while node?.next?.next != nil {
            node = node?.next
        }
        
        defer { node?.next = node?.next?.next }
        return  node?.next
    }
    
    func count() -> Int {
        guard head != nil else {
            return 0
        }
        
        var count = 0
        
        var node = head
        
        while node?.next != nil {
            count += 1
            node = node?.next
        }
        
        count += 1
        
        return count
    }
    
    var isEmpty: Bool {
        return self.head == nil
    }
}
extension Stack: CustomStringConvertible {
    public var description: String {
        var result: String = ""
        
        var node = head
        
        while node?.next != nil {
            if let nodeData = node?.data {
                if result.isEmpty == false {
                    let oldResult = result
                    result = "\(String(describing: nodeData))\n\(oldResult)"
                } else {
                    result += "\(String(describing: nodeData))"
                }
                
                node = node?.next
            }
        }
        
        
        if let nodeData = node?.data {
            let oldResult = result
            result = "\(nodeData)\n\(oldResult)"
        }
        
        
        return result
    }
}
