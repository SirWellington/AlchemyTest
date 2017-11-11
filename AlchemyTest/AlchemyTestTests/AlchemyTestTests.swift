//
//  AlchemyTestTests.swift
//  AlchemyTestTests
//
//  Created by Wellington Moreno on 11/5/17.
//  Copyright © 2017 Wellington Moreno. All rights reserved.
//

@testable import AlchemyTest
import XCTest

class AlchemyTestTests: XCTestCase
{
    
    override func setUp()
    {
        super.setUp()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
   
    func testAssertEqualsWithMarginOfError()
    {
        assertEquals(0.5, 0.6, withMarginOfError: 0.15)
        assertEquals(0.51, 0.65, withMarginOfError: 0.2)
        assertEquals(12.3, 12.35, withMarginOfError: 0.1)
        assertEquals(543.21, 541.01, withMarginOfError: 4.0)
    }
    
}
