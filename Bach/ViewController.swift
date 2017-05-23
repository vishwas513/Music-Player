//
//  ViewController.swift
//  Bach
//
//  Created by Vishwas Mukund on 5/21/17.
//  Copyright © 2017 Vishwas Mukund. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    var player = AVAudioPlayer()
    let audiopath = Bundle.main.path(forResource : "sheep", ofType : "mp3")
    var timer = Timer()

    
    var status = false
    func updateScrubber() {
        
        cue.value = Float(player.currentTime)
        
    }
    
    
    
    @IBOutlet weak var playbutton: UIBarButtonItem!
    @IBAction func RW(_ sender: Any) {
    player.currentTime = player.currentTime - TimeInterval(10)
    
    
    }
    @IBAction func FF(_ sender: Any) {
    
    player.currentTime = player.currentTime + TimeInterval(10)
    
    }
    @IBAction func play(_ sender: Any) {

        if status == false {
        
        
            do{ player.play()}
            catch{print(Error.self)}
            
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateScrubber), userInfo: nil, repeats: true)
            status = true
            
        
        
        }
        
        else if status == true {
        
        
        player.pause()
        timer.invalidate()
        status = false
        
        }
        
        
        
    
    
    }
    @IBOutlet weak var vol: UISlider!
    @IBAction func volchanged(_ sender: Any) {
    
        player.volume = vol.value
        
    }
    
    
    @IBOutlet weak var cue: UISlider!
    
    @IBAction func cueAction(_ sender: Any) {
    
    
        player.currentTime = TimeInterval(cue.value)
    
    }
    
    
   
    @IBOutlet weak var songname: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do {
            
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audiopath!))
            
            cue.maximumValue = Float(player.duration)
            
            
            
        } catch {
            
            // process error
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

