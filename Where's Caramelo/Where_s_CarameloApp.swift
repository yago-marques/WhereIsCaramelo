//
//  Where_s_CarameloApp.swift
//  Where's Caramelo
//
//  Created by Yago Marques on 27/03/23.
//

import SwiftUI

@main
struct Where_s_CarameloApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
