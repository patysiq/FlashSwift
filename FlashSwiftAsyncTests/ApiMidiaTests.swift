//
//  ServiceLayerTests.swift
//  FlashSwiftAsyncTests
//
//  Created by PATRICIA S SIQUEIRA on 30/08/20.
//  Copyright © 2020 PATRICIA S SIQUEIRA. All rights reserved.
//

import XCTest
@testable import FlashSwift

class ApiMidiaTests: XCTestCase {

    func test_ApiMidiaTest_dataApi_toBeValid() {
        //given
        let model = ApiModelMidia()
        let videos = [Video]()
        let expect = expectation(description: "getting all videos")
        //When
        model.delegate?.videosFetched(videos)
        // Then
        XCTAssertNoThrow(videos)
        expect.fulfill()
        wait(for: [expect], timeout: 10)
    }
}
