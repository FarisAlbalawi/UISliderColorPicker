# UISliderColorPicker

[![CI Status](https://img.shields.io/travis/farisalbalawi/UISliderColorPicker.svg?style=flat)](https://travis-ci.org/farisalbalawi/UISliderColorPicker)
[![Version](https://img.shields.io/cocoapods/v/UISliderColorPicker.svg?style=flat)](https://cocoapods.org/pods/UISliderColorPicker)
[![License](https://img.shields.io/cocoapods/l/UISliderColorPicker.svg?style=flat)](https://cocoapods.org/pods/UISliderColorPicker)
[![Platform](https://img.shields.io/cocoapods/p/UISliderColorPicker.svg?style=flat)](https://cocoapods.org/pods/UISliderColorPicker)

![giphy](https://user-images.githubusercontent.com/18473439/63073935-03b77680-bef9-11e9-8702-ec817d332ce9.gif)


## Features 
- hex color codes 
- Supports dark and light style
- swipe down to dismiss
-  swift 5

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Usage

```swift
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
```

## Requirements

## Installation

UISliderColorPicker is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'UISliderColorPicker'
```

## Author

Faris Albalawi, developer.faris@gmail.com

## License

UISliderColorPicker is available under the MIT license. See the LICENSE file for more info.
