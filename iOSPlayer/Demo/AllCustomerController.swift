//
//  AllCustomerController.swift
//  iOSPlayer
//
//  Created by Michael Wen on 4/13/19.
//  Copyright © 2019 Yining Wen. All rights reserved.
//

import UIKit
//import AVKit
import AVFoundation

class AllCustomerController: UIViewController {
    
//    var videotablecell:[HomeTableViewCell]
    var receivedtitle = ""
    var receivedinfo = ""
    
    @IBOutlet weak var videoView: UIView!
    var player: AVPlayer!
    var playerLayer: AVPlayerLayer!
    
    var isVideoPlaying = false   //why it will autoplay even it's false
    var isviewhide = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        let videoString:String? = Bundle.main.path(forResource: "testmv", ofType: "mp4")
        
//        let videoString:String? = Bundle.main.path(forResource: receivedtitle, ofType: receivedinfo)
        if let url = videoString{
            let videoURL = NSURL(fileURLWithPath: url)

            player = AVPlayer(url:videoURL as URL)
            player.currentItem?.addObserver(self, forKeyPath: "duration", options: [.new, .initial], context: nil)
            addTimeObserver()
            playerLayer = AVPlayerLayer(player: player)
            playerLayer.videoGravity = .resize
            videoView.layer.addSublayer(playerLayer)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        player.play() //change this to change if the video will autoplay
        topview.isHidden = true
        bottomview.isHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        playerLayer.frame = videoView.bounds
    }
    
    @IBOutlet weak var hidebottom: UIButton!
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var topview: UIView!
    @IBOutlet weak var bottomview: UIView!
    @IBAction func hidebottom(_ sender: UIButton) {
        
        if isviewhide{
            topview.isHidden = true
            bottomview.isHidden = true
        }
        else{
            topview.isHidden = false
            bottomview.isHidden = false
        }
        isviewhide = !isviewhide
    }
    
    
    @IBAction func playPressed(_ sender: UIButton) {
//        if isVideoPlaying{
//            player.pause()
//            sender.setTitle("Play", for: .normal)
//        }
//        else{
//            player.play()
//            sender.setTitle("Pause", for: .normal)
//        }
        if isVideoPlaying{
            player.play()
            sender.setImage(UIImage(named: "pause"),for: UIControl.State())
        }
        else{
            player.pause()
            sender.setImage(UIImage(named: "play"),for: UIControl.State())
        }
        isVideoPlaying = !isVideoPlaying
    }
    
    @IBAction func forwardPressed(_ sender: Any) {
        guard let duration = player.currentItem?.duration else{return}
        let currentTime = CMTimeGetSeconds(player.currentTime())
        let newTime = currentTime + 5.0
        
        if newTime < (CMTimeGetSeconds(duration) - 5.0){
            let time: CMTime = CMTimeMake(value: Int64(newTime*1000), timescale: 1000)
            player.seek(to: time)
        }
    }
    
    @IBAction func backwardPressed(_ sender: Any) {
        let currentTime = CMTimeGetSeconds(player.currentTime())
        var newTime = currentTime - 5.0
        
        if newTime < 0{
            newTime = 0
        }
        let time: CMTime = CMTimeMake(value: Int64(newTime*1000), timescale: 1000)
        player.seek(to: time)
    }
    
    @IBAction func back(_ sender: Any) {
        player.pause()
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        player.seek(to: CMTimeMake(value: Int64(sender.value*1000), timescale: 1000))
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "duration", let duration = player.currentItem?.duration.seconds, duration > 0.0{
            self.durationLabel.text = getTimeString(from: player.currentItem!.duration)
        }
    }
    func getTimeString(from time: CMTime) -> String{
        let totalSeconds = CMTimeGetSeconds(time)
        let hours = Int(totalSeconds/3600)
        let minutes = Int(totalSeconds/60) % 60
        let seconds = Int(totalSeconds.truncatingRemainder(dividingBy: 60))
        if hours > 0 {
            return String(format: "%i:%02i:%02i", arguments: [hours, minutes, seconds])
        }
        else{
            return String(format: "%02i:%02i", arguments: [minutes, seconds])
        }
        
    }
    
    func addTimeObserver(){
        let interval = CMTime(seconds: 0.5, preferredTimescale: CMTimeScale(NSEC_PER_SEC))
        let mainQueue = DispatchQueue.main
            _ = player.addPeriodicTimeObserver(forInterval: interval, queue: mainQueue, using: {[weak self] time in
            guard let currentItem = self?.player.currentItem else{return}
                self?.timeSlider.maximumValue = Float(currentItem.duration.seconds)
                self?.timeSlider.minimumValue = 0
                self?.currentTimeLabel.text = self?.getTimeString(from: currentItem.currentTime())
        })
    }
}
