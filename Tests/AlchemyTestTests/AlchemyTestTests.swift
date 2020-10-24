//
//  AlchemyTestTests.swift
//  AlchemyTest
//
//  Created by Wellington Moreno on 03/02/2018.
//  Copyright © 2019 Wellington Moreno. All rights reserved.
//

@testable
import AlchemyTest
import Foundation


//======================================
// MARK: TESTS 'BEFORE' METHODS
//======================================

class AlchemyTestBeforeTests: AlchemyTest
{
    private static var counter = 0
    private var counter = 0

    override static func beforeTests()
    {
        super.beforeTests()

        AlchemyTestBeforeTests.counter = -1
    }

    override func beforeEachTest()
    {
        super.beforeEachTest()
        counter = -1
    }

    func testBeforeTests()
    {
        assertEquals(AlchemyTestBeforeTests.counter, -1)
    }

    func testBeforeEachTest()
    {
        assertEquals(counter, -1)
    }

}

//======================================
// MARK: TESTS 'AFTER' METHODS
//======================================
class AlchemyTestAfterTests: AlchemyTest
{
    
    private static var counter = 0
    private var counter = 0

    override static func afterTests()
    {
        super.afterTests()
        assertEquals(AlchemyTestAfterTests.counter, 1)
    }

    override func afterEachTest()
    {
        super.afterEachTest()
        print("Counter at \(counter)")
        assertEquals(counter, 1)
    }

    func testAfterTests()
    {
        AlchemyTestAfterTests.counter = 1
        counter = 1
    }

    func testAfterEachTest()
    {
        counter = 1
    }
}

//======================================
// MARK: TESTS 'RUN TEST' ITERATIONS
//======================================
class AlchemyTestIterationsTest: AlchemyTest
{
    private var instanceCounter = 0

    override func beforeEachTest()
    {
        instanceCounter += 1
    }
    
    func testRunTestIterationsCallsBeforeMethod()
    {
        instanceCounter = 0

        let iterations = 99
        runTest(iterations: iterations)
        {
            //
        }

        assertEquals(instanceCounter, iterations)
    }

    func testRunTestIterations()
    {
        var counter = 0
        let iterations = 99

        runTest(iterations: iterations)
        {
            counter += 1
        }

        assertEquals(counter, iterations)
    }
}
