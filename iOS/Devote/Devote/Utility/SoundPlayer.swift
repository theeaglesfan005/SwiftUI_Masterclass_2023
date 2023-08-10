//
//  SoundPlayer.swift
//  Devote
//
//  Created by Zach Bentley on 7/26/23.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            try? AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try? AVAudioSession.sharedInstance().setActive(true)
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Could not find and play the sound file.")
        }
    }
}
