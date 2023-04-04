//
//  DomainMapper.swift
//  Where's Caramelo
//
//  Created by Yago Marques on 30/03/23.
//

import Foundation

struct FPCityMapper {
    static func toBusiness(_ city: FPRemoteCity) -> FPCityBusinessModel {
        .init(
            name: city.name,
            imageBackground: city.imageBackground,
            stages: city.stages.map{FPStageMapper.toBusiness($0)},
            isDone: city.isDone
        )
    }

    static func toRemote(_ city: FPCityBusinessModel) -> FPRemoteCity {
        .init(
            name: city.name,
            imageBackground: city.imageBackground,
            stages: city.stages.map{FPStageMapper.toRemote($0)},
            isDone: city.isDone
        )
    }

    static func toPresentation(_ city: FPCityBusinessModel) -> FPCityPresentationModel {
        let allStages = city.stages.count
        let completedStages = city.stages.filter {$0.isDone}.count
        let currentMap = city.stages.first(where: {!$0.isDone})?.map
        
        return .init(
            name: city.name,
            imageBackground: city.imageBackground,
            allStages: allStages,
            completedStages: completedStages,
            currentMap: currentMap,
            isDone: city.isDone,
            status: city.isDone ? .completed : .locked
        )
    }
}
