//
//  PlaySound.swift
//  Slot Machine
//
//  Created by Zach Bentley on 8/1/23.
//

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
            print("ERROR: Could not find and play the sound file!")
        }
    }
}
