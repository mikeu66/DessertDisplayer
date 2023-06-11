//
//  DessertDisplayerTests.swift
//  DessertDisplayerTests
//
//  Created by Michael  Walter on 6/5/23.
//

import XCTest
@testable import DessertDisplayer



final class DessertDisplayerTests: XCTestCase {
    var sut: TheMealAPI!
    
    override func setUp() {
        super.setUp()
        sut = TheMealAPI()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    
    func test_fetchMealList_returns_data() {
        let expecation = self.expectation(description: "List fetched")
        let urlString = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        sut.fetchMealList(urlString: urlString) { (resp) in
            XCTAssertNotNil(resp)
            expecation.fulfill()
            
        }
        waitForExpectations(timeout: 3, handler: nil)
    }
    
    func test_fetchDetails_returns_data() {
        let expecation = self.expectation(description: "Details Fetched")
        let MealID = "52923"
        sut.fetchDetails(id: MealID) { (resp) in
            XCTAssertNotNil(resp)
            expecation.fulfill()
            
        }
        waitForExpectations(timeout: 3, handler: nil)
    }
    
    
    
}
