//
//  AlchemyTest.swift
//  AlchemyTest
//
//  Created by Wellington Moreno on 03/02/2018.
//  Copyright © 2018 Wellington Moreno. All rights reserved.
//

import Foundation
import XCTest


//======================================
// MARK: ALCHEMY TEST
//======================================
protocol AlchemyTestProtocol
{
    static func beforeTests()

    static func afterTests()

    func beforeEachTest()

    func afterEachTest()
}

open class AlchemyTest: XCTestCase
{
    /// The number of times a test is repeated whenever `repeatTest()` feature is used
    open var iterations: Int { return 100 }
    
    public typealias Block = () -> Void

    open override static func setUp()
    {
        super.setUp()
        beforeTests()
    }

    open override static func tearDown()
    {
        super.tearDown()
        afterTests()
    }

    open override func setUp()
    {
        super.setUp()
        beforeEachTest()
    }

    open override func tearDown()
    {
        super.tearDown()
        afterEachTest()
    }

    open class func beforeTests()
    {
    }

    open class func afterTests()
    {
    }

    open func beforeEachTest()
    {
    }

    open func afterEachTest()
    {
    }
    
    /**
        Repeats a block of test code `iterations` times.
        > Note that the test is reset on each iteration, like so:
     
        1. `beforeEachTest()`
        2. `block()`
        3. `afterEachTest()`
     
        - Parameter block: The test block to repeat and execute
     */
    public func repeatTest(_ block: Block)
    {
        repeatTest(iterations, block)
    }

    public func repeatTest(_ iterations: Int, _ block: Block)
    {
        (0..<iterations).forEach
        { _ in
            beforeEachTest()
            block()
            afterEachTest()
        }
    }
    
    @available(*, deprecated, message: "Use `repeatTest` instead")
    public func runTest(_ block: Block)
    {
        repeatTest(iterations, block)
    }
    
    @available(*, deprecated, message: "Use `repeatTest` instead")
    public func runTest(iterations: Int, _ block: Block)
    {
        repeatTest(iterations, block)
    }

    public func asyncTest(_ timeout: TimeInterval = 15.0, _ callback: (XCTestExpectation) -> Void)
    {
        let promise = expectation(description: "operation")
        callback(promise)
        wait(for: [promise], timeout: timeout)
    }


}
