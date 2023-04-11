//
//  FPMapContainerLoader.swift
//  CarameloApp
//
//  Created by Yago Marques on 31/03/23.
//

import SwiftUI
import SpriteKit
import GameplayKit

struct FPMapContainerLoader: UIViewRepresentable {
    typealias UIViewType = UIView
    private let mapName: String
    private let action: () -> Void

    class Coordinator: NSObject {
        private var scene: MapGameScene?
        private let view = SKView()
        private let action: () -> Void

        init(scene: MapGameScene? = nil, action: @escaping () -> Void) {
            self.scene = scene
            self.action = action
        }

        func makeView(sceneName: String) -> SKView {
            let zoomGesture = UIPinchGestureRecognizer(target: self, action: #selector(Coordinator.zoomPinch))
            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(Coordinator.moveScreen))

            view.addGestureRecognizer(zoomGesture)
            view.addGestureRecognizer(panGesture)

            if let scene = GKScene(fileNamed: sceneName) {
                // Get the SKScene from the loaded GKScene
                if let sceneNode = scene.rootNode as? MapGameScene {

                    // Copy gameplay related content over to the scene
                    self.scene = sceneNode
                    self.scene?.presentAlert = { self.action() }

                    // Set the scale mode to scale to fit the window
                    sceneNode.scaleMode = .aspectFill

                    // Present the scene
                    view.presentScene(sceneNode)
                    view.ignoresSiblingOrder = false
                }
            }

            return view
        }

        @objc func zoomPinch(_ sender: UIPinchGestureRecognizer) {
            let scale = sender.scale
            scene?.scale = scale
        }

        @objc func moveScreen(_ sender: UIPanGestureRecognizer) {
            let vel = sender.velocity(in: self.view)
            let factor: CGFloat = 1.5
            let newVel = CGVector(dx: (-vel.x)*scene!.camera!.xScale*factor, dy: (vel.y)*scene!.camera!.yScale*factor)
            scene?.player?.addVelocity(newVel)

            if sender.state == .ended {
                scene?.player?.stop()
            }
        }

    }

    init(mapName: String, action: @escaping () -> Void) {
        self.mapName = mapName
        self.action = action
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(action: action)
    }

    func makeUIView(context: Context) -> UIView {
        return context.coordinator.makeView(sceneName: mapName)
    }

    func updateUIView(_ uiView: UIView, context: Context) { }

}
