//
//  AlchemyTestTests.swift
//  AlchemyTest
//
//  Created by Wellington Moreno on 03/02/2018.
//  Copyright © 2018 Wellington Moreno. All rights reserved.
//

@testable
import AlchemyTest
import Foundation


//======================================
// MARK: TESTS 'BEFORE' METHODS
//======================================

class AlchemyTestCaseBeforeTests: AlchemyTestCase
{
    private static var counter = 0
    private var counter = 0

    override static func beforeTests()
    {
        super.beforeTests()

        AlchemyTestCaseBeforeTests.counter = -1
    }

    override func beforeEachTest()
    {
        super.beforeEachTest()
        counter = -1
    }

    func testBeforeTests()
    {
        assertEquals(AlchemyTestCaseBeforeTests.counter, -1)
    }

    func testBeforeEachTest()
    {
        assertEquals(counter, -1)
    }

}

//======================================
// MARK: TESTS 'AFTER' METHODS
//======================================
class AlchemyTestCaseAfterTests: AlchemyTestCase
{
    private static var counter = 0
    private var counter = 0

    override static func afterTests()
    {
        super.afterTests()
        assertEquals(AlchemyTestCaseAfterTests.counter, 1)
    }

    override func afterEachTest()
    {
        super.afterEachTest()
        print("Counter at \(counter)")
        assertEquals(counter, 1)
    }

    func testAfterTests()
    {
        AlchemyTestCaseAfterTests.counter = 1
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
class AlchemyTestCaseIterationsTest: AlchemyTestCase
{
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