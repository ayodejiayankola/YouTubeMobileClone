 //
//  VideoTableViewCell.swift
//  YouTubeMobileClone
//
//  Created by Ayodejii Ayankola on 29/11/2021.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var video: VideoModel?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCell(_ v: VideoModel) {
        self.video = v
        // Ensure that we have a video
        guard self.video != nil else {
            return
        }
        //set the title label
        self.titleLabel.text = video?.title
        
        //set the date label
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
//        self.dateLabel.text = dateFormatter.string(from: video!.publishedDate)
        
        //set the image view
        guard self.video!.thumbnail != "" else { return }
        
        // Check cacha before downloading data
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail)  {
            // set the thumbnail image view
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
        }
        // Download the thumbnail data
        let url = URL(string: self.video!.thumbnail)
        
        // Get the shared URL Session Object
        
        let session = URLSession.shared
        
        // Create a data task
        let dataTask = session.dataTask(with: url!) { data, response, error in
            
            if error == nil && data != nil {
                // Save the data in the cache
                CacheManager.setVideoCache(url!.absoluteString, data)
                // Check that the downloaded url matches the video thumbnail url that this cell is currently set to display
                
                if url!.absoluteString != self.video?.thumbnail {
                    // Video cell has been recycled for another video and no longer matches the thumbnail that was downloaded
                    return
                }
                
                // Create the image Object
                let image = UIImage(data: data!)
                
                // Set the image view
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
            }
        }
        
        // Start the data Task
        dataTask.resume()

    }
}
