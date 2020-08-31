//
//  Test.swift
//  FlashSwiftTests
//
//  Created by PATRICIA S SIQUEIRA on 27/08/20.
//  Copyright © 2020 PATRICIA S SIQUEIRA. All rights reserved.
//
//
import XCTest
@testable import FlashSwift

class question_Test: XCTestCase { //swiftlint:disable:this type_name
    func test_videosFetched(_ videos: [Video]) {
        //given
        let sut = QuestionsViewController()
        let input = [Question]()
        //when
        let output1 = sut.tableView.numberOfRows(inSection: input.count)
        //then
        XCTAssertEqual(output1, input.count)
    }
    func test_CacheManagerMidia_ToBeOk() {
        //given
        _ = CacheManagerMidia()
        let video = Video.self
        //when
        _ = CacheManagerMidia.getVideoCache(video.AdditionalInfoKeys.thumbnails.stringValue)
       //Then
        XCTAssertNoThrow(Data())
    }
    func test_CacheManagerQuestions_ToBeOk() {
          //given
          _ = CacheManagerQuestion()
        let owner = Owner(reputation: 3, userId: 3, userType: "ok", profileImage: "img", displayName: "Hi", link: "lk")
        let input = Question(owner: owner, answerCount: 32, score: 32, link: "hello", title: "Hi")
          //when
        _ = CacheManagerQuestion.getQuestionCache(input.link!)
         //Then
          XCTAssertNoThrow(Data())
      }
}
