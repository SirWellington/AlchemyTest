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
    
    public func repeatTest(_ block: Block)
    {
        repeatTest(iterations: self.iterations, block)
    }

    public func repeatTest(iterations: Int, _ block: Block)
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
        repeatTest(iterations: self.iterations, block)
    }
    
    @available(*, deprecated, message: "Use `repeatTest` instead")
    public func runTest(iterations: Int, _ block: Block)
    {
        repeatTest(iterations: iterations, block)
    }
    

}
