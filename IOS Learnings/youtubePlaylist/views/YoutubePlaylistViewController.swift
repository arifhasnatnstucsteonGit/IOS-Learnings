//
//  YoutubePlaylistViewController.swift
//  IOS Learnings
//
//  Created by DREAMONLINE on 24/11/21.
//

import UIKit

class YoutubePlaylistViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getYoutubePlaylistData()
        
    }
    

    
    func getYoutubePlaylistData(){
        let urlComponent = NSURLComponents(string: "https://www.googleapis.com/youtube/v3/playlistItems")!
        urlComponent.queryItems = [
            URLQueryItem(name: "part", value: "snippet"),
            URLQueryItem(name: "maxResults", value: "25"),
            URLQueryItem(name: "playlistId", value: "PLs6YIr-PdysBBJKQEKd1FSMFF3_g6_ien"),
            URLQueryItem(name: "pageToken", value: ""),
            URLQueryItem(name: "key", value: "AIzaSyBbx1tWZ_j17HBq7y84NF_B_QQQGxNSz5o")
        ]
        
        URLSession.shared.dataTask(with: urlComponent.url!, completionHandler: { data, response, error -> Void in
            do {
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(YoutubePlaylistModel.self, from: data!)
                print(responseModel.items!)
            } catch {
                print("JSON Serialization error")
            }
        }).resume()
    }
    
}

