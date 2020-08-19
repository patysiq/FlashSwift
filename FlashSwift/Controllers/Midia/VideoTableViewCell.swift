//
//  VideoTableViewCell.swift
//  FlashSwift
//
//  Created by PATRICIA S SIQUEIRA on 15/08/20.
//  Copyright © 2020 PATRICIA S SIQUEIRA. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var channelLabel: UILabel!
    var video: Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ vid:Video) {
        
        self.video = vid
        
        // Ensure that we have a video
        guard self.video != nil else {return}
        
        // Set the title Label
        self.titleLabel.text = video?.title
        
        // Set the channel Label
        self.channelLabel.text = video?.channelTitle
        
        // Set the date Label
        let datef = DateFormatter()
        datef.dateFormat = "EEEE, MMM d, yyyyy"
        self.dateLabel.text = datef.string(from: video!.publishedAt)
        
        // Set the thumbnail
        guard self.video!.thumbnail != "" else {return}
        
        // Check cache before download data
        if let cachedData = CacheManagerMidia.getVideoCache(self.video!.thumbnail) {
            // Set the thumbnail imageview
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
        }
        
        // Download the thumbnail data
        let url = URL(string: self.video!.thumbnail)
        
        //Get the shared URL Session object
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, _, error) in
            
            if error == nil && data != nil {
                
                // Save the data in the cache
                CacheManagerMidia.setVideoCache(url!.absoluteString, data)
                
                // Check that the donwloaded url matches the video thumbnail url that this cell is currently set to display
                if url?.absoluteString != self.video?.thumbnail {
                // Video cell has been recycled for another video and no longer matches the thumbnail that was downloaded
                    return
                }
                
                // Create the image object
                let image = UIImage(data: data!)
                
                // Set the imageview
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
                
            }
        }
        dataTask.resume()
    }
    
}
