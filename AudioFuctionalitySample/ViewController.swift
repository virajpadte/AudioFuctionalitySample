//
//  ViewController.swift
//  AudioFuctionalitySample
//
//  Created by Viraj Padte on 1/28/17.
//  Copyright © 2017 Bit2Labz. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController{
 
    
    @IBOutlet weak var volSlider: UISlider!
    @IBOutlet weak var scrollSlider: UISlider!
    
    var player = AVAudioPlayer()
    
    //timer
    var timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        let audioPath = Bundle.main.path(forResource: "kashi", ofType: ".mp3")
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
        } catch  {
            
        }
        
        //set scroll max to song duration
        scrollSlider.maximumValue = Float(player.duration)
        //reset scroll position
        scrollSlider.value = 0
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func play(_ sender: Any) {
        player.play()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    
    }

    @IBAction func pause(_ sender: Any) {
        player.pause()
        timer.invalidate()
    }
    
    @IBAction func stop(_ sender: Any) {
        player.stop()
        player.currentTime = 0
        timer.invalidate()
    }
    @IBAction func slide(_ sender: Any) {
         player.volume = volSlider.value
    }
    
    func update(){
        //print(Float(player.currentTime))
        scrollSlider.value = Float(player.currentTime)
        if player.currentTime == player.duration{
            timer.invalidate()
        }
    }
    
    
}

