//
//  ViewController.swift
//  UISliderColorPicker
//
//  Created by farisalbalawi on 08/14/2019.
//  Copyright (c) 2019 farisalbalawi. All rights reserved.
//

import UIKit
import UISliderColorPicker

class ViewController: UIViewController {

     var sliderColorVC: UISliderColorVC!
    
    @IBOutlet weak var colorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func showView(_ sender: Any) {
        sliderColorVC = UISliderColorVC(nibName: nil, bundle: Bundle(for: UISliderColorVC.self))
        showColorView()
    }
    
  
    func showColorView() {
        self.sliderColorVC.SliderColorDelegate = self
        self.sliderColorVC.style(.dark)
        self.addChild(sliderColorVC)
        self.view.addSubview(sliderColorVC.view)
        sliderColorVC.didMove(toParent: self)
        let height = view.frame.height
        let width  = view.frame.width
        sliderColorVC.view.frame = CGRect(x: 0, y: self.view.frame.maxY , width: width, height: height)
    }
    
    
}

extension ViewController: UISliderColorDelegate {
    func sliderColorChanged(color: UIColor) {
        colorView.backgroundColor = color
    }
}
