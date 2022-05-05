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

class DoublelyNode<T> {
    var data: T
    var prev: DoublelyNode?
    var next: DoublelyNode?
    
    init(data: T, prev: DoublelyNode? = nil, next: DoublelyNode? = nil) {
        self.data = data
        self.prev = prev
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
        
        if index == 0 {
            let newNode = Node(data: data)
            newNode.next = self.head
            self.head = newNode
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
    private(set) var count = 0
    
    func push(data: T) {

        if let head = head {
            let newNode = Node(data: data)
            newNode.next = head
            self.head = newNode
        } else {
            self.head = Node(data: data)
        }
        
        count += 1
    }
    
    @discardableResult
    func pop() -> Node<T>? {
        
        if let head = head {
            let oldHead = head
            self.head = head.next
            oldHead.next = nil
            count -= 1
            return head
        }

        return nil
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
                    result = "\(oldResult)\n\(String(describing: nodeData))"
                } else {
                    result += "\(String(describing: nodeData))"
                }
                
                node = node?.next
            }
        }
        
        
        if let nodeData = node?.data {
            let oldResult = result
            result = "\(oldResult)\n\(nodeData)"
        }
        
        
        return result
    }
}

/*
 MARK: Queue
 */
class Queue<T: Equatable> {
    
    private var head: Node<T>?
    private var tail: Node<T>?
    var count: Int = 0
    
    func enqueue(data: T) {
        
        let newNode = Node(data: data)
        
        if let tail = tail {
            tail.next = newNode
            self.tail = newNode
        } else {
            self.head = newNode
            self.tail = newNode
        }
        
        self.count += 1
    }
    
    @discardableResult
    func dequeue() -> Node<T>? {
        
        if let head = head {
            let oldHead = head
            self.head = oldHead.next
            oldHead.next = nil
            self.count -= 1
            return head
        }
        
        return nil
    }
    
}
extension Queue: CustomStringConvertible {
    public var description: String {
        var result: String = ""
        
        var node = head
        
        while node?.next != nil {
            if let nodeData = node?.data {
                if result.isEmpty == false {
                    result += "\(String(describing: nodeData)) - "
                } else {
                    result += "\(String(describing: nodeData)) - "
                }
                
                node = node?.next
            }
        }
        
        
        if let nodeData = node?.data {
            result += "\(nodeData)"
        }
        
        
        return result
    }
}

/*
 MARK: DoublyLinkedList
 */

class DoublyLinkedList<T: Equatable> {
    private var head: DoublelyNode<T>?
    private var tail: DoublelyNode<T>?
    
    func create(data: T) {
        let newNode = DoublelyNode(data: data)
        
        if let tail = tail {
            tail.next = newNode
            newNode.prev = tail
            self.tail = newNode
        } else {
            self.head = newNode
            self.tail = self.head
        }
    }
    
    func removeLast() {
        
        guard head != nil || tail != nil else {
            return
        }
        
        if head?.next == nil {
            head = nil
            tail = nil
            return
        }
        
        tail?.prev?.next = tail?.next
        let tailNode = tail
        tail = tailNode?.prev
        tailNode?.prev = nil
    }
    
    func remove(at index: Int) {
        
        guard head != nil || tail != nil else {
            return
        }
        
        if index == 0 {
            head?.next?.prev = nil
            let head = self.head
            self.head = head?.next
            head?.next = nil
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
            node?.next?.prev = nil
            node?.next = node?.next?.next
            node?.next?.prev = node
            
            if node?.next == nil {
                self.tail = node
            }
        }
    }
    
    func searchNodeFromHead(data: T) -> DoublelyNode<T>? {
        
        guard head != nil || tail != nil else {
            return nil
        }
        
        var node = head
        
        while node?.next != nil {
            if node?.data == data { break }
            node = node?.next
        }
        
        return node?.data == data ? node : nil
    }
    
    func searchNodeFromTail(data: T) -> DoublelyNode<T>? {
        
        guard head != nil || tail != nil else {
            return nil
        }
        
        var node = tail
        
        while node?.prev != nil {
            if node?.data == data { break }
            node = node?.prev
        }
        
        return node?.data == data ? node : nil
    }
    
    func insert(data: T, at index: Int) {
        
        if index == 0 {
            let newNode = DoublelyNode(data: data)
            let head = self.head
            newNode.next = head
            head?.prev = newNode
            self.head = newNode
            
            if tail == nil {
                self.tail = self.head
            }
    
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
            let newNode = DoublelyNode(data: data)
            defer { node?.next = newNode }
            newNode.prev = node
            newNode.next = node?.next
            node?.next?.prev = newNode
            
            if newNode.next == nil {
                tail = newNode
            }
        }

    }
}
extension DoublyLinkedList: CustomStringConvertible {
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
    
    public var descriptionFromTail: String {
        var result: String = ""
        
        var node = tail
        
        while node?.prev != nil {
            if let nodeData = node?.data {
                result += "\(String(describing: nodeData)) -> "
                node = node?.prev
            }
        }
        
        result += "\(node!.data)"
        
        return result
    }
}
