//
//  AVKitVerson.swift
//  iOSPlayer
//
//  Created by Michael Wen on 4/8/19.
//  Copyright © 2019 Yining Wen. All rights reserved.
//

import UIKit
import AVKit

class AvKitVersonController: UIViewController {
    
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

