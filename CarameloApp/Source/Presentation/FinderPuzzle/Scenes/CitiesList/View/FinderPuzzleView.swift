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
        NavigationStack {
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
        }
    }
}
