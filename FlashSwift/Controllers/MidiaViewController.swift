//
//  MidiaViewController.swift
//  FlashSwift
//
//  Created by PATRICIA S SIQUEIRA on 15/08/20.
//  Copyright © 2020 PATRICIA S SIQUEIRA. All rights reserved.
//

import UIKit

class MidiaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var videos = [Video]()
    var model = ApiModelMidia()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set itself as datasource and the delegate
        tableView.dataSource = self
        tableView.delegate = self
        
        model.getVideos()
        
        model.delegate = self
             
    }

// MARK: - Model Delegate Methods
    
    func videosFetched(_ videos: [Video]) {
        
        // Set the returned videos to our video property
        self.videos = videos
        
        // Refresh the tableview
        tableView.reloadData()
   
    }
    
// MARK: - TableView Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cte.videoCell , for: indexPath)
        // Configure the cell with the data
        
        //Get the title for the video in question
        let title = self.videos[indexPath.row].title
        
        //cell.setCell(video)
        
        cell.textLabel?.text = title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
