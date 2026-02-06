//
//  ViewController.swift
//  LeetcodeDayly
//
//  Created by JL L on 2025/05/06.
//

import UIKit

class ViewController: UIViewController, AsyncLearnDelegate {

    var learn : AsyncLearn?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        February_5().constructTransformedArray([3,-2,1,1])
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        let popupView = GradientBorderView()
//        popupView.backgroundColor = UIColor.orange.withAlphaComponent(0.6)
        popupView.frame = CGRectMake(40, 100, 250, 150)
        view.addSubview(popupView)
//        popupView.snp.makeConstraints { make in
//            make.center.equalToSuperview()
//            make.width.equalTo(250)
//            make.height.equalTo(150)
//        }
        
        
        // Do any additional setup after loading the view.
//        let dummy = NSMutableArray()
//        let v = TestView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
//        v.backgroundColor = .black
//        self.view.addSubview(v)
//        TestThread().customCreateQueue()
//        self.learn = AsyncLearn()
//        
//        Task {
        AsyncLearn().useAsync()
//        }
//        Son.doSomeClassMehtod()
//        Son().testPrivateMethod()
//        A().privateMehtod()
//        B().privateMehtod()
//        TestThread.createMainThread()
//        TestCodeable().jsonParase()
//        TestThread().semaphore()
//        OCSon()
//        var m = ALModel(value: "00")
//        m.change()
//        print(m)
        self.flatMap()
    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let vc = ImageOptimizeViewController()
        self.learn?.delegate = vc
        self.present(vc, animated: true)
    }
    
    func  flatMap(){
        let input: [String?] = ["A", nil, "B", nil, "C"]
        print(input)
        let result = input.flatMap({$0})
        print(result)
        let comp = input.compactMap({$0})
        print(comp)
        
        let numbers = [1, 2, 3, 4]
        let reduce = numbers.reduce(1, add)
        print(reduce)
      
    }
    
    func add(_ a : Int , _ b: Int) -> Int {
        return a * b
    }
}


class TestView: UIView {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    override func draw(_ layer: CALayer, in ctx: CGContext) {
        super.draw(layer, in: ctx)
    }
    override func draw(_ rect: CGRect, for formatter: UIViewPrintFormatter) {
        super.draw(rect, for: formatter)
    }
}

 struct ALModel {
    var value : String
    mutating func change(){
        self.value = "2"
    }
}


enum TestEnum: String {
    case one
    case two
}



class GradientBorderView: UIView {
    
    private let gradientLayer = CAGradientLayer()
    private let borderLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGradientBorder()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGradientBorder()
    }
    
    private func setupGradientBorder() {
        backgroundColor = UIColor.black.withAlphaComponent(0.6)
        layer.cornerRadius = 18
        layer.masksToBounds = true
        
        // 🎨 渐变方向：左上 → 右下
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint   = CGPoint(x: 1, y: 1)
        
        // 🎨 调整颜色 & 透明度分布
        //   左上 亮（40%）
        //   中间 透明（0%）
        //   右下 微光（10%）
        gradientLayer.colors = [
            UIColor.white.withAlphaComponent(0.4).cgColor,  // 左上
            UIColor.white.withAlphaComponent(0.0).cgColor, // 过渡
            UIColor.white.withAlphaComponent(0.0).cgColor,  // 中间
            UIColor.white.withAlphaComponent(0.1).cgColor   // 右下
        ]
        gradientLayer.locations = [0.0, 0.41, 0.57, 1.0]
        
        layer.addSublayer(gradientLayer)
        
        // 🎨 边框路径（不再用 mask，会削弱亮度）
        borderLayer.lineWidth = 1
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.strokeColor = UIColor.white.cgColor
        borderLayer.lineCap = .round
        
        layer.addSublayer(borderLayer)
        
        // ✅ 将渐变直接显示在边框线条上
        gradientLayer.mask = borderLayer
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
        
        let path = UIBezierPath(
            roundedRect: bounds.insetBy(dx: 1, dy: 1),
            cornerRadius: layer.cornerRadius
        )
        borderLayer.path = path.cgPath
    }
}
