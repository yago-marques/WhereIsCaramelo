//
//  MapGameScene.swift
//  Where's Caramelo
//
//  Created by Yago Marques on 30/03/23.
//

import SpriteKit
import GameplayKit

final class MapGameScene: SKScene {

    var presentAlert: (() -> Void) = { }

    var player: FinderPuzzlePlayer?
    var temp: CGFloat = 0
    var scale: CGFloat = 0 {
        didSet {
            if scale <= temp {
                camera?.setScale(camera!.xScale + (camera!.xScale * 0.025))
            } else {
                camera?.setScale(camera!.xScale - (camera!.xScale * 0.025))
            }

            temp = scale
        }
    }
    private var borderMap: SKTileMapNode?
    private var sceneMap: SKTileMapNode?

    override func sceneDidLoad() {
        player = childNode(withName: "Player") as? FinderPuzzlePlayer
        borderMap = childNode(withName: "floorMap") as? SKTileMapNode
        sceneMap = childNode(withName: "waterMap") as? SKTileMapNode
    }

    override func didMove(to view: SKView) {
        super.didMove(to: view)

        setupCamera()
        sceneMap?.setupEdgeLoop()
        borderMap?.setupMapPhysics()
    }

    func stopCam() {
        player?.stop()
    }

    func touchDown(at pos: CGPoint) {
        let nodeAtPoint = atPoint(pos)
        if let map = nodeAtPoint as? SKTileMapNode {
            if map.name! == "dogArea" {
                let column = map.tileColumnIndex(fromPosition: pos)
                let row = map.tileRowIndex(fromPosition: pos)
                let tile = map.tileDefinition(atColumn: column, row: row)

                if tile?.userData?.value(forKey: "isDog") != nil {
                    presentAlert()
                }
            }
        }
    }

    func setupCamera() {
        guard let player else { return }
        let distance = SKRange(constantValue: 0)
        let playerConstraint = SKConstraint.distance(distance, to: player)

        camera?.constraints = [playerConstraint]
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {touchDown(at: touch.location(in: self))}
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        stopCam()
    }
}
