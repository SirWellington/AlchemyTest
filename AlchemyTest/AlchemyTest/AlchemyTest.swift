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

public func failTest(_ message: String = "Assertion failed", functionName: String = #function, filename: StaticString = #file, lineNumber: UInt = #line)
{
    XCTFail(functionName + " | " + message, file: filename, line: lineNumber)
}

public func assertThat(_ expression: Bool, filename: StaticString = #file, lineNumber: UInt = #line)
{
    if !expression
    {
        failTest(filename: filename, lineNumber: lineNumber)
    }
}

public func assertFalse(_ expression: Bool, filename: StaticString = #file, lineNumber: UInt = #line)
{
    if expression
    {
        failTest(filename: filename, lineNumber: lineNumber)
    }
}

public func assertTrue(_ expression: Bool, filename: StaticString = #file, lineNumber: UInt = #line)
{
    if !expression
    {
        failTest(filename: filename, lineNumber: lineNumber)
    }
}

public func assertNotNil(_ variable: Any?, filename: StaticString = #file, lineNumber: UInt = #line)
{
    if variable == nil
    {
        failTest("Expected non-nil value", filename: filename, lineNumber: lineNumber)
    }
}

public func assertNil(_ variable: Any?, filename: StaticString = #file, lineNumber: UInt = #line)
{
    if let variable = variable
    {
        failTest("Expected nil value, but [\(variable)]", filename: filename, lineNumber: lineNumber)
    }
}

public func assertEquals<T: Equatable>(_ first: T?, _ second: T?, filename: StaticString = #file, lineNumber: UInt = #line)
{
    if first == nil && second == nil
    {
        return
    }
    
    guard let _first = first, let _second = second else
    {
        failTest("Not equal: [\(first)] & [\(second)]", filename: filename, lineNumber: lineNumber)
        return
    }
    
    if _first != _second
    {
        failTest("Not equal: [\(_first)] & [\(_second)]", filename: filename, lineNumber: lineNumber)
    }
}

public func assertEquals<T: Equatable>(_ first: [T], _ second: [T], filename: StaticString = #file, lineNumber: UInt = #line)
{
    if first.isEmpty && second.isEmpty
    {
        return
    }
    
    guard first.count == second.count else
    {
        failTest("Arrays have different lengths", filename: filename, lineNumber: lineNumber)
        return
    }
    
    for (index, firstValue) in first.enumerated()
    {
        let secondValue = second[index]
        
        guard secondValue == firstValue else
        {
            failTest("Arrays are different [@\(index)] | \(secondValue) != \(firstValue)", filename: filename, lineNumber: lineNumber)
            return
        }
    }
}

public func assertEquals(_ first: Double, _ second: Double, withMarginOfError marginOfError: Double, filename: StaticString = #file, lineNumber: UInt = #line)
{
    let left = first - marginOfError
    let right = first + marginOfError
    
    guard left <= second else
    {
        failTest("\(first) != \(second) within ε (\(marginOfError))", filename: filename, lineNumber: lineNumber)
        return
    }
    
    guard second <= right else
    {
        failTest("\((first)) != \(second) within ε (\(marginOfError))", filename: filename, lineNumber: lineNumber)
        return
    }
}

public func assertNotEquals<T: Equatable>(_ first: T?, _ second: T?, filename: StaticString = #file, lineNumber: UInt = #line)
{
    
    guard let _first = first, let _second = second else
    {
        if first == second
        {
            failTest("Expected different values, but [\(first) & \(second)] are the same.", filename: filename, lineNumber: lineNumber)
        }
        
        return
    }
    
    if _first == _second
    {
        failTest("Expected different values, but [\(_first) & \(_second)]", filename: filename, lineNumber: lineNumber)
    }
}


public func assertNotEmpty(_ string: String, filename: StaticString = #file, lineNumber: UInt = #line)
{
    if string.isEmpty
    {
        failTest("String is empty", filename: filename, lineNumber: lineNumber)
    }
}

public func assertNotEmpty(_ collection: AnyCollection<Any>, filename: StaticString = #file, lineNumber: UInt = #line)
{
    if collection.isEmpty
    {
        failTest("Collection is empty", filename: filename, lineNumber: lineNumber)
    }
}

public func assertNotEmpty(_ array: [Any], filename: StaticString = #file, lineNumber: UInt = #line)
{
    if array.isEmpty
    {
        failTest("Array is empty", filename: filename, lineNumber: lineNumber)
    }
}

public func assertEmpty(_ collection: AnyCollection<Any>, filename: StaticString = #file, lineNumber: UInt = #line)
{
    if !collection.isEmpty
    {
        failTest("Collection is not empty. Has \(collection.count) elements", filename: filename, lineNumber: lineNumber)
    }
}

public func assertEmpty(_ array: [Any], filename: StaticString = #file, lineNumber: UInt = #line)
{
    if !array.isEmpty
    {
        failTest("Array is not empty. Has \(array.count) elements", filename: filename, lineNumber: lineNumber)
    }
}
