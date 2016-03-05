//
//  CalculadoraTest.swift
//  T1E02
//
//  Created by Cristian Contreras Velásquez on 04-03-16.
//  Copyright © 2016 Cristian Contreras Velásquez. All rights reserved.
//

import XCTest

@testable import T1E02

class CalculadoraTest: XCTestCase {
    
    var calculadora: Calculadora!
    
    override func setUp() {
        super.setUp()
        self.calculadora = Calculadora()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    func testAdd(){
        self.calculadora.operator1 = 5
        self.calculadora.operator2 = 5
        self.calculadora.operation = "+"
        XCTAssertEqual(self.calculadora.makeOperation(),
        10,"Error")
        
        self.calculadora.operator1 = 5
        self.calculadora.operator2 = 5
        self.calculadora.operation = "-"
        XCTAssertEqual(self.calculadora.makeOperation(),
            0,"Error")
        
        self.calculadora.operator1 = 5
        self.calculadora.operator2 = 5
        self.calculadora.operation = "*"
        XCTAssertEqual(self.calculadora.makeOperation(),
            25,"Error")
        
        self.calculadora.operator1 = 5
        self.calculadora.operator2 = 5
        self.calculadora.operation = "/"
        XCTAssertEqual(self.calculadora.makeOperation(),
            1,"Error")
        
        self.calculadora.operator1 = 1
        self.calculadora.operator2 = 0
        self.calculadora.operation = "/"
        XCTAssertEqual(self.calculadora.makeOperation(),0,"Error")
        
    }
}
