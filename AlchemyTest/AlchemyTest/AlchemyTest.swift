//
//  AlchemyTest.swift
//  AlchemyTest
//
//  Created by Wellington Moreno on 11/5/17.
//  Copyright © 2017 Wellington Moreno. All rights reserved.
//

import Foundation
import XCTest

class AlchemyTest
{
    
}

public func failTest(message: String = "Assertion failed", _ functionName: String = #function)
{
    XCTFail(functionName + " | " + message)
}

public func assertThat(_ expression: Bool)
{
    if !expression
    {
        failTest()
    }
}

public func assertFalse(_ expression: Bool)
{
    if expression
    {
        failTest()
    }
}

public func assertTrue(_ expression: Bool)
{
    if !expression
    {
        failTest()
    }
}

public func assertNotNil(variable: Any?)
{
    if variable == nil
    {
        failTest(message: "Expected non-nil value")
    }
}

public func assertNil(variable: Any?)
{
    if let variable = variable
    {
        failTest(message: "Expected nil value, but [\(variable)]")
    }
}

public func assertEquals<T: Equatable>(_ first: T?, _ second: T?)
{
    if first == nil && second == nil
    {
        return
    }
    
    guard let _first = first, let _second = second else
    {
        failTest(message: "Not equal: [\(first)] & [\(second)]")
        return
    }
    
    if _first != _second
    {
        failTest(message: "Not equal: [\(_first)] & [\(_second)]")
    }
}

public func assertEquals<T: Equatable>(_ first: [T], _ second: [T])
{
    if first.isEmpty && second.isEmpty
    {
        return
    }
    
    guard first.count == second.count else
    {
        failTest(message: "Arrays have different lengths")
        return
    }
    
    for (index, firstValue) in first.enumerated()
    {
        let secondValue = second[index]
        
        guard secondValue == firstValue else
        {
            failTest(message: "Arrays are different [@\(index)] | \(secondValue) != \(firstValue)")
            return
        }
    }
}

public func assertNotEquals<T: Equatable>(_ first: T?, _ second: T?)
{
    
    guard let _first = first, let _second = second else
    {
        if first == second
        {
            failTest(message: "Expected different values, but [\(first) & \(second)] are the same.")
        }
        
        return
    }
    
    if _first == _second
    {
        failTest(message: "Expected different values, but [\(_first) & \(_second)]")
    }
}


public func assertNotEmpty(_ string: String)
{
    if string.isEmpty
    {
        failTest(message: "String is empty")
    }
}

public func assertNotEmpty(_ collection: AnyCollection<Any>)
{
    if collection.isEmpty
    {
        failTest(message: "Collection is empty")
    }
}
