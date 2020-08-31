//
//  ApiQuestionTest.swift
//  FlashSwiftAsyncTests
//
//  Created by PATRICIA S SIQUEIRA on 30/08/20.
//  Copyright © 2020 PATRICIA S SIQUEIRA. All rights reserved.
//

import Foundation

import XCTest
@testable import FlashSwift

class ApiQuestionTests: XCTestCase {

    func test_ApiQuestion_DataApi_toBeValid() {
        //given
        let model = ApiManagerQuestion()
        let questions = [Question]()
        let expect = expectation(description: "getting all questions")
        //When
        model.delegate?.questionFetched(questions)
        // Then
        XCTAssertNoThrow(questions)
        expect.fulfill()
        wait(for: [expect], timeout: 10)
    }
}
