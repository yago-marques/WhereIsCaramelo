//
//  ContentView.swift
//  Where's Caramelo
//
//  Created by Yago Marques on 27/03/23.
//

import SwiftUI

struct FinderPuzzleCityViewModel: Identifiable {
    let id = UUID()
    let image: String
    let allStages: Int
    let completedStages: Int
    let isActive: Bool
}

struct FinderPuzzleView: View {
    @State private var stages: [FinderPuzzleCityViewModel] = [
        .init(
            image: "fortaleza",
            allStages: 9,
            completedStages: 3,
            isActive: true
        ),

        .init(
            image: "brasilia",
            allStages: 0,
            completedStages: 0,
            isActive: false
        ),

        .init(
            image: "rioDeJaneiro",
            allStages: 0,
            completedStages: 0,
            isActive: false
        )
    ]

    var body: some View {
        NavigationView {
            VStack {
                Image("FinderPuzzleLogo")

                List($stages, id: \.id) { item in
                    FinderPuzzleCity(viewModel: item)
                }
                .listStyle(.plain)
            }
            .padding(
                EdgeInsets(
                    top: 50,
                    leading: 0,
                    bottom: 0,
                    trailing: 0
                )
            )
        }
    }
}

struct FinderPuzzleView_Previews: PreviewProvider {
    static var previews: some View {
        FinderPuzzleView()
    }
}
