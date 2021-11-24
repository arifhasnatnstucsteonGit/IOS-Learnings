//
//  YoutubePlaylistViewController.swift
//  IOS Learnings
//
//  Created by DREAMONLINE on 24/11/21.
//

import UIKit
import Kingfisher

class YoutubePlaylistViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{

   
    var thumbnails = [String]()

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        getYoutubePlaylistData()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! YoutubePlaylistCollectionViewCell
        //cell.videoPreview.image
        let prevideoUrl = thumbnails[indexPath.row]
        let url = URL(string: prevideoUrl)
        // this downloads the image asynchronously if it's not cached yet
        cell.videoPreview.kf.setImage(with: url)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return thumbnails.count
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
                //print(responseModel.items![0].snippet?.resourceId?.videoId)
               // print(responseModel.items![0].snippet?.thumbnails?.standard?.url)
                var items = [Items]()
                items = responseModel.items!
                
                for item in items{
                    self.thumbnails.append((item.snippet?.thumbnails?.standard?.url!)!)
                }
                print(self.thumbnails)
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
              
                
                //self.thumbnails.append((responseModel.items![0].snippet?.thumbnails?.standard?.url!)!)
            } catch {
                print("JSON Serialization error")
            }
        }).resume()
    }
    
}

