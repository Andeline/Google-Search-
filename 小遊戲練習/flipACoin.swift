//
//  ViewController.swift
//  小遊戲練習
//
//  Created by 蔡佳穎 on 2021/4/28.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var coinImageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet var btn: UIView!
    
    let images = ["coin1.png", "coin2.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "Money or Crown?"
        label.sizeToFit()
    }
    
    @IBAction func flipBtn(_ sender: UIButton) {
        var coinImages = [UIImage]()
        for i in 1...2 {
            coinImages.append(UIImage(named: "coin\(i)")!)
        }
        coinImageView.animationImages = coinImages
        coinImageView.animationDuration = 0.4
        coinImageView.animationRepeatCount = 5
        coinImageView.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let num = Int.random(in: 0...1)
            self.coinImageView.image = UIImage(named: "\(self.images[num])")
            
            if num == 0 {
                self.label.text = "Crown"
            } else {
                self.label.text = "Money"
            }
        }
    }
}

