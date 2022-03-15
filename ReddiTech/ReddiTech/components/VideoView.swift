//
//  VideoView.swift
//  ReddiTech
//
//  Created by Adison Pereira de oliveira on 08/03/2022.
//

import SwiftUI
import AVKit

struct VideoView: View {
    var videoURL : String
    @State private var player : AVPlayer?
    
    var body: some View {
        VideoPlayer(player: player)
            .onAppear() {
                // Start the player going, otherwise controls don't appear
                guard let url = URL(string: videoURL) else {
                    return
                }
                let player = AVPlayer(url: url)
                self.player = player
                player.play()
            }
            .onDisappear() {
                // Stop the player when the view disappears
                player?.pause()
            }
    }
}

