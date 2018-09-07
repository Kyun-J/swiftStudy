//
//  ViewController2.swift
//  test
//
//  Created by 황견주 on 2018. 8. 29..
//  Copyright © 2018년 Kyun Joo, Hwang. All rights reserved.
//

import UIKit

class second_image: UIViewController {

    @IBOutlet weak var imageView : UIImageView!
    @IBOutlet weak var slider : UISlider!
    @IBOutlet weak var button : UIButton!
    @IBOutlet weak var label : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var ImgSet = [UIImage]()
        for i in 1...15 {
            ImgSet.append(UIImage(named:"\(i).jpg")!)
        }
        imageView.image = ImgSet[0]
        imageView.animationImages = ImgSet
        slider.minimumValue = 1
        slider.maximumValue = 15
        slider.setValue(7.5, animated: true)
        label.text = "7.5"
        imageView.animationDuration = 7.5
    }
    
    @IBAction func toggleButton(_ sender:Any) {
        if imageView.isAnimating {
            imageView.stopAnimating()
            button.setTitle("Start", for: UIControlState.normal)
        } else {
            imageView.startAnimating()
            button.setTitle("Stop", for: UIControlState.normal)
        }
    }
    
    @IBAction func setDuration(_ sender:Any) {
        if imageView.isAnimating {
            imageView.stopAnimating()
            button.setTitle("Start", for: UIControlState.normal)
        }
        let value = slider.value
        imageView.animationDuration = Double(value)
        label.text = String(format : "%.2f",value)
    }
    
}
