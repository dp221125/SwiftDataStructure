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
            
            if self.head == nil {
                self.tail = self.head
            }
            
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

/*
 MARK: BinaryNode
 */

enum Direction {
    case left
    case right
}

enum TreeError: Error {
    case notVaildDirection(direction: Direction)
    case insertError
    case removeError
}

enum TreeOrderType {
    case preorder
    case inorder
    case postorder
}

class BaseTreeNode<T: Equatable>: Equatable {
    static func == (lhs: BaseTreeNode<T>, rhs: BaseTreeNode<T>) -> Bool {
        return lhs.value == rhs.value && lhs.leftChild == rhs.leftChild && lhs.rightChild == rhs.rightChild
    }
    
  public var value: T?
  public var leftChild: BaseTreeNode?
  public var rightChild: BaseTreeNode?
  
  public init(value: T?, left: BaseTreeNode? = nil, right: BaseTreeNode? = nil) {
    self.value = value
    self.leftChild = left
    self.rightChild = right
  }
}

class BinaryNode<T: Equatable>: Equatable {
    static func == (lhs: BinaryNode<T>, rhs: BinaryNode<T>) -> Bool {
        return lhs.value == rhs.value && lhs.leftChild?.value == rhs.leftChild?.value && lhs.rightChild?.value == rhs.rightChild?.value
    }
    
    var value: T
    private var leftChild: BinaryNode?
    private var rightChild: BinaryNode?
    
    init(value: T) {
        self.value = value
    }
    
    @discardableResult
    func insertChild(parentNode: BinaryNode<T>, value: T, direction: Direction) throws -> BinaryNode<T> {
        let newNode = BinaryNode(value: value)
        
        switch direction {
        case .left:
            if parentNode.leftChild == nil {
                parentNode.leftChild = newNode
                return newNode
            } else {
                throw TreeError.notVaildDirection(direction: .left)
            }
        case .right:
            if parentNode.rightChild == nil {
                parentNode.rightChild = newNode
                return newNode
            } else {
                throw TreeError.notVaildDirection(direction: .right)
            }
        }
        
    }
    
    @discardableResult
    func removeChid(parentNode: BinaryNode<T>, direction: Direction) throws -> T? {
        switch direction {
        case .left:
            if let leftChild = leftChild {
                let delete = leftChild.value
                parentNode.leftChild = nil
                return delete
            } else {
                throw TreeError.notVaildDirection(direction: .left)
            }
        case .right:
            if let rightChild = rightChild {
                let delete = rightChild.value
                parentNode.rightChild = nil
                return delete
            } else {
                throw TreeError.notVaildDirection(direction: .left)
            }
        }
        
    }
    
}
extension BinaryNode {
    private func preorder(action: (T) -> Void) {
        action(value)
        leftChild?.preorder(action: action)
        rightChild?.preorder(action: action)
    }
    
    private func inorder(action: (T) -> Void) {
        leftChild?.inorder(action: action)
        action(value)
        rightChild?.inorder(action: action)
    }
    
    private func postorder(action: (T) -> Void) {
        leftChild?.postorder(action: action)
        rightChild?.postorder(action: action)
        action(value)
    }
    
    func orderRunner(orderType: TreeOrderType) -> [T] {
        var result = [T]()

        switch orderType {
        case .preorder:
            self.preorder { value in result.append(value) }
        case .inorder:
            self.inorder { value in result.append(value) }
        case .postorder:
            self.postorder { value in result.append(value) }
        }
        
        return result
    }
    
    func levelOrder() -> [[T]] {
        let queue = Queue<BinaryNode>()
        var output = [[T]]()
        queue.enqueue(data: self)
        
        while queue.count != 0 {
            
            var remainLevel = queue.count //동일레벨에서 남은 큐 갯수
            var levelData = [T]()
            
            while remainLevel > 0 {
                guard let node = queue.dequeue() else {
                    return []
                }
                
                if let left = node.data.leftChild {
                    queue.enqueue(data: left)
                }
                
                if let right = node.data.rightChild {
                    queue.enqueue(data: right)
                }
                
                levelData.append(node.data.value)
                remainLevel -= 1
            }
            output.append(levelData)
        }
        return output
    }
}

