//
//  LottieView.swift
//  Where's Caramelo
//
//  Created by Davi Capistrano on 04/04/23.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    let name: String

    func makeUIView(context: Context) -> Lottie.LottieAnimationView {
        let animationView = LottieAnimationView(name: name)
        animationView.loopMode = .loop
        animationView.contentMode = .scaleAspectFit
        animationView.play()
        return animationView
    }

    func updateUIView(_ uiView: Lottie.LottieAnimationView, context: Context) { }
}
