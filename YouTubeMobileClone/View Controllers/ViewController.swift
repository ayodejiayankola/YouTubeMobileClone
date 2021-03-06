//
//  ViewController.swift
//  YouTubeMobileClone
//
//  Created by Ayodejii Ayankola on 15/11/2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ApiDelegate {



    @IBOutlet weak var videoTableView: UITableView!
    
    var api = Api()
    
    var videos = [VideoModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set itself as the datasource and the delegate
        videoTableView.dataSource = self
        videoTableView.delegate = self
        
        //Set itself as the delegate of the model
        api.delegate = self
        
        // Do any additional setup after loading the view.
        api.getVideos()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // confirm that a video was selected
        guard videoTableView.indexPathForSelectedRow != nil else {
            return
        }
        
        // Get a refrence to the video that was tapped on
        let selectedVideo = videos[videoTableView.indexPathForSelectedRow!.row]
        
        // Get a refrence to the detail view controller
        let detailVC = segue.destination as! DetailsViewController
        
        // Set the video property of the detail view controller
        detailVC.video = selectedVideo
    }
    // MARK:- Model Delegate Methods
    
    func videosFetched(_ videos: [VideoModel]) {
        
        // Set the returned videos to our video property
        self.videos = videos

        // Reload the tableview
        self.videoTableView.reloadData()
    }
    
    
    
    //MARK:- Tableview Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(videos.count
        )
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = videoTableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        
        //Configure the cell with the data
        // Get the title of the video in question
        let video = self.videos[indexPath.row]
//        cell.textLabel?.text = title
        
        cell.setCell(video)
        
        //Return the cell
        return cell
    }
    

}

