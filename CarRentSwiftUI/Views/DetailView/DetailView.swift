//
//  DetailView.swift
//  CarRentSwiftUI
//
//  Created by Nalin Porwal on 16/05/21.
//

import SceneKit
import SceneKit.ModelIO
import SwiftUI

struct DetailView: View {
    
    var scene: CarModel
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
            IconDetailHeader()
                .padding(10)
            ZStack(alignment: .topLeading) {
                SceneView(scene: scene.scene, options: [.autoenablesDefaultLighting, .allowsCameraControl])
                    .frame(width: UIScreen.main.bounds.width - 50, height: UIScreen.main.bounds.height/2)
                    .onAppear(perform: {
                        scene.onAppearAnimation()
                    })
                VStack(alignment: .leading) {
                    Text("LAMBORGINI")
                        .font(.custom(CustomFont.sFProText_Bold, size: 30, relativeTo: .title))
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)))
                    Text("\(scene.modelName)".uppercased())
                        .font(.custom(CustomFont.sFProText_Bold, size: 40, relativeTo: .title))
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                }
            }.padding(10)
            
            DetailBottomView()
            
        
        }.padding(10)
        .padding(.top, 30)
        
        }.background(Color(#colorLiteral(red: 0.0558475256, green: 0.06114148349, blue: 0.1033822671, alpha: 1)))
        .edgesIgnoringSafeArea(.all)
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}

struct IconDetailHeader: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        HStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                IconView(imageName: "arrow.left")
            })
            Spacer()
            IconView(imageName: "magnifyingglass")
            IconView(imageName: "gear")
        }
    }
}

class CarModel: ObservableObject{
    var modelNode: SCNNode!
    var cameraOrbitNode: SCNNode!
    var scene = SCNScene()
    var cameraPostion: SCNVector3!
    var modelName: String
    let scnAction = SCNAction.rotate(by: .pi * 2, around: SCNVector3(0, 1, 0), duration: 2)
    
    init(_ modelName: String, _ scale: SCNVector3, _ modelExtention: String = "usdz") {
        self.modelName = modelName
        let url = Bundle.main.url(forResource: modelName, withExtension: modelExtention)!
        
        let mdlAsset = MDLAsset(url: url)
        mdlAsset.loadTextures()
        
        let objectNode: SCNNode = .init(mdlObject: mdlAsset.object(at: 0))
        objectNode.scale = scale
        modelNode = objectNode
        /// `Adding Object Node`
        scene.rootNode.addChildNode(objectNode)
        
        let cameraNode = SCNNode()
        let cameraSCN = SCNCamera()
        cameraNode.camera = cameraSCN
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 35)
        /// `Add Camera node To another node to change its property`
        let cameraOrbit = SCNNode()
        cameraOrbit.addChildNode(cameraNode)
        self.cameraOrbitNode = cameraOrbit
        cameraPostion = cameraOrbitNode.position
        scene.rootNode.addChildNode(cameraOrbit)
        
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 10, z: 35)
        scene.rootNode.addChildNode(lightNode)

        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light?.type = .ambient
        ambientLightNode.light?.color = UIColor.darkGray
        scene.rootNode.addChildNode(ambientLightNode)

        let directionalLightNode = SCNNode()
        directionalLightNode.light = SCNLight()
        directionalLightNode.light?.type = .directional
        directionalLightNode.light?.color = UIColor.darkGray
        directionalLightNode.position = SCNVector3(x: 0, y: 10, z: 35)
        scene.rootNode.addChildNode(directionalLightNode)
        
        scene.background.contents = #colorLiteral(red: 0.0558475256, green: 0.06114148349, blue: 0.1033822671, alpha: 1)
    }
    
    func onAppearAnimation() {
        modelNode?.runAction(scnAction)
        let scnCameraAction = SCNAction.rotate(by: .pi/6, around: SCNVector3(-1, 0, 0), duration: 1)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.cameraOrbitNode.runAction(scnCameraAction)
        }
    }
    
    func rotateRight() {
        let scnAction = SCNAction.rotate(by: .pi/4, around: SCNVector3(0, 4, 0), duration: 1)
        modelNode?.runAction(scnAction)
    }
}

struct DetailBottomView: View {
    var body: some View {
        GeometryReader { geo in
            VStack {
                HStack(alignment: .center) {
                    VStack {
                        Image(systemName: "bolt")
                            .resizable()
                            .frame(width: 40, height: 50, alignment: .center)
                            .foregroundColor(.white)
                            .padding(3)
                        VStack(alignment: .leading) {
                            Text("Engine Power".uppercased())
                                .font(.custom(CustomFont.sFProText_SemiBold, size: 20, relativeTo: .title))
                                .foregroundColor(Color(#colorLiteral(red: 0.3271518468, green: 0.3491681932, blue: 0.5656960227, alpha: 1)))
                            Text("60 CV (440KW)".uppercased())
                                .font(.custom(CustomFont.sFProText_Medium, size: 15, relativeTo: .title))
                                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        }
                        
                    }.frame(width: geo.size.width/2 - 10, height: geo.size.width/2 - 10)
                        .background(Color(#colorLiteral(red: 0.3271518468, green: 0.3491681932, blue: 0.5656960227, alpha: 0.2)))
                        .cornerRadius(20)
                    
                    Spacer()
                    
                    VStack {
                        Image(systemName: "speedometer")
                            .resizable()
                            .frame(width: 50, height: 50, alignment: .center)
                            .foregroundColor(.white)
                            .padding(3)
                        VStack(alignment: .leading) {
                            Text("Speed".uppercased())
                                .font(.custom(CustomFont.sFProText_SemiBold, size: 20, relativeTo: .title))
                                .foregroundColor(Color(#colorLiteral(red: 0.3271518468, green: 0.3491681932, blue: 0.5656960227, alpha: 1)))
                            Text("Max 360 Km Per Hour".uppercased())
                                .font(.custom(CustomFont.sFProText_Medium, size: 15, relativeTo: .title))
                                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        }
                        
                    }.frame(width: geo.size.width/2 - 10, height: geo.size.width/2 - 10)
                        .background(Color(#colorLiteral(red: 0.3271518468, green: 0.3491681932, blue: 0.5656960227, alpha: 0.2)))
                        .cornerRadius(20)
                }

                Spacer(minLength: 10)
                Button(action: {
                    print("Buy")
                }, label: {
                    Text("Buy 98K ₹ Per Day")
                    .font(.custom(CustomFont.sFProText_SemiBold, size: 20, relativeTo: .title))
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                }).frame(width: geo.size.width, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)))
                .cornerRadius(20)
            }
        }
    }
}