class BinarySearchTree: Equatable {
    static func == (lhs: BinarySearchTree, rhs: BinarySearchTree) -> Bool {
        return lhs.root == rhs.root
    }
    
    var root: BaseTreeNode<Int>
    
    init(value: Int) {
        self.root = BaseTreeNode(value: value)
    }

    func insertValue(_ value: Int, parentNode: BaseTreeNode<Int>) throws {
        
        guard let parentValue = parentNode.value,
              parentValue != value else {
            return
        }
        
        if parentValue > value {
            guard let leftChild = parentNode.leftChild else {
                parentNode.leftChild = BaseTreeNode(value: value)
                return
            }

            try self.insertValue(value, parentNode: leftChild)
        } else if value > parentValue {
            guard let rightChild = parentNode.rightChild else {
                parentNode.rightChild = BaseTreeNode(value: value)
                return
            }

            try self.insertValue(value, parentNode: rightChild)
        } else {
            throw TreeError.insertError
        }
            
    }
    
    func removeValue(_ value: Int, parentNode: BaseTreeNode<Int>) throws {
        
        guard let rootValue = root.value,
              rootValue != value else {
            self.root = BaseTreeNode(value: nil)
            return
        }
              
        guard let parentValue = parentNode.value else { throw TreeError.removeError }
        
        if parentValue > value {
            guard let leftChild = parentNode.leftChild,
                  let leftChildValue = leftChild.value else { throw TreeError.removeError }
            
            if leftChildValue == value {
                parentNode.leftChild = nil
                return
            }
            
            try self.removeValue(value, parentNode: leftChild)
            
        } else if value > parentValue {
            guard let rightChild = parentNode.rightChild,
                  let rightChildValue = rightChild.value else { throw TreeError.removeError }
            
            if rightChildValue == value {
                parentNode.rightChild = nil
                return
            }
            
            try self.removeValue(value, parentNode: rightChild)
        }
    }
}
extension BinarySearchTree {
    private func preorder(node: BaseTreeNode<Int>?, action: (Int) -> Void) {
        guard let node = node,
              let nodeValue = node.value else { return }
                
        action(nodeValue)
        
        if node.leftChild != nil {
            preorder(node: node.leftChild, action: action)
        }
        
        if node.rightChild != nil {
            preorder(node: node.rightChild, action: action)
        }

    }
    
    private func inorder(node: BaseTreeNode<Int>?, action: (Int) -> Void) {
        guard let node = node,
              let nodeValue = node.value else { return }

        if node.leftChild != nil {
            preorder(node: node.leftChild, action: action)
        }
        
        action(nodeValue)
        
        if node.rightChild != nil {
            preorder(node: node.rightChild, action: action)
        }
    }
    
    private func postorder(node: BaseTreeNode<Int>?, action: (Int) -> Void) {
        guard let node = node,
              let nodeValue = node.value else { return }

        if node.leftChild != nil {
            preorder(node: node.leftChild, action: action)
        }
        
        if node.rightChild != nil {
            preorder(node: node.rightChild, action: action)
        }
        
        action(nodeValue)
    }
    
    func orderRunner(orderType: TreeOrderType) -> [Int] {
        var result = [Int]()

        switch orderType {
        case .preorder:
            self.preorder(node: self.root) { value in result.append(value) }
        case .inorder:
            self.inorder(node: self.root) { value in result.append(value) }
        case .postorder:
            self.postorder(node: self.root) { value in result.append(value) }
        }
        
        return result
    }
    
    func levelOrder() -> [[Int]] {
        let queue = Queue<BaseTreeNode<Int>>()
        var output = [[Int]]()
        queue.enqueue(data: self.root)
        
        while queue.count != 0 {
            
            var remainLevel = queue.count //동일레벨에서 남은 큐 갯수
            var levelData = [Int]()
            
            while remainLevel > 0 {
                guard let node = queue.dequeue() else {
                    return []
                }
                
                if let left = node.data.leftChild {
                    queue.enqueue(data: left)
                }
                
                if let right = node.data.rightChild {
                    queue.enqueue(data: right)
                }
                
                levelData.append(node.data.value!)
                remainLevel -= 1
            }
            output.append(levelData)
        }
        return output
    }
}
