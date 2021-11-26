//
//  YoutubePlaylistViewController.swift
//  IOS Learnings
//
//  Created by DREAMONLINE on 24/11/21.
//

import UIKit
import Kingfisher
import XCDYouTubeKit
import AVKit

class YoutubePlaylistViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{

   
    var thumbnails = [String]()
    var videoUrls = [String]()
    fileprivate var sideSize: CGFloat!
 
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        getYoutubePlaylistData()
        configureCollectionView()
        
    }
    
    func configureCollectionView() {
        sideSize = collectionView.bounds.width / 3
        collectionViewFlowLayout.itemSize = CGSize(width: sideSize, height: sideSize)
        collectionViewFlowLayout.minimumLineSpacing = 1
        collectionViewFlowLayout.minimumInteritemSpacing = 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! YoutubePlaylistCollectionViewCell
        let prevideoUrl = thumbnails[indexPath.row]
        let url = URL(string: prevideoUrl)
        cell.videoPreview.kf.setImage(with: url)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return thumbnails.count
    }
    

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let previewdeoUrl:String = videoUrls[indexPath.row]
    
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "YoutubePlaylistViewController") as! YoutubePlayerViewController
        secondViewController.videoID = previewdeoUrl
        present(secondViewController, animated: true, completion: nil)

    }
    
    func playVideo(videoUrl:String) {

        let playerViewController = AVPlayerViewController()
           self.present(playerViewController, animated: true, completion: nil)

        

        
        XCDYouTubeClient.default().getVideoWithIdentifier(videoUrl) { (video: XCDYouTubeVideo?, error: Error?) in
            if let streamURL = video?.streamURLs[XCDYouTubeVideoQuality.small240.rawValue] {
                    playerViewController.player = AVPlayer(url: streamURL)
                } else {
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
    

    
    func getYoutubePlaylistData(){
        let url = "https://www.googleapis.com/youtube/v3/playlistItems"
        if  let urlComponent = NSURLComponents(string: url),let actualUrl = urlComponent.url {
            
            urlComponent.queryItems = [
                URLQueryItem(name: "part", value: "snippet"),
                URLQueryItem(name: "maxResults", value: "25"),
                URLQueryItem(name: "playlistId", value: "PL5PR3UyfTWvfacnfUsvNcxIiKIgidNRoW"),
                URLQueryItem(name: "pageToken", value: ""),
                URLQueryItem(name: "key", value: "AIzaSyBbx1tWZ_j17HBq7y84NF_B_QQQGxNSz5o")
            ]
        
       
        
        URLSession.shared.dataTask(with: actualUrl, completionHandler: { data, response, error -> Void in
            do {
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(YoutubePlaylistModel.self, from: data!)
                //var items = [Items]()
                guard let items = responseModel.items else {
                    return
                }
                
                for item in items{
                    self.thumbnails.append((item.snippet?.thumbnails?.high?.url!)!)
                    self.videoUrls.append((item.snippet?.resourceId?.videoId!)!)
                }
                print(self.thumbnails)
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
              
            } catch {
                print("JSON Serialization error")
            }
        }).resume()
            
        }
    }
    
}

