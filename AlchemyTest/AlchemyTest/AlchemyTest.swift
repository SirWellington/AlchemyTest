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

internal func fail(message: String = "Assertion failed")
{
    XCTFail(message)
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

public func assertEquals<T: Equatable>(first: T?, second: T?)
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
