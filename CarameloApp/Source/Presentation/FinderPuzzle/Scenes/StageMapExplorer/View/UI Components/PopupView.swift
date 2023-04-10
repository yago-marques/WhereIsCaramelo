//
//  PopUpView.swift
//  Where's Caramelo
//
//  Created by Mateus Calisto on 03/04/23.
//
import SwiftUI

struct PopupView: View {
    @Binding var allFounded: Bool
    @Binding var popupError: Bool
    let action: () -> Void

    var body: some View {
        //      TROCAR CONDIÇÃO QUANDO TIVER A LÓGICA TES

        if allFounded {
            VisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial))
                .edgesIgnoringSafeArea(.all)
                .opacity(0.7)
                .overlay {
                    popSuccess
                        .transition(.scale)
                }
        }
        if popupError {
            VisualEffectView(effect: UIBlurEffect(style: .systemChromeMaterial))
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
                    .font(.system(size: 23, weight: .bold, design: .rounded))
                    .padding(.top, 60)
                Text("You Found Me!")
                    .padding(.top, -10)
                    .font(.system(size: 23, weight: .light, design: .rounded))
            }
            Button(action: {
                withAnimation {
                    allFounded = false
                    action()
                }
            }) {
                Text("Next Level")
                    .frame(width: 300, height: 50)
                    .background(Color(red: 214/255, green: 154/255, blue: 58/255))
                    .foregroundColor(Color("systemBackground"))
                    .font(.system(size: 30, weight: .bold, design: .rounded))
            }.offset(y: 8)
        }
        .frame(width: 270, height: 200)
        .background {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color("systemBackground"))
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .frame(width: 300)
        .shadow(color: .gray, radius: 2, x: 0, y: 2)
        .overlay(alignment: .top) {
            Image("carameloStatus")
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
                    .padding(.top, 60)
                Text("Try again Caramelito.")
                    .padding(.top, -10)
                    .font(.system(size: 23, weight: .light, design: .rounded))
            }.foregroundColor(.white)
            Button(action: {
                withAnimation {
                    popupError = false
                }
            }) {
                Text("Next Level")
                    .frame(width: 300, height: 50)
                    .background(Color(.white))
                    .foregroundColor(Color(red: 214/255, green: 154/255, blue: 58/255))
                    .font(.system(size: 30, weight: .bold, design: .rounded))
            }.offset(y: 8)
        }
        .frame(width: 270, height: 200)
        .background {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color(.red))
                .foregroundColor(.white)
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .frame(width: 300)
        .shadow(color: .gray, radius: 2, x: 0, y: 2)
        .overlay(alignment: .top) {
            Image("carameloStatus")
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
