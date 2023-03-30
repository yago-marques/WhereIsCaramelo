//
//  FPStageMapper.swift
//  Where's Caramelo
//
//  Created by Yago Marques on 30/03/23.
//

import Foundation

struct FPStageMapper {
    static func toBusiness(_ stage: FPRemoteStage) -> FPStageBusinessModel {
        .init(map: stage.map, isDone: stage.isDone)
    }

    static func toRemote(_ stage: FPStageBusinessModel) -> FPRemoteStage {
        .init(map: stage.map, isDone: stage.isDone)
    }
}
