//
//  Model.swift
//  YouTubeMobileClone
//
//  Created by Ayodejii Ayankola on 19/11/2021.
//

import Foundation

protocol ApiDelegate {
    func videosFetched(_ videos:[VideoModel])
}
class Api {
    
    var delegate: ApiDelegate?
    
    func getVideos(){
        // Create a URL Object
        let url = URL(string: Constants.API_URL)
        guard url != nil else { return }
        // Get a URL Session
        let session = URLSession.shared
        // Get a data task From the URL Session object
        let dataTask = session.dataTask(with: url!) { data, response, error in
            //Check if there were any errors
            if error != nil || data == nil {
                return
            }
            // Parsing the data into the Video objects Model
            
            do {
                let decoder = JSONDecoder()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
                
//                decoder.dataDecodingStrategy = .custom(dateFormatter)
                let response = try decoder.decode(Response.self, from: data!)
                if response.items != nil {
                    
                    
                    DispatchQueue.main.async {
                        //call the "videoFetched" method of the delegate
                        self.delegate?.videosFetched(response.items!)
                    }

                }
                dump(response)
            } catch  {
                print(error.localizedDescription)
            }
        }
        
        // Kick off the task
        dataTask.resume()
    }
}
