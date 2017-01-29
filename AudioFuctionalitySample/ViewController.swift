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

    @IBOutlet weak var slider: UISlider!
    
    var player = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let audioPath = Bundle.main.path(forResource: "kashi", ofType: ".mp3")
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
        } catch  {
            
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func play(_ sender: Any) {
        player.play()
        
    }

    @IBAction func pause(_ sender: Any) {
        player.pause()
    }
    
    @IBAction func stop(_ sender: Any) {
        player.stop()
        player.currentTime = 0
    }
    @IBAction func slide(_ sender: Any) {
         player.volume = slider.value
    }
    
    
}

