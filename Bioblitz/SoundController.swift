//
//  SoundController.swift
//  Bioblitz
//
//  Created by Samuel Dalafiari on 05/02/2023.
//

import AVFoundation

class SoundController {
    
    private var backgroundMusicPlayer: AVAudioPlayer?
    private var successPlayer: AVAudioPlayer?
    private var buttonTapPlayer: AVAudioPlayer?
    
    
    func playGameSound() {
        backgroundMusicPlayer?.stop()
        let url = Bundle.main.url(forResource: "epic_battle_music", withExtension: "mp3")
        backgroundMusicPlayer = try! AVAudioPlayer(contentsOf: url!)
        backgroundMusicPlayer?.numberOfLoops = -1
        backgroundMusicPlayer?.volume = 0.3
        backgroundMusicPlayer?.play()
    }
    
    func playSuccessSound() {
        backgroundMusicPlayer?.stop()
        successPlayer?.stop()
        let url = Bundle.main.url(forResource: "success_fanfare_trumpets", withExtension: "mp3")
        successPlayer = try! AVAudioPlayer(contentsOf: url!)
        successPlayer?.play()
    }
    
    func playButtonTapSound() {
        buttonTapPlayer?.stop()
        let url = Bundle.main.url(forResource: "button_tap", withExtension: "mp3")
        buttonTapPlayer = try! AVAudioPlayer(contentsOf: url!)
        buttonTapPlayer?.play()
    }
}
