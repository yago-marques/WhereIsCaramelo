//
//  OnBoardingView.swift
//  Where's Caramelo
//
//  Created by Davi Capistrano on 29/03/23.
//
import SwiftUI

struct OnBoardingView: View {
    @StateObject var viewModel: OnboardingViewModel
    var screenWidth = UIScreen.main.bounds.width
    @State var xOffset: CGFloat = 0
    @State var currentPage = 0
    var firstPage = 0
    @Namespace var namespace

    var body: some View{
        NavigationStack {
            ZStack {
                GeometryReader { reader in
                    HStack(spacing: 0) {
                        ForEach(viewModel.onboardingItens) { item in
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
                            ForEach(0..<viewModel.onboardingItens.count + 1, id: \.self) { i in
                                Circle()
                                    .frame(width: 6, height: 6)
                            }
                        }
                        .foregroundColor(.white)
                        HStack(spacing: 6){
                            ForEach(0..<viewModel.onboardingItens.count, id: \.self) { i in
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
                            if currentPage != viewModel.lastPage {
                                HStack {
                                    Button(action: {
                                        currentPage = viewModel.lastPage
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
                                NavigationLink(destination: CitiesListComposer.make()) {
                                    Text("Vamos Começar")
                                        .foregroundColor(.black)
                                        .fontWeight(.semibold)
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 60)
                                        .background(Capsule().fill(Color.white))
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .navigate(to: CitiesListComposer.make(), when: $viewModel.toCities)
            .onAppear {
                Task {
                    try await viewModel.showOnboardingIfNeeded()
                }
            }
        }
    }
}


extension View {
    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
        NavigationView {
            ZStack {
                self
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                NavigationLink(
                    destination: view
                        .navigationBarTitle("")
                        .navigationBarHidden(true),
                    isActive: binding
                ) {
                    EmptyView()
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}
