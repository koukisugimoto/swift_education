//
//  Clap.swift
//  ClapBeat
//
//  Created by 椙本洸希 on 2022/11/12.
//

import UIKit
import AudioToolbox

class Clap: NSObject {
    var soundURL = NSURL()
    var soundID = SystemSoundID()
    
    override init() {
        super.init()
        self.setSound()
    }
    
    func setSound() {
        let mainBundle = CFBundleGetMainBundle()
        soundURL = CFBundleCopyResourceURL(mainBundle, "clap" as CFString?, "wav" as CFString?, nil)
        AudioServicesCreateSystemSoundID(soundURL, &soundID)
    }
    
    func play() {
        AudioServicesPlaySystemSound(soundID)
    }
    
    func repeatClap(count: Int) {
        var i = 0
        while(i < count) {
            self.play()
            i = i + 1
            usleep(500000)
        }
    }

}
