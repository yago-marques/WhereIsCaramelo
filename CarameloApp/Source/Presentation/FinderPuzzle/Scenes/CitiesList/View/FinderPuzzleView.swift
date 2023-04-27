//
//  ContentView.swift
//  Where's Caramelo
//
//  Created by Yago Marques on 27/03/23.
//

import SwiftUI

struct FinderPuzzleView: View {
    @StateObject var viewModel: FinderPuzzleViewModel

    var body: some View {
        VStack {
            Image("FinderPuzzleLogo")

            List($viewModel.cities, id: \.id) { item in
                if let map = item.currentMap.wrappedValue, item.wrappedValue.status == .unlocked {
                    NavigationLink(destination: StageMapExplorerComposer.make(
                        city: item.wrappedValue,
                        mapName: map
                    )) {
                        FinderPuzzleCity(presentatioModel: item)
                    }
                } else {
                    FinderPuzzleCity(presentatioModel: item)
                }

            }
            .listStyle(.plain)

            if viewModel.allCitiesCompleted() {
                VStack {
                    Text("Essa foi uma demonstração do nosso game loop, compartilhe a sua experiência respondendo a nossa pesquisa, para futuras melhorias e criação de fases e cidades")
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 10)

                    Button(action: {
                        if let url = URL(string: "https://forms.gle/XTcg5NF5yw7csP8H7") {
                           UIApplication.shared.open(url)
                        }
                    }) {
                        Text("Responder pesquisa anônima")
                    }
                    .padding(.bottom, 50)
                }
            }
        }
        .padding(
            EdgeInsets(
                top: 35,
                leading: 0,
                bottom: 0,
                trailing: 0
            )
        )
        .onAppear {
            Task {
                try await self.viewModel.buildLayout()
            }
        }
        .navigationBarBackButtonHidden()
    }
}
