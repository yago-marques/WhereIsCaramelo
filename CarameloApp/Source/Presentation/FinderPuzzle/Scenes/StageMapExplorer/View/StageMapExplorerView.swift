//
//  StageMapExplorerView.swift
//  Where's Caramelo
//
//  Created by Yago Marques on 30/03/23.
//

import SwiftUI
import SpriteKit
import GameplayKit

struct StageMapExplorerView: View {
    var body: some View {
        VStack {
            FPMapContainerLoader(mapName: "Teste")
        }
    }
}

struct FPMapContainerLoader: UIViewRepresentable {

    class Coordinator: NSObject {
        private var scene: MapGameScene?
        private let view = UIView()

        func makeView(sceneName: String) -> UIView {
            let zoomGesture = UIPinchGestureRecognizer(target: self, action: #selector(Coordinator.zoomPinch))
            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(Coordinator.moveScreen))

            view.addGestureRecognizer(zoomGesture)
            view.addGestureRecognizer(panGesture)

            if let scene = GKScene(fileNamed: sceneName) {
                // Get the SKScene from the loaded GKScene
                if let sceneNode = scene.rootNode as? MapGameScene {

                    // Copy gameplay related content over to the scene
                    self.scene = sceneNode

                    // Set the scale mode to scale to fit the window
                    sceneNode.scaleMode = .aspectFill

                    // Present the scene
                    if let view = view as? SKView {
                        view.presentScene(sceneNode)
                        view.ignoresSiblingOrder = false
                        view.showsFPS = false
                        view.showsNodeCount = false
                    }
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
            scene?.player?.addVelocity(CGVector(dx: -vel.x, dy: vel.y))
        }

    }

    typealias UIViewType = UIView
    private let mapName: String

    init(mapName: String) {
        self.mapName = mapName
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    func makeUIView(context: Context) -> UIView {
        return context.coordinator.makeView(sceneName: "MapGameScene")
    }

    func updateUIView(_ uiView: UIView, context: Context) {
//        view.backgroundColor = .systemBackground
    }

}
