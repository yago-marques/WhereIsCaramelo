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
    var dogTouched = false

    var player: FinderPuzzlePlayer?
    var temp: CGFloat = 0
    var scale: CGFloat = 0 {
        didSet {
            if camera!.xScale + scale < 9, scale < temp {
                camera?.setScale(camera!.xScale + (camera!.xScale * 0.025))
            } else if scale > temp {
                camera?.setScale(camera!.xScale - (camera!.xScale * 0.025))
            }

            temp = scale
        }
    }
    private var peopleMap: SKTileMapNode?
    private var dogMap: SKTileMapNode?

    override func sceneDidLoad() {
        player = childNode(withName: "Player") as? FinderPuzzlePlayer
        peopleMap = childNode(withName: "peopleMap") as? SKTileMapNode
        dogMap = childNode(withName: "dogArea") as? SKTileMapNode

        setupCamera()
    }

    override func didMove(to view: SKView) {
        super.didMove(to: view)

        peopleMap?.setupEdgeLoop()
        dogMap?.setupMapPhysics()
    }

    func stopCam() {
        player?.stop()
    }

    func touchDown(at pos: CGPoint, negationTouch: Bool = false) {
        let nodeAtPoint = atPoint(pos)
        if let map = nodeAtPoint as? SKTileMapNode {
            if map.name! == "dogArea" {
                let column = map.tileColumnIndex(fromPosition: pos)
                let row = map.tileRowIndex(fromPosition: pos)
                let tile = map.tileDefinition(atColumn: column, row: row)

                if tile?.userData?.value(forKey: "isDog") != nil {
                    let generator = UINotificationFeedbackGenerator()
                    generator.notificationOccurred(.error)
                    dogTouched = true
                    presentAlert()
                } else if !dogTouched, negationTouch {
                    let generator = UIImpactFeedbackGenerator(style: .rigid)
                    generator.impactOccurred()
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
