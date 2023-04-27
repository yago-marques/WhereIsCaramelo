//
//  OnboardingItemView.swift
//  CarameloApp
//
//  Created by Yago Marques on 11/04/23.
//

import SwiftUI

struct ItemView: View {
    var item: OnboardingModel

    var body: some View {
        ZStack {
            item.backgroundColor
                .ignoresSafeArea(.all, edges: .all)

            VStack {
                if let lottie = item.lottiefile {
                    LottieView(name: lottie)
                        .frame(width: 150, height: 150)
                } else if let image = item.image {
                    Image(image)
                        .resizable()
                        .frame(width: 200, height: 200)
                }

                VStack {
                    Text(item.title)
                        .font(.system(size: 40, weight: .semibold))
                        .animation(Animation.interpolatingSpring(stiffness: 40, damping: 8))
                        .multilineTextAlignment(.center)

                    Text(item.subtitle)
                        .font(.system(size: 25, weight: .regular))
                        .animation(Animation.interpolatingSpring(stiffness: 40, damping: 8))
                        .multilineTextAlignment(.center)
                }
                .padding(.horizontal)
            }
            .foregroundColor(.white)
        }
    }
}

