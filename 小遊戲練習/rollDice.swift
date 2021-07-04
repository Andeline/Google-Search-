//
//  rollDice.swift
//  小遊戲練習
//
//  Created by 蔡佳穎 on 2021/4/28.
//

import UIKit

class rollDice: UIViewController {

    @IBOutlet weak var dice4View: UIView!
    @IBOutlet weak var dice6View: UIView!
    @IBOutlet weak var dice8View: UIView!
    
    @IBOutlet weak var dice4Label: UILabel!
    @IBOutlet weak var dice6Label: UILabel!
    @IBOutlet weak var dice8Label: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var choicDice4Btn: UIButton!
    @IBOutlet weak var choiceDice6Btn: UIButton!
    @IBOutlet weak var choiceDice8Btn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dice4Label.isHidden = true
        dice6Label.isHidden = true
        dice8Label.isHidden = true
        dice6View.isHidden = true
        dice8View.isHidden = true
        
    }
    @IBAction func choiceDiceType(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            dice4View.isHidden = false
        case 1:
            dice6View.isHidden = false
        case 2:
            dice8View.isHidden = false
        default:
            break
        }
    }
    
    @IBAction func roll(_ sender: UIButton) {
        let dice4Num = Int.random(in: 1...4)
        let dice6Num = Int.random(in: 1...6)
        let dice8Num = Int.random(in: 1...8)
        
        if dice4View.isHidden == false && dice6View.isHidden == true && dice8View.isHidden == true {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                self.dice4Label.isHidden = false
                self.dice4Label.text = "\(dice4Num)"
                self.totalLabel.text = "\(dice4Num)"
            }
        } else if dice4View.isHidden == false && dice6View.isHidden == false && dice8View.isHidden == true {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                self.dice6Label.isHidden = false
                self.dice4Label.text = "\(dice4Num)"
                self.dice6Label.text = "\(dice6Num)"
                let total = dice4Num + dice6Num
                self.totalLabel.text = "\(total)"
                self.totalLabel.sizeToFit()
            }
            
        } else if dice4View.isHidden == false && dice6View.isHidden == true && dice8View.isHidden == false {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                self.dice8Label.isHidden = false
                self.dice4Label.text = "\(dice4Num)"
                self.dice8Label.text = "\(dice8Num)"
                let total = dice4Num + dice8Num
                self.totalLabel.text = "\(total)"
                self.totalLabel.sizeToFit()
            }
            
        } else if dice4View.isHidden == false && dice6View.isHidden == false && dice8View.isHidden == false {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                self.dice6Label.isHidden = false
                self.dice8Label.isHidden = false
                self.dice4Label.text = "\(dice4Num)"
                self.dice6Label.text = "\(dice6Num)"
                self.dice8Label.text = "\(dice8Num)"
                let total = dice4Num + dice6Num + dice8Num
                self.totalLabel.text = "\(total)"
                self.totalLabel.sizeToFit()
            }
        }
    }
}
