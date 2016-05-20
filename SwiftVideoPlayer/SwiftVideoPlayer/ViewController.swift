//
//  ViewController.swift
//  SwiftVideoPlayer
//
//  Created by Prashant on 08/11/15.
//  Copyright © 2015 PrashantKumar Mangukiya. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation


class ViewController: UIViewController, AVPlayerViewControllerDelegate {

    
    // url for playing video
    var videoUrl: NSURL!
    var kaltura = false
    
    
    // action - play local video
    @IBAction func playLocalVideo(sender: UIButton) {
        
        // create video url from local resource (i.e video stored within project folder)
        self.videoUrl = NSBundle.mainBundle().URLForResource("sample", withExtension: "mov")!
        
        // perform segue
        self.performSegueWithIdentifier("seguePlayVideo", sender: self)
    }

    // action - play remote video
    @IBAction func playRemoteVideo(sender: UIButton) {
        
        // create video url form remote location (i.e. video stored at domain etc.)
        self.videoUrl = NSURL(string: "http://cdnbakmi.kaltura.com/p/2085071/sp/208507100/raw/entry_id/1_v6l0ft1l/version/0")

        // perform segue
        self.kaltura = false
        self.performSegueWithIdentifier("seguePlayVideo", sender: self)
    }
    
    //action - Use Kaltura Video Player
    @IBAction func playRemoteKalturaVideo(sender: UIButton) {
        // create video url form remote location (i.e. video stored at domain etc.)
        self.videoUrl = NSURL(string: "http://cdnbakmi.kaltura.com/p/2085071/sp/208507100/raw/entry_id/1_v6l0ft1l/version/0")

        // perform segue
        self.kaltura = true
        self.performSegueWithIdentifier("seguePlayVideo", sender: self)
    }

    
    
    // MARK: - View functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    // MARK: - Navigation function

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if segue.identifier == "seguePlayVideo" {
            
            if self.kaltura {
                // set Player
                let kalturaPlayer = KPViewController(URL: self.videoUrl)
                kalturaPlayer.view.frame = UIScreen.mainScreen().bounds
                self.view.addSubview(kalturaPlayer.view)
                self.view.sendSubviewToBack(kalturaPlayer.view)
            }
            else {
                // get destination view controller
                let destVc = segue.destinationViewController as! AVPlayerViewController

                // set player
                destVc.player = AVPlayer(URL: self.videoUrl)
            }
        }
    }
}

