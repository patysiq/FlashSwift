//
//  QuestionsViewController.swift
//  FlashSwift
//
//  Created by PATRICIA S SIQUEIRA on 20/08/20.
//  Copyright © 2020 PATRICIA S SIQUEIRA. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    var networking = ApiManagerQuestion()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        }
    }

// MARK: - TableView Methods

extension QuestionsViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cte.questionCell , for: indexPath) as! QuestionsTableViewCell // swiftlint:disable:this force_cast
        cell.textLabel?.text = "hey"
        return cell
    }
}
