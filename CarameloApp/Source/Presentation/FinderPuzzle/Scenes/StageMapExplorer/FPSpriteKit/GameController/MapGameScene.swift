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
            if camera!.xScale + scale < 3 {
                if scale <= temp {
                    camera?.setScale(camera!.xScale + (camera!.xScale * 0.025))
                    configureCameraFinch()
                } else {
                    camera?.setScale(camera!.xScale - (camera!.xScale * 0.025))
                }
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

        setupCamera()
    }

    override func didMove(to view: SKView) {
        super.didMove(to: view)

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

    func setupCamera(heightMultiplier: Double = 0.22, widthMultiplier: Double = 1) {
        guard let player else { return }
        let distance = SKRange(constantValue: 0)
        let playerConstraint = SKConstraint.distance(distance, to: player)

        let xRange = SKRange(
            lowerLimit: (-(size.width))*widthMultiplier,
            upperLimit: (size.width)*widthMultiplier
        )

        let yRange = SKRange(
            lowerLimit: (-(size.height) + (size.height*heightMultiplier)),
            upperLimit: (size.height - (size.height*heightMultiplier))
        )

        let positionX = SKConstraint.positionX(xRange)
        let positionY = SKConstraint.positionY(yRange)

        camera?.constraints = [playerConstraint, positionX, positionY]
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {touchDown(at: touch.location(in: self))}
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        stopCam()
    }

    func configureCameraFinch(landscape: Bool = false) {
        if landscape {
            guard let player else { return }
            let distance = SKRange(constantValue: 0)
            let playerConstraint = SKConstraint.distance(distance, to: player)

            camera?.constraints = [playerConstraint]
        } else {
            let scale = camera!.xScale
            let widthScale = scale < 1.95 ? scale < 1.75 ? scale*0.55 : scale*0.45 : scale*0.35
            if scale > 1.3 {
                setupCamera(heightMultiplier: scale*0.35, widthMultiplier: widthScale)
            } else {
                setupCamera(heightMultiplier: 0.19, widthMultiplier: 1.05)
            }
        }
    }
}
