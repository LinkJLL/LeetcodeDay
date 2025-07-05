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

