//
//  ViewController.swift
//  iOSPlayer
//
//  Created by Michael Wen on 4/8/19.
//  Copyright © 2019 Yining Wen. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
    
    var playerController = AVPlayerViewController()
    var player:AVPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let videoString:String? = Bundle.main.path(forResource: "testmv", ofType: "mp4")
        
        if let url = videoString{
            let videoURL = NSURL(fileURLWithPath: url)
            self.player = AVPlayer(url:videoURL as URL)
            self.playerController.player = self.player
            
        }
    }

    @IBAction func PlayVideo(_ sender: Any) {
        self.present(self.playerController, animated: true, completion: {
            self.playerController.player?.play()
        })
    }
    
}

//class AVKitVersonController: UIViewController {
//    
//    @IBAction func play(_ sender: Any) {
//        if let path = Bundle.main.path(forResource: "testmv", ofType: "mp4")
//        {
//            let video = AVPlayer(url: URL(fileURLWithPath: path))
//            let videoPlayer = AVPlayerViewController()
//            videoPlayer.player = video
//            
//            present(videoPlayer, animated: true, completion:{
//                video.play()
//            })
//        }
//    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view
//        
//    }
//}



////supporting iTunes file sharing video with playvideoviewcontroller
//extension UIViewController {
//
//    func showInformationAlert(title: String, message: String) {
//        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        let okAction = UIAlertAction(title: "Ok", style: .default, handler:{ (action:UIAlertAction) -> Void in
//        })
//        alertView.addAction(okAction)
//        present(alertView, animated: true, completion: nil)
//    }
//
//    func showVideo(url: URL) {
//
//        if #available(iOS 9, *) {
//            // Use AVPlayer​View​Controller
//            let playerItem = AVPlayerItem(url: url)
//            let player = AVPlayer(playerItem: playerItem)
//            let playerViewController = AVPlayerViewController()
//            playerViewController.player = player
//            //NotificationCenter.default.addObserver(self, selector: #selector(finishedPlaying(notification:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
//            self.present(playerViewController, animated: true) {
//                playerViewController.player!.play()
//            }
//
//        } else {
//            // Use MPMoviePlayerViewController
//            let moviePlayerViewController = MPMoviePlayerViewController(contentURL: url)
//            //NotificationCenter.default.addObserver(self, selector: #selector(playbackStateDidChange(notification:)), name: NSNotification.Name.MPMoviePlayerPlaybackStateDidChange, object: moviePlayerViewController?.moviePlayer)
//            self.presentMoviePlayerViewControllerAnimated(moviePlayerViewController)
//        }
//    }
//
//    func finishedPlaying(notification: NSNotification) {
//        print("video ended")
//    }
//
//    //    func playbackStateDidChange(notification:NSNotification) {
//    //        let moviePlayer = notification.object as! MPMoviePlayerController
//    //        switch moviePlayer.playbackState {
//    //        case .stopped:
//    //            print("video stopped")
//    //            break
//    //        case .playing:
//    //            print("video playing")
//    //            break
//    //        case .paused:
//    //            print("video paused")
//    //            break
//    //        case .interrupted:
//    //            print("video interrupted")
//    //            break
//    //        default:
//    //            break
//    //        }
//    //    }
//}
