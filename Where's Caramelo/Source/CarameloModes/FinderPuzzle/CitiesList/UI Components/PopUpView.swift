//
//  PopUpView.swift
//  Where's Caramelo
//
//  Created by Mateus Calisto on 03/04/23.
//

import SwiftUI

struct popupView: View {
    @Binding var allFounded: Bool
    @Binding var popupError: Bool
    
    var body: some View {
        //      TROCAR CONDIÇÃO QUANDO TIVER A LÓGICA TES
        
        if allFounded {
            VisualEffectView(effect: UIBlurEffect(style: .extraLight))
                .edgesIgnoringSafeArea(.all)
                .opacity(0.7)
                .overlay {
                    popSuccess
                        .transition(.scale)
                }
        }
        if popupError {
            VisualEffectView(effect: UIBlurEffect(style: .extraLight))
                .edgesIgnoringSafeArea(.all)
                .opacity(0.7)
                .overlay {
                    popError
                        .transition(.scale)
                }
        }
    }
    
    var popSuccess: some View {
        VStack {
            VStack(alignment: .center) {
                Text("SCHLOPSCHLOPSCH!")
                    .foregroundColor(.black)
                    .font(.system(size: 23, weight: .bold, design: .rounded))
                    .padding(.top, 60)
                Text("You Found Me!")
                    .foregroundColor(.black)
                    .padding(.top, -10)
                    .font(.system(size: 23, weight: .light, design: .rounded))
            }
            Button(action: {
                withAnimation {
                    allFounded = false
                }
            }) {
                Text("Next Level")
                    .frame(width: 300, height: 50)
                    .background(Color(red: 214/255, green: 154/255, blue: 58/255))
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .bold, design: .rounded))
            }.offset(y: 8)
        }
        .frame(width: 270, height: 200)
        .background {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color(.white))
                .foregroundColor(.black)
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .frame(width: 300)
        .shadow(color: .gray, radius: 2, x: 0, y: 2)
        .overlay(alignment: .top) {
            Image("DOG")
                .resizable()
                .frame(width: 250, height: 250)
                .offset(y: -180)
            //            .alignmentGuide(.top) { $0[VerticalAlignment.center] }
        }
    }
    
    
    var popError: some View {
        VStack {
            VStack(alignment: .center) {
                Text("SCHLOPSCHLOPSCH!")
                    .font(.system(size: 23, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                    .padding(.top, 60)
                Text("Try again Caramelito.")
                    .foregroundColor(.black)
                    .padding(.top, -10)
                    .font(.system(size: 23, weight: .light, design: .rounded))
            }
            Button(action: {
                withAnimation {
                    popupError = false
                }
            }) {
                Text("Next Level")
                    .frame(width: 300, height: 50)
                    .background(Color(.white))
                    .foregroundColor(Color(hue: 1.0, saturation: 0.165, brightness: 0.901))
                    .font(.system(size: 30, weight: .bold, design: .rounded))
            }.offset(y: 8)
        }
        .frame(width: 270, height: 200)
        .background {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color(.red))
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .frame(width: 300)
        .shadow(color: .gray, radius: 2, x: 0, y: 2)
        .overlay(alignment: .top) {
            Image("DOG")
                .resizable()
                .frame(width: 250, height: 250)
                .offset(y: -180)
            //            .alignmentGuide(.top) { $0[VerticalAlignment.center] }
        }
    }
    
    struct VisualEffectView: UIViewRepresentable {
        var effect: UIVisualEffect?
        func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
        func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
    }
}

