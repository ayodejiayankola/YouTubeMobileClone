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

    // MARK:- Model Delegate Methods
    
    func videosFetched(_ videos: [VideoModel]) {
        
        // Set the returned videos to our video property
        self.videos = videos

        // Reload the tableview
        self.videoTableView.reloadData()
    }
    
    
    
    //MARK:- Tableview Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = videoTableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath)
        
        //Configure the cell with the data
        // Get the title of the video in question
//        let title = self.videos[indexPath.row].title
//        cell.textLabel?.text = title
        
        
        //Return the cell
        return cell
    }
    

}

