//
//  FinderPuzzlePlayer.swift
//  Where's Caramelo
//
//  Created by Yago Marques on 30/03/23.
//

import SpriteKit

class FinderPuzzlePlayer: SKSpriteNode {
    func addVelocity(_ vel: CGVector) {
        self.physicsBody?.velocity = vel
    }

    func stop() {
        self.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
    }
}
