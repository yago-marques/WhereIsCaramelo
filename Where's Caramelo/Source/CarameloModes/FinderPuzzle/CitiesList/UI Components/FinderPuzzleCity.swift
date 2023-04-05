//
//  FinderPuzzleCity.swift
//  Where's Caramelo
//
//  Created by Yago Marques on 27/03/23.
//

import SwiftUI

struct FinderPuzzleCity: View {
    @Binding var viewModel: FinderPuzzleCityViewModel

    private var centerImage: String {
        viewModel.isActive ? "unlocked" : "locked"
    }

    private var blurRatio: CGFloat {
        viewModel.isActive ? 0 : 1.5
    }

    var body: some View {

        ZStack {
            Image(viewModel.image)
                .resizable()
                .frame(height: deviceWidth(multiplier: 0.4))
                .cornerRadius(15)
                .blur(radius: blurRatio)
            VStack {
                HStack {
                    Spacer()
                    HStack(alignment: .center) {
                        Image("carameloStatus")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("\(viewModel.completedStages) / \(viewModel.allStages)")
                            .fontWeight(.bold)
                            .font(.headline)
                    }
                    .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                    .background {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(Color("systemBackground"))
                            .opacity(0.3)
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15))
                Spacer()
            }
            .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))

            Image(centerImage)
        }
        .padding(EdgeInsets(top: 7, leading: 0, bottom: 7, trailing: 0))
        .shadow(color: .secondary.opacity(0.2), radius: 5, x: 0, y: 10)
        .listRowSeparator(.hidden)

    }
}

extension View {
    func deviceWidth(multiplier: Double = 1) -> Double {
        UIScreen.main.bounds.width * multiplier
    }

    func deviceHeight(multiplier: Double = 1) -> Double {
        UIScreen().bounds.width * multiplier
    }
}
