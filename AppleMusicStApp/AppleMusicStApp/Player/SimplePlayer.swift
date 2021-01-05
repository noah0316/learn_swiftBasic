//
//  SimplePlayer.swift
//  AppleMusicStApp
//
//  Created by joonwon lee on 2020/03/15.
//  Copyright © 2020 com.joonwon. All rights reserved.
//  Modified by Noah on 2021/01/05.
//


import AVFoundation

class SimplePlayer {
    // Singleton
    static let shared = SimplePlayer()
    
    private let player = AVPlayer()

    var currentTime: Double {
        // currentTime 구하기
        return player.currentItem?.currentTime().seconds ?? 0
    }
    
    var totalDurationTime: Double {
        // totalDurationTime 구하기
        return player.currentItem?.duration.seconds ?? 0
    }
    
    var isPlaying: Bool {
        // isPlaying 구하기
        return player.isPlaying
    }
    
    var currentItem: AVPlayerItem? {
        // currentItem 구하기
        return player.currentItem
    }
    
    init() { }
    
    func pause() {
        // pause구현
        player.pause()
    }
    
    func play() {
        // play구현
        player.play()
        
    }
    
    func seek(to time:CMTime) {
        // seek구현
        player.seek(to: time)
    }
    
    func replaceCurrentItem(with item: AVPlayerItem?) {
        // replace current item 구현
        player.replaceCurrentItem(with: item)
    }
    
    func addPeriodicTimeObserver(forInterval: CMTime, queue: DispatchQueue?, using: @escaping (CMTime) -> Void) {
        player.addPeriodicTimeObserver(forInterval: forInterval, queue: queue, using: using)
    }
}
