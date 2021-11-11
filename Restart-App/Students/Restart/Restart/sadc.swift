//
//  sadc.swift
//  Restart
//
//  Created by 이윤식 on 2021/11/11.
//

import Foundation


public struct Stack<T> {
    private var elements = [T]()

    public init() {}
    
    public mutating func pop() -> T? {
        return self.elements.popLast()
    }
    
    public mutating func push(_ element: T) {
        self.elements.append(element)
    }
    
    public func peak() -> T? {
        return self.elements.last
    }
    
    public var isEmpty: Bool {
        return self.elements.isEmpty
    }
    
    public var count: Int {
        return self.elements.count
    }
}

var myStack = Stack<Int>()
myStack.push(1) // [1]
myStack.push(2) // [1, 2]
myStack.push(3) // [1, 2, 3]

var x = myStack.pop() // x = 1
x = myStack.pop() // x = 2
x = myStack.pop() // x = 3
x = myStack.pop() // nil
myStack.isEmpty // true
