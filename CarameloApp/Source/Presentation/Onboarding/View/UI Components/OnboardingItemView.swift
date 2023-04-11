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
                LottieView(name: item.lottiefile)
                    .frame(width: 150, height: 150)

                VStack {
                    Text(item.title)
                        .font(.system(size: 40, weight: .semibold))
                        .animation(Animation.interpolatingSpring(stiffness: 40, damping: 8))

                    Text(item.subtitle)
                        .font(.system(size: 25, weight: .regular))
                        .animation(Animation.interpolatingSpring(stiffness: 40, damping: 8))
                }
                .padding(.horizontal)
            }
            .foregroundColor(.white)
        }
    }
}
