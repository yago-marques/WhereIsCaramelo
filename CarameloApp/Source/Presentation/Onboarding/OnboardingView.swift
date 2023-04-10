//
//  OnBoardingView.swift
//  Where's Caramelo
//
//  Created by Davi Capistrano on 29/03/23.
//
import SwiftUI

struct OnBoardingView: View {

    var screenWidth = UIScreen.main.bounds.width
    @State var xOffset: CGFloat = 0
    @State var currentPage = 0
    var lastPage = itemData.count - 1
    var firstPage = 0
    @Namespace var namespace

    var body: some View{
        ZStack {
            GeometryReader { reader in
                HStack(spacing: 0) {
                    ForEach(itemData) { item in
                        ItemView(item: item)
                            .frame(width: screenWidth)
                    }
                }

                .offset(x: xOffset)
            }

            VStack(spacing: 20){
                Spacer()
                ZStack {
                    HStack(spacing: 6){
                        ForEach(0..<itemData.count + 1, id: \.self) { i in
                            Circle()
                                .frame(width: 6, height: 6)
                        }
                    }
                    .foregroundColor(.white)
                    HStack(spacing: 6){
                        ForEach(0..<itemData.count, id: \.self) { i in
                            if i == currentPage {
                                withAnimation {
                                    Capsule()
                                        .matchedGeometryEffect(id: "page", in: namespace)
                                        .frame(width: 18, height: 6)
                                }
                            } else {
                                Circle()
                                    .frame(width: 6, height: 6)
                            }
                        }
                        .foregroundColor(.white)
                    }
                    ZStack {
                        if currentPage != lastPage {
                            HStack {
                                Button(action: {
                                    currentPage = lastPage
                                    withAnimation{xOffset = -screenWidth * CGFloat(currentPage)}
                                }, label: {
                                    Text("Pular")
                                        .frame(maxWidth: .infinity)
                                })
                                Spacer()

                                Button(action: {
                                    currentPage += 1
                                    withAnimation{xOffset = -screenWidth * CGFloat(currentPage)}
                                }, label: {
                                    HStack{
                                        Text("Avançar")
                                        Image(systemName: "arrow.right")
                                    }
                                    .font(.system(size: 17, weight: .bold))
                                    .frame(maxWidth: .infinity)
                                })
                            }
                            .frame(height: 60)
                            .foregroundColor(.white)
                        } else {
                            Button(action: {}, label: {
                                Text("Vamos Começar")
                                    .foregroundColor(.black)
                                    .fontWeight(.semibold)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 60)
                                    .background(Capsule().fill(Color.white))
                            })
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}

struct ItemView: View {
    var item: OnboardingItem

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
