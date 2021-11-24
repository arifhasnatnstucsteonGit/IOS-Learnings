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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let previewdeoUrl:String = videoUrls[indexPath.row]
        //let url = URL(string: prevideoUrl)
        print(previewdeoUrl)
        let fullUrl = "https://www.youtube.com/watch?v=" + previewdeoUrl
        //playVideo(videoUrl: fullUrl)
        print(fullUrl)
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let secondViewController = storyboard.instantiateViewController(withIdentifier: "YoutubePlaylistViewController") as UIViewController
//        navigationController?.pushViewController(secondViewController, animated: true)
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let secondViewController = storyboard.instantiateViewController(withIdentifier: "YoutubePlaylistViewController") as! YoutubePlayerViewController
//        navigationController?.pushViewController(secondViewController, animated: true)

        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "YoutubePlaylistViewController") as UIViewController
        present(secondViewController, animated: true, completion: nil)
//
//        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "YoutubePlaylistViewController") as? YoutubePlayerViewController
//        self.navigationController?.pushViewController(vc!, animated: true)
        
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
                    self.videoUrls.append((item.snippet?.resourceId?.videoId!)!)
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

