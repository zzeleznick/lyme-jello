//
//  ReactionTask.swift
//  LymeHack
//
//  Created by Zach Zeleznick on 4/16/16.
//  Copyright © 2016 zzeleznick. All rights reserved.
//

import ResearchKit
import AudioToolbox

/**
 Wraps a SystemSoundID.
 
 A class is used in order to provide appropriate cleanup when the sound is
 no longer needed.
 */
class SystemSound {
    var soundID: SystemSoundID = 0
    
    init?(soundURL: NSURL) {
        if AudioServicesCreateSystemSoundID(soundURL as CFURLRef, &soundID) != noErr {
            return nil
        }
    }
    
    deinit {
        AudioServicesDisposeSystemSoundID(soundID)
    }
}

public var ReactionTask: ORKOrderedTask {
    print("Yooo from Reaction")
    let successSoundURL = NSBundle.mainBundle().URLForResource("tap", withExtension: "aif")!
    let successSound = SystemSound(soundURL: successSoundURL)!
    return ORKOrderedTask.reactionTimeTaskWithIdentifier("ReactionTask", intendedUseDescription: nil, maximumStimulusInterval: 6, minimumStimulusInterval: 2, thresholdAcceleration: 0.5, numberOfAttempts: 3, timeout: 3, successSound: successSound.soundID, timeoutSound: 0, failureSound: UInt32(kSystemSoundID_Vibrate), options: [])
}