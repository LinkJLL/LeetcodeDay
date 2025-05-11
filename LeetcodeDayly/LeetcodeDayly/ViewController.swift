//
//  ViewController.swift
//  LeetcodeDayly
//
//  Created by JL L on 2025/05/06.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let v = TestView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        v.backgroundColor = .black
        self.view.addSubview(v)
    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let vc = ImageOptimizeViewController()
        self.present(vc, animated: true)
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
