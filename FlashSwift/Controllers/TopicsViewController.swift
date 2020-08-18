//
//  TopicsViewController.swift
//  FlashSwift
//
//  Created by PATRICIA S SIQUEIRA on 16/08/20.
//  Copyright © 2020 PATRICIA S SIQUEIRA. All rights reserved.
//

import UIKit

class TopicsViewController: UIViewController {
    
    var tips = TopicsModel.itemsMock()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Confirm that a tip was selected
        guard tableView.indexPathForSelectedRow != nil else {return}
        
        // Get a reference to the tip that was tapped on
        print("estou aqui")
        
        let selectedTips = tips[tableView.indexPathForSelectedRow!.row].text
        let selectedTipsTitle = tips[tableView.indexPathForSelectedRow!.row].title
        
        // Get a reference to the detail view controller
        let detailVC = segue.destination as! TipsViewController // swiftlint:disable:this force_cast
        
        // Set the video property of the detail view controller
        detailVC.tips?.text = selectedTips
        detailVC.tips?.title = selectedTipsTitle
    }
    
}

extension TopicsViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return tips.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tips[section].title.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cte.topicCell, for: indexPath)
        cell.textLabel?.text = tips[indexPath.section].title[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        view.backgroundColor = UIColor.init(named: "BG")
        let lbl = UILabel(frame: CGRect(x: 15, y: 0, width: view.frame.width, height: 40))
        lbl.font = UIFont.boldSystemFont(ofSize: 17)
        lbl.textColor = UIColor(named: "swiftColor")
        lbl.text = tips[section].section
        view.addSubview(lbl)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
}
