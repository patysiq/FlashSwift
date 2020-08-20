//
//  ApiModel.swift
//  FlashSwift
//
//  Created by PATRICIA S SIQUEIRA on 15/08/20.
//  Copyright © 2020 PATRICIA S SIQUEIRA. All rights reserved.
//

import Foundation

protocol QuestionDelegate: AnyObject {
    func questionFetched(_ questions:[Question])
}

class ApiManagerQuestion {
    
    weak var delegate: QuestionDelegate?
    
    func getQuestions() {
        
        var allQuestions: [Question] = []
        
        //Get a data task from the URLSession object
    
            //Create URL object
        let urlString = URL(string: "\(Cte.urlBaseStackExchange)\(Cte.pathStackExchange)")
            
            guard let url = urlString else {
                print(ApiError.invalidUrl)
                return
            }
            
            //Get URLSession object
            let session = URLSession.shared
            let dataTask = session.dataTask(with: url) { (data, response, error) in
                
                guard let response = response as?  HTTPURLResponse else {return}
                
                guard let data = data else {return}
                
                //check if there were any errors
                if error != nil {
                    print(ApiError.couldNotDecode)
                    return
                }
                
                do {
                    //Parsing the data into video objects
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    
                    let response = try decoder.decode(ResponseApiQuestion.self, from: data)
                    
                    if response.items != nil {
                        DispatchQueue.main.async {
                            // Call the "videosFetched" method of the delegate
                            allQuestions += response.items!
                            self.delegate?.questionFetched(allQuestions)
                        }
                    }
                    
                    dump(response)
                    
                } catch {
                    print(ApiError.unknowEroor(statuscode: response.statusCode))
                }
                
            }
            //Kick off the task
            dataTask.resume()
        
    }
    
}
