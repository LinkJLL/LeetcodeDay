//
//  ImageOptimizeViewController.swift
//  LeetcodeDayly
//
//  Created by JL L on 2025/05/10.
//

import UIKit

class CellModel: NSObject {
    var image : UIImage?
    var filePath : String?
}

class ImageOptimizeViewController: UIViewController, AsyncLearnDelegate {

    
    var downloadTask : (()->Void)?
    
//    var taskLists:
    
    @IBOutlet weak var FPSLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var fpsCount : Int = 0
    var link : CADisplayLink!
    var lastTime :TimeInterval = 0
    var learn : AsyncLearn?
    var datalists : [CellModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let son = SonSwilingMethod.init()
        son.parentMethod()
//        let parant = SwilingMethod.init()
//        parant.parentMethod()
        
        tableView.rowHeight = 100
        FPSMonitor.share.startMonitoring()
        tableView.register(UINib.init(nibName: "ImageOptimizeTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        self.link = CADisplayLink.init(target: self, selector: #selector(fpsevent))
        
        link.add(to: RunLoop.current, forMode: .common)
//        self.tableView.prefetchDataSource = self
        DispatchQueue.global().async {
            for _ in 0..<100 {
                let model = CellModel.init()
                model.filePath = Bundle.main.path(forResource: "test", ofType: "jpg")
                
            
                
                self.datalists.append(model)
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        //监听 Runloop的 beforeWaiting状态，在空闲状态下加载图片，这样防止用户在快速滑动过程中加载图片导致卡顿 掉帧的行为
        let observer = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, CFRunLoopActivity.beforeWaiting.rawValue, true, 0) {[weak self] observer, avtivity in
            self?.downloadTask?()
            let   visibleCells = self?.tableView.visibleCells
            for index in 0..<visibleCells!.count {
                let iconCell = visibleCells?[index] as! ImageOptimizeTableViewCell
                if iconCell.icon?.image == nil {
                    iconCell.icon?.image  = ImageOptimize.downsample(imageAt: URL.init(filePath:  Bundle.main.path(forResource: "test", ofType: "jpg") ?? ""),to: CGSize(width: 100, height: 100), scale: UIScreen.main.scale)
                }

            }

        }
        
        CFRunLoopAddObserver(CFRunLoopGetMain(), observer, CFRunLoopMode.defaultMode)
        
        
    }

    @objc func fpsevent(){
        if self.lastTime == 0 {
            self.lastTime = self.link.timestamp;
            return
        }
        self.fpsCount +=  1
        
        let delta = self.link.timestamp - self.lastTime
        self.lastTime = self.link.timestamp
        
        let fps = Double(self.fpsCount) / delta
      
        if fps < 40 {
            self.FPSLabel.textColor = .red
        }else{
            self.FPSLabel.textColor = .white
        }
        self.FPSLabel.text = "FPS:\(Int(fps))"
        self.fpsCount = 0
    }


}
extension ImageOptimizeViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datalists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ImageOptimizeTableViewCell
        let model = self.datalists[indexPath.row]
 
//        cell.icon?.image = model.image
        
        return cell
    }
    
//    @objc(tableView:prefetchRowsAtIndexPaths:) func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]){
//        for indexPath in indexPaths {
//            let model = self.datalists[indexPath.row]
//            DispatchQueue.global().async {
//                model.image  = ImageOptimize.downsample(imageAt: URL.init(filePath: model.filePath ?? ""),
//                                         to: CGSize(width: 100, height: 100), scale: UIScreen.main.scale)
//            }
//        }
//    }
//    func tableView(_ tableView: UITableView, performPrimaryActionForRowAt indexPath: IndexPath) {
//        
//        
//    }
}
