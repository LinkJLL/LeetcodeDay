//
//  ImageOptimize.swift
//  LeetcodeDayly
//
//  Created by JL L on 2025/05/08.
//

import UIKit
import CoreGraphics
/**
 图片加载 主要分为三步 ： 读取图片、解压缩图片、渲染
 1.从磁盘/网络获取图片数据，然后缓存到内存中。(这一部分的数据都是压缩的，经过解压后才能显示)
 2.解码
    解码优化 ：常见的解码优化有downsampling  降低采样，后台解码以及缓存
 3.渲染图片 这部分工作时由GPU进行处理，通过Render Server 将视图进行合成及渲染
 
 光栅化
 UIKit
 Core Animation
 Metal  Core Graphics
 Graphics Hardware
 
 Core Animation 复合引擎，主要职责：渲染、构建 和实现动画
 
 
 每次电子束从头开始新的一帧扫描，GPU和CPU对于该帧的渲染流程已经结束，渲染好的位图已经放到帧缓冲器中，
 
 渲染的原理
 电子束从左至右进行扫描，在帧缓冲器中拿到已经渲染好的帧
 有2个关键的信号  分别是 Hsync 水平信号、Vsync 垂直信号
 
 
 
 */

class ImageOptimize: NSObject {
  
    
    ///降低采样
    static func downsample(imageAt imageURL: URL ,to pointSize: CGSize, scale: CGFloat) -> UIImage{
        let  imageSourceOptions = [kCGImageSourceShouldCache: false] as CFDictionary
        let imageSource = CGImageSourceCreateWithURL(imageURL as CFURL, imageSourceOptions)!;
        let maxDimensionInPixels = max(pointSize.width, pointSize.height) * scale;
        let downsampleOptions = [
            kCGImageSourceCreateThumbnailFromImageAlways : true,
            kCGImageSourceShouldCacheImmediately : true,
            kCGImageSourceCreateThumbnailWithTransform : true,
            kCGImageSourceThumbnailMaxPixelSize : maxDimensionInPixels
        ] as CFDictionary
        let downsampledImage = CGImageSourceCreateThumbnailAtIndex(imageSource, 0, downsampleOptions)!
        
        return UIImage(cgImage: downsampledImage)
    }
    
}

extension UIImage{
    func drawRectWithRoundedCorner(radius : CGFloat,_ sizeToFit : CGSize) -> UIImage?{
        let rect = CGRect(origin: .zero, size: sizeToFit)
        UIGraphicsBeginImageContextWithOptions(sizeToFit, false, UIScreen.main.scale)
        let bezierPath =  UIBezierPath(roundedRect: rect, byRoundingCorners: UIRectCorner.allCorners,cornerRadii: CGSize(width: radius, height: radius)).cgPath
        if let context = UIGraphicsGetCurrentContext() {
            context.addPath(bezierPath)
            
            context.clip()
            self.draw(in: rect)
            context.drawPath(using: .fillStroke)
            let output = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return output
        }
        return nil
    }
}

extension CALayer{
//    func eeee{
//        self.contents 
//    }
}
