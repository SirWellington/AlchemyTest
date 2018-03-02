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

public class AlchemyTest: XCTestCase
{

    public typealias Block = () -> Void
    public var iterations = 100

    public override static func setUp()
    {
        super.setUp()
        beforeTests()
    }

    public override static func tearDown()
    {
        super.tearDown()
        afterTests()
    }

    public override func setUp()
    {
        super.setUp()
        beforeEachTest()
    }

    public override func tearDown()
    {
        super.tearDown()
        afterEachTest()
    }

    public class func beforeTests()
    {
    }

    public class func afterTests()
    {
    }

    public func beforeEachTest()
    {
    }

    public func afterEachTest()
    {
    }
    
    public func runTest(_ block: Block)
    {
        runTest(iterations: self.iterations, block)
    }

    public func runTest(iterations: Int = 10, _ block: Block)
    {
        (0..<iterations).forEach
        { _ in
            block()
        }
    }


}
