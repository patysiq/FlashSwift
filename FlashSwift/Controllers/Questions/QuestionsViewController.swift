//
//  QuestionsViewController.swift
//  FlashSwift
//
//  Created by PATRICIA S SIQUEIRA on 20/08/20.
//  Copyright © 2020 PATRICIA S SIQUEIRA. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController, QuestionDelegate {
    
    var questions = [Question]()
    var model = ApiManagerQuestion()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        model.getQuestions()
        model.delegate = self
        
    }
    
    // MARK: - Model Delegate Methods
    func questionFetched(_ questions: [Question]) {
        
        // Set the returned questions to our question property
        self.questions = questions
        print(questions)
        
        // Refresh the tableview
        tableView.reloadData()
    }
    
    }

// MARK: - TableView Methods

extension QuestionsViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cte.questionCell , for: indexPath) as! QuestionsTableViewCell // swiftlint:disable:this force_cast

        // Configure the cell with the data
        let question = self.questions[indexPath.row]
        cell.setCell(question)

        return cell
    }
}
