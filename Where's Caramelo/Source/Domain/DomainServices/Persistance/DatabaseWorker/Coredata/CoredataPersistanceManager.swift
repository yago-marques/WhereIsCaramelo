//
//  CoredataPersistanceManager.swift
//  Where's Caramelo
//
//  Created by Yago Marques on 29/03/23.
//

import Foundation
import CoreData

final class CoredataPersistanceManager {
    let persistentContainer: NSPersistentContainer

    init(
        persistentContainer: NSPersistentContainer = PersistenceController.shared.container
    ) {
        self.persistentContainer = persistentContainer
    }
}

extension CoredataPersistanceManager: FinderPuzzleDatabase {
    func createCity(_ city: FPRemoteCity) async throws {
        let context = persistentContainer.viewContext
        let dataEntity = FPCityEntity(context: context)
        dataEntity.name = city.name
        dataEntity.imageBackground = city.imageBackground
        dataEntity.stages = try JSONEncoder().encode(city.stages)
        dataEntity.isDone = city.isDone

        try context.save()
    }

    func updateCity(_ city: FPRemoteCity) async throws {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<FPCityEntity>(entityName: "FPCityEntity")
        guard let coredataEntity = try context.fetch(fetchRequest).first(where: {$0.name == city.name}) else { return }

        coredataEntity.name = city.name
        coredataEntity.imageBackground = city.imageBackground
        coredataEntity.stages = try JSONEncoder().encode(city.stages)
        coredataEntity.isDone = city.isDone

        try context.save()
    }

    func readCities() async throws -> [FPRemoteCity] {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<FPCityEntity>(entityName: "FPCityEntity")
        let coredataEntities = try context.fetch(fetchRequest)
        let remoteModels: [FPRemoteCity] = try coredataEntities.map { entity in
            return .init(
                name: entity.name ?? "empty",
                imageBackground: entity.imageBackground ?? "empty",
                stages: try JSONDecoder().decode([FPRemoteStage].self, from: entity.stages ?? Data()),
                isDone: entity.isDone
            )
        }

        return remoteModels
    }
}

extension CoredataPersistanceManager: UserAccessManager {
    func isFirstAccess() async throws -> Bool {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<FirstAccessEntity>(entityName: "FirstAccessEntity")
        fetchRequest.fetchLimit = 1
        guard let coredataEntity = try context.fetch(fetchRequest).first else { return true }

        return !coredataEntity.accessed
    }

    func registerFirstAccess() async throws {
        let context = persistentContainer.viewContext
        let dataEntity = FirstAccessEntity(context: context)
        dataEntity.accessed = true

        try context.save()
    }
}
