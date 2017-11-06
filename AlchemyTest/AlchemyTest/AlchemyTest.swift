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

internal func fail(message: String = "Assertion failed", _ functionName: String = #function)
{
    XCTFail(functionName + " | " + message)
}

public func assertThat(_ expression: Bool)
{
    if !expression
    {
        fail()
    }
}

public func assertFalse(_ expression: Bool)
{
    if expression
    {
        fail()
    }
}

public func assertTrue(_ expression: Bool)
{
    if !expression
    {
        fail()
    }
}

public func assertNotNil(variable: Any?)
{
    if variable == nil
    {
        fail(message: "Expected non-nil value")
    }
}

public func assertNil(variable: Any?)
{
    if let variable = variable
    {
        fail(message: "Expected nil value, but [\(variable)]")
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
        fail(message: "Not equal: [\(first)] & [\(second)]")
        return
    }
    
    if _first != _second
    {
        fail(message: "Not equal: [\(_first)] & [\(_second)]")
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
        fail(message: "Arrays have different lengths")
        return
    }
    
    for (index, firstValue) in first.enumerated()
    {
        let secondValue = second[index]
        
        guard secondValue == firstValue else
        {
            fail(message: "Arrays are different [@\(index)] | \(secondValue) != \(firstValue)")
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
            fail(message: "Expected different values, but [\(first) & \(second)] are the same.")
        }
        
        return
    }
    
    if _first == _second
    {
        fail(message: "Expected different values, but [\(_first) & \(_second)]")
    }
}


public func assertNotEmpty(_ string: String)
{
    if string.isEmpty
    {
        fail(message: "String is empty")
    }
}

public func assertNotEmpty(_ collection: AnyCollection<Any>)
{
    if collection.isEmpty
    {
        fail(message: "Collection is empty")
    }
}
