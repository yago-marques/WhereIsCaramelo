//
//  StageMapExplorerView.swift
//  Where's Caramelo
//
//  Created by Yago Marques on 30/03/23.
//

import SwiftUI

struct StageMapExplorerView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var viewModel: StageMapExplorerViewModel
    let mapName: String
    let cityPresentation: FPCityPresentationModel

    var body: some View {
        ZStack(alignment: .top) {
            FPMapContainerLoader(mapName: mapName) {
                Task {
                    do {
                        try await viewModel.markTaskAsDone(cityName: cityPresentation.name)
                        self.viewModel.showSuccessPopup()
                    } catch {
                        print("Error")
                    }
                }
            }
            .ignoresSafeArea()

            HStack {
                Image("backToMenu")
                    .onTapGesture {
                        self.presentationMode.wrappedValue.dismiss()
                    }

                HStack {
                    Image("carameloStatus")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 0))
                    Text("\(cityPresentation.completedStages) / \(cityPresentation.allStages)")
                        .foregroundColor(Color("systemBackground"))
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 20))
                }
                .background {
                    RoundedRectangle(cornerRadius: 30)
                }


            }
            .frame(height: deviceWidth(multiplier: 0.15))

            PopupView(allFounded: $viewModel.popup.success, popupError: $viewModel.popup.error) {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
        .navigationBarBackButtonHidden()
    }
}

