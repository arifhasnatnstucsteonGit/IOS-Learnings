//
//  YoutubePlayerViewController.swift
//  IOS Learnings
//
//  Created by DREAMONLINE on 24/11/21.
//

import UIKit
import XCDYouTubeKit
import AVKit
import YoutubeKit

class YoutubePlayerViewController: UIViewController {
    private var player: YTSwiftyPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Create a new player
                player = YTSwiftyPlayer(
                            frame: CGRect(x: 0, y: 0, width: 640, height: 480),
                            playerVars: [.videoID("fzOBRSvmSC8")])

                // Enable auto playback when video is loaded
                player.autoplay = true
                
                // Set player view.
                view = player

                // Set delegate for detect callback information from the player.
                //player.delegate = self
                
                // Load the video.
                player.loadPlayer()

        // Do any additional setup after loading the view.
        //playVideo()
    }
    
    func playVideo() {

            let playerViewController = AVPlayerViewController()
           self.present(playerViewController, animated: true, completion: nil)

        

        
            XCDYouTubeClient.default().getVideoWithIdentifier("fzOBRSvmSC8") { (video: XCDYouTubeVideo?, error: Error?) in
                if let streamURL = video?.streamURLs[XCDYouTubeVideoQuality.medium360.rawValue] {
                    playerViewController.player = AVPlayer(url: streamURL)
                } else {
                    self.dismiss(animated: true, completion: nil)
                }
            }
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
