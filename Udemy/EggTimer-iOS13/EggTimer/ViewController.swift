//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let timings: [String:Int] = ["Soft":5, "Medium":7, "Hard":12]
    var player: AVAudioPlayer?
    var timer: Timer?
    var secondsPassed = 0
    var totalTime = 0

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!

    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!

        secondsPassed = 0
        timer?.invalidate()
        progressBar.progress = 0.0
        titleLabel.text = hardness

        if let hardnessSetting = timings[hardness] {
            totalTime = hardnessSetting
            setTimer()
        }
    }

    func setTimer() {
        timer = Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(fireTimer),
            userInfo: nil,
            repeats: true)
    }

    @objc func fireTimer() {
        progressBar.progress = Float(secondsPassed) / Float(totalTime)

        if secondsPassed >= totalTime {
            timer?.invalidate()
            playAlarm()
            titleLabel.text = "Done!"
        }
        secondsPassed += 1
    }

    func playAlarm() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            guard let player = player else { return }
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
