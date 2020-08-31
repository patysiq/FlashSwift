//
//  ModelTests.swift
//  FlashSwiftTests
//
//  Created by PATRICIA S SIQUEIRA on 30/08/20.
//  Copyright © 2020 PATRICIA S SIQUEIRA. All rights reserved.
//
//
import XCTest
@testable import FlashSwift

class Model_Test: XCTestCase { //swiftlint:disable:this type_name
    func test_ApiQuestioon_toBeValidModel() {
        //given
        let owner = Owner(reputation: 3, userId: 3, userType: "ok", profileImage: "img", displayName: "Hi", link: "lk")
        let input = Question(owner: owner, answerCount: 32, score: 32, link: "hello", title: "Hi")
        //when
        let output = input.answerCount
        //then
        XCTAssertEqual(output, 32)
    }
}
