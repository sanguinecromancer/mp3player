
//
//  ViewController.swift
//  MP3Player
//
//  Created by Zeynep Aykal on 04/04/16.
//  Copyright © 2016 Zeynep Aykal. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer = AVAudioPlayer()
    var isPlaying = true

    @IBOutlet weak var toolBar: UIToolbar!
    
    @IBAction func scrubSlider(sender: AnyObject) {
        player.currentTime = NSTimeInterval(scrubSlider.value)
    }
    @IBOutlet weak var scrubSlider: UISlider!
    @IBOutlet weak var play: UIBarButtonItem!
    @IBOutlet weak var pause: UIBarButtonItem!
    @IBAction func adjustVolume(sender: AnyObject) {
        player.volume = slider.value
    
    }

    @IBOutlet weak var slider: UISlider!

    @IBAction func play(sender: AnyObject) {
        if isPlaying == false
        {
   let audioPath = NSBundle.mainBundle().pathForResource("IraIncensus", ofType: "mp3")!
            do {
                try  player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath))
                scrubSlider.maximumValue = Float(player.duration)
                player.play()
            }
            catch
            {
                print(error)
            }
        }
        else
        {
            player.play()
        }
   }

    
    @IBAction func pause(sender: AnyObject) {
        player.pause()
        isPlaying = true
    }
    @IBAction func stop(sender: AnyObject) {
        player.stop()
        isPlaying = false
    }
    
    func updateScrubSlider()
    {
    scrubSlider.value = Float(player.currentTime)
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    let audioPath = NSBundle.mainBundle().pathForResource("IraIncensus", ofType: "mp3")!
        
        do {
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("IraIncensus", ofType: "mp3")!))
            scrubSlider.maximumValue = Float(player.duration)
        }
            
        catch
        {
        print(error)
        }
         player.play()
        isPlaying = true
        _ = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: ("updateScrubSlider"), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

