//
//  AlchemyTestPlusAssertionsTest.swift
//  AlchemyTest
//
//  Created by Wellington Moreno on 11/5/17.
//  Copyright © 2019 Wellington Moreno. All rights reserved.
//

@testable import AlchemyTest
import XCTest

class AlchemyTestPlusAssertionsTest: XCTestCase
{

    private var testIterations = 100

    override func setUp()
    {
        super.setUp()
    }

    override func tearDown()
    {
        super.tearDown()
    }

    func testDoubleAssertEqualsWithMarginOfError()
    {
        assertEquals(0.5, 0.6, withMarginOfError: 0.15)
        assertEquals(0.51, 0.65, withMarginOfError: 0.2)
        assertEquals(12.3, 12.35, withMarginOfError: 0.1)
        assertEquals(543.21, 541.01, withMarginOfError: 4.0)
    }

    func testDateAssertEqualsWithMarginOfError()
    {
        (1...testIterations).forEach
        { i in

            let firstDate = Date()
            let secondDate = firstDate.addingTimeInterval(1.0)
            assertEquals(firstDate, secondDate, withMarginOfError: 2.0)
        }
    }

    func testCGFloatAssertEqualsWithMarginOfError()
    {
        assertEquals(CGFloat(0.5), CGFloat(0.6), withMarginOfError: CGFloat(0.15))
        assertEquals(CGFloat(0.51), CGFloat(0.65), withMarginOfError: CGFloat(0.2))
        assertEquals(CGFloat(12.3), CGFloat(12.35), withMarginOfError: CGFloat(0.1))
        assertEquals(CGFloat(543.21), CGFloat(541.01), withMarginOfError: CGFloat(4.0))
    }

    func testDecimalAssertEqualsWithMarginOfError()
    {
        assertEquals(Decimal(0.5), Decimal(0.6), withMarginOfError: Decimal(0.15))
        assertEquals(Decimal(0.51), Decimal(0.65), withMarginOfError: Decimal(0.2))
        assertEquals(Decimal(12.3), Decimal(12.35), withMarginOfError: Decimal(0.1))
        assertEquals(Decimal(543.21), Decimal(541.01), withMarginOfError: Decimal(4.0))
    }


}
