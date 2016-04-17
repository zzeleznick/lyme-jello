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

private var exampleDescription: String {
    return NSLocalizedString("Your description goes here.", comment: "")
}

public var ReactionTask: ORKOrderedTask {
    print("Yooo from Reaction")
    let successSoundURL = NSBundle.mainBundle().URLForResource("blip", withExtension: "mp3")!
    let successSound = SystemSound(soundURL: successSoundURL)!
    let failureSound =  UInt32(kSystemSoundID_Vibrate)
    return ORKOrderedTask.reactionTimeTaskWithIdentifier("ActiveTask", intendedUseDescription: exampleDescription, maximumStimulusInterval: 8, minimumStimulusInterval: 4, thresholdAcceleration: 0.5, numberOfAttempts: 1, timeout: 5, successSound: successSound.soundID, timeoutSound: 0, failureSound: failureSound, options: [])
}