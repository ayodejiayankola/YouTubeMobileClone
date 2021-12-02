//
//  DetailsViewController.swift
//  YouTubeMobileClone
//
//  Created by Ayodejii Ayankola on 02/12/2021.
//

import UIKit
import WebKit

class DetailsViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var textView: UITextView!
    
    var video: VideoModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Clear the fields
        titleLabel.text = ""
        dateLabel.text = ""
        textView.text = ""
        
        // Check if there's a video
        guard video != nil else {
            return
        }
        
        // Check the embed url
        
        // load it into the web view
        
        // set the title
        
        // Set the date
        
        // set the description
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
