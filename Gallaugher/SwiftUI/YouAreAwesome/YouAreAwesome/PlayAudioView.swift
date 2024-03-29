//
//  PlayAudioView.swift
//  YouAreAwesome
//
//  Created by Theo Ntogiakos on 12/11/2023.
//

import SwiftUI
import AVFAudio

class PlayAudioViewModel: ObservableObject {
    @Published var audioPlayer: AVAudioPlayer!
    private var soundFileIndex = -1
    
    func play(clip name: String) {
        guard let audioClip = NSDataAsset(name: name) else {
            print("Coulnd't find \(name)")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(data: audioClip.data)
            audioPlayer.play()
        } catch {
            print("ERROR: \(error.localizedDescription)")
        }
    }
    
    func playRandom() {
        soundFileIndex = soundFileIndex.nonRepeatingRandom(in: 0...5)
        play(clip: "sound\(soundFileIndex)")
    }
}

struct PlayAudioView: View {
    @StateObject var vm = PlayAudioViewModel()
    @State private var mute = false
    
    let data = (0...5).map { "sound\($0)" }
    let columns = [
        GridItem(.adaptive(minimum: 180)),
        GridItem(.adaptive(minimum: 180))
    ]
    
    var body: some View {
        Spacer()

        LazyVGrid(columns: columns) {
            ForEach(data, id: \.self) { item in
                Button(item) {
                    if !mute {
                        vm.play(clip: item)
                    }
                }
                .buttonStyle(.bordered)
            }
        }
        
        Spacer()
        
        HStack {
            Text("Mute")
            Toggle("Mute", isOn: $mute)
                .labelsHidden()
                .onChange(of: mute) {
                    if vm.audioPlayer != nil && vm.audioPlayer.isPlaying {
                        vm.audioPlayer.stop()
                    }
                }
            Spacer()
            Button("Play Random") {
                if !mute {
                    vm.playRandom()
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

extension Int {
    func nonRepeatingRandom(in range: ClosedRange<Int>) -> Int {
        var randomNumber: Int
        
        repeat {
            randomNumber = Int.random(in: range)
        } while randomNumber == self
        
        return randomNumber
    }
}

#Preview {
    PlayAudioView()
}
