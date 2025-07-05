//
//  JLTitleItem.swift
//  LeetcodeDayly
//
//  Created by JL L on 2025/05/18.
//

import UIKit
import  AVFoundation

let PH720VidieoRect = CGRect(x: 0, y: 0, width: 1280, height: 720)
 
class JLTitleItem: NSObject {
    
    // 动画开始时间
    var startTime : CMTime = .zero
    // 动画持续时间长
    var timeRange : CMTimeRange = CMTimeRange.zero
    
    // 构建动画图层
    func buildAnimationLayer() -> CALayer {
        let parentLayer = CALayer()
        parentLayer.frame = PH720VidieoRect
        parentLayer.opacity = 0.0
        var sublayerTransform = CATransform3DIdentity
        sublayerTransform.m34 = -1.0/500.0
        parentLayer.sublayerTransform = sublayerTransform
        
        //添加图片图层
        let imageLayer = buildImageLayer()
        parentLayer.addSublayer(imageLayer)
        
        //添加文字图层
        let textLayer = buildTextLayer()
        parentLayer.addSublayer(textLayer)
        
        // 添加淡入淡出动画
        let fadeAnimation = buildFadeInOutAnimation()
        parentLayer.add(fadeAnimation, forKey: nil)
        
        return parentLayer
    }
    
    
    // 构建图片图层
    func buildImageLayer() -> CALayer {
        let imageLayer = CALayer()
        imageLayer.contents = UIImage(named: "cover")?.cgImage
        imageLayer.contentsScale = UIScreen.main.scale
        let width = 458.0
        let height = 314.0
        imageLayer.bounds = CGRect(x: 0.0, y: 0.0, width: width, height: height)
        imageLayer.position = CGPoint(x: PH720VidieoRect.midX, y: PH720VidieoRect.midY)
        imageLayer.allowsEdgeAntialiasing = true
        // 添加旋转动画
        let rotationAnimation = buildRotationAnimation()
        imageLayer.add(rotationAnimation, forKey: nil)
        return imageLayer
    }
    
    // 构建文案图层
    func buildTextLayer() -> CALayer {
        let textLayer = CATextLayer()
        textLayer.string = "Hello, World!"
        textLayer.fontSize = 40
        textLayer.foregroundColor = UIColor.white.cgColor
        textLayer.alignmentMode = .center
        textLayer.bounds = CGRect(x: 0.0, y: 0.0, width: 300.0, height: 100.0)
        textLayer.position = CGPoint(x: PH720VidieoRect.midX, y: PH720VidieoRect.midY + 200.0)
        // 添加淡入淡出动画
        let fadeAnimation = buildScaleAnimation()
        textLayer.add(fadeAnimation, forKey: nil)
        return textLayer
    }
    
    
    // 构建旋转动画
    func buildRotationAnimation() -> CAAnimation {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.y")
        rotationAnimation.fromValue = 0
        rotationAnimation.toValue = 2 * Double.pi
        rotationAnimation.beginTime = CMTimeGetSeconds(startTime)
        rotationAnimation.duration = CMTimeGetSeconds(timeRange.duration)
        rotationAnimation.isRemovedOnCompletion = false
        return rotationAnimation
    }
    
    // 构建放大动画
    func buildScaleAnimation() -> CAAnimation {
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.fromValue = 0.0
        scaleAnimation.toValue = 1.0
        scaleAnimation.beginTime = CMTimeGetSeconds(startTime)
        scaleAnimation.duration = CMTimeGetSeconds(timeRange.duration)
        scaleAnimation.isRemovedOnCompletion = false
        return scaleAnimation
    }
    
    
    // 构建淡入淡出动画
    func buildFadeInOutAnimation() -> CAAnimation {
        let fadeAnimation = CABasicAnimation(keyPath: "opacity")
        fadeAnimation.fromValue = 0.0
        fadeAnimation.toValue = 1.0
        fadeAnimation.beginTime = CMTimeGetSeconds(startTime)
        fadeAnimation.duration = CMTimeGetSeconds(timeRange.duration)
        fadeAnimation.isRemovedOnCompletion = false
        return fadeAnimation
    }
 
}
