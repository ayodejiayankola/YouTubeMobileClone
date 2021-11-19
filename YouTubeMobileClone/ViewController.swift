//
//  ViewController.swift
//  YouTubeMobileClone
//
//  Created by Ayodejii Ayankola on 15/11/2021.
//

import UIKit

class ViewController: UIViewController {

    var api = Api()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        api.getVideos()
    }


}

