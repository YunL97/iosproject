//
//  AudioPlayer.swift
//  Restart
//
//  Created by 이윤식 on 2021/11/30.
//

import Foundation
import AVFoundation //시간 기반 시청각 작업을 위한 모든 기능을 갖춘 프레임워크, 영화, 사운드파일을 쉽게 재생, 생성 및 편집하고 강력한 미디어 기능을 이프레임워크를 사용해서 이용가능

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String){
    if let path = Bundle.main.path(forResource: sound, ofType: type){
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Could not play the sound file")
        }
    }
}

