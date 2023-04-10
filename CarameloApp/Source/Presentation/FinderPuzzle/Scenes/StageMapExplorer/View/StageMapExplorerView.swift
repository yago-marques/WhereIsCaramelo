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
    let cityName: String

    var body: some View {
        ZStack {
            FPMapContainerLoader(mapName: mapName) {
                Task {
                    do {
                        try await viewModel.markTaskAsDone(cityName: cityName)
                        self.viewModel.showSuccessPopup()
                    } catch {
                        print("Error")
                    }
                }
            }
            .ignoresSafeArea()

            PopupView(allFounded: $viewModel.popup.success, popupError: $viewModel.popup.error) {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
        .navigationBarBackButtonHidden()
    }
}

