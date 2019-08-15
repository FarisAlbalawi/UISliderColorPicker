//
//  UISliderColorVC.swift
//  UISliderColorPicker
//
//  Created by Faris Albalawi on 8/14/19.
//


import UIKit

public enum style {
    case dark
    case light
}

public protocol UISliderColorDelegate {
    func sliderColorChanged(color: UIColor)
}

public class UISliderColorVC: UIViewController, UIGestureRecognizerDelegate {
    
    public var SliderColorDelegate : UISliderColorDelegate?
    
    private let redSlider: CustomSlider = {
        let redSlider = CustomSlider()
        redSlider.maximumValue = 255
        redSlider.minimumValue = 0
        redSlider.thumbTintColor = UIColor(red: 0.9686, green: 0, blue: 0.3686, alpha: 1.0)
        redSlider.translatesAutoresizingMaskIntoConstraints = false
        redSlider.addTarget(self, action: #selector(UISliderColorVC.changeRedSliderVlaue(_:)), for: .valueChanged)
        return redSlider
    }()
    
    private let greenSlider: CustomSlider = {
        let greenSlider = CustomSlider()
        greenSlider.maximumValue = 255
        greenSlider.minimumValue = 0
        greenSlider.thumbTintColor = UIColor(red: 0.0549, green: 0.8588, blue: 0, alpha: 1.0)
        greenSlider.translatesAutoresizingMaskIntoConstraints = false
        greenSlider.addTarget(self, action: #selector(UISliderColorVC.changeGreenSliderVlaue(_:)), for: .valueChanged)
        return greenSlider
    }()
    
    private let blueSlider: CustomSlider = {
        let blueSlider = CustomSlider()
        blueSlider.maximumValue = 255
        blueSlider.minimumValue = 0
        blueSlider.thumbTintColor = UIColor(red: 0, green: 0.2745, blue: 0.8667, alpha: 1.0)
        blueSlider.translatesAutoresizingMaskIntoConstraints = false
        blueSlider.addTarget(self, action: #selector(UISliderColorVC.changeBlueSliderVlaue(_:)), for: .valueChanged)
        return blueSlider
    }()
    
    private let headerView: UIView = {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()
    
    private let DoneButton: UIButton = {
        let DoneButton = UIButton()
        let image = UIImage(named: "Done")?.withRenderingMode(.alwaysTemplate)
        DoneButton.setImage(image, for: .normal)
        DoneButton.imageView?.contentMode = .scaleAspectFit
        DoneButton.addTarget(self, action: #selector(UISliderColorVC.didPressDone), for: UIControl.Event.touchUpInside)
        DoneButton.translatesAutoresizingMaskIntoConstraints = false
        
        return DoneButton
    }()
    
    private let cancelButton: UIButton = {
        let cancel = UIButton()
        let image = UIImage(named: "cancel")?.withRenderingMode(.alwaysTemplate)
        cancel.setImage(image, for: .normal)
        cancel.imageView?.contentMode = .scaleAspectFit
        cancel.addTarget(self, action: #selector(UISliderColorVC.didPressCancel), for: UIControl.Event.touchUpInside)
        cancel.translatesAutoresizingMaskIntoConstraints = false
        return cancel
    }()
    
    
    private let ColorView: UIView = {
        let ColorView = UIView()
        ColorView.backgroundColor = UIColor.black
        ColorView.layer.borderWidth = 2
        ColorView.layer.borderColor = UIColor.white.cgColor
        ColorView.translatesAutoresizingMaskIntoConstraints = false
        return ColorView
    }()
    
    
    private let Haxlab: UILabel = {
        let Haxlab = UILabel()
        Haxlab.font = UIFont(name: "Futura-Medium", size: 17)!
        Haxlab.text = "#000000"
        Haxlab.translatesAutoresizingMaskIntoConstraints = false
        return Haxlab
    }()
    
    
    
    private let screenSize = UIScreen.main.bounds.size
    
    private let fullView: CGFloat = UIScreen.main.bounds.height - 200 // remainder of screen height
    private var partialView: CGFloat {
        return UIScreen.main.bounds.height - 200
    }
    
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(headerView)
        self.view.addSubview(redSlider)
        self.view.addSubview(greenSlider)
        self.view.addSubview(blueSlider)
        
        self.headerView.addSubview(DoneButton)
        self.headerView.addSubview(cancelButton)
        self.headerView.addSubview(Haxlab)
        self.headerView.addSubview(ColorView)
        ColorView.layer.cornerRadius = 25 / 2
        let screenWidth = screenSize.width
        
        NSLayoutConstraint.activate([
            headerView.heightAnchor.constraint(equalToConstant: 40),
            headerView.widthAnchor.constraint(equalToConstant: screenWidth),
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            redSlider.widthAnchor.constraint(equalToConstant: screenWidth / 1.1),
            redSlider.topAnchor.constraint(equalTo: headerView.bottomAnchor,constant: 7),
            redSlider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            greenSlider.widthAnchor.constraint(equalToConstant: screenWidth / 1.1),
            greenSlider.topAnchor.constraint(equalTo: redSlider.bottomAnchor,constant: 7),
            greenSlider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            blueSlider.widthAnchor.constraint(equalToConstant: screenWidth / 1.1),
            blueSlider.topAnchor.constraint(equalTo: greenSlider.bottomAnchor,constant: 7),
            blueSlider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            cancelButton.heightAnchor.constraint(equalToConstant: 20),
            cancelButton.widthAnchor.constraint(equalToConstant: 20),
            cancelButton.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            cancelButton.leftAnchor.constraint(equalTo: headerView.leftAnchor, constant: 10),
            
            DoneButton.heightAnchor.constraint(equalToConstant: 20),
            DoneButton.widthAnchor.constraint(equalToConstant: 20),
            DoneButton.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            DoneButton.rightAnchor.constraint(equalTo: headerView.rightAnchor, constant: -10),
            
            Haxlab.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            Haxlab.centerXAnchor.constraint(equalTo: headerView.centerXAnchor, constant: 20),
            
            ColorView.heightAnchor.constraint(equalToConstant: 25),
            ColorView.widthAnchor.constraint(equalToConstant: 25),
            ColorView.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            ColorView.centerXAnchor.constraint(equalTo: headerView.centerXAnchor, constant: -35),
            
            ])
        
        
        let gesture = UIPanGestureRecognizer.init(target: self, action: #selector(UISliderColorVC.panGesture))
        gesture.delegate = self
        view.addGestureRecognizer(gesture)
    }
    
    
    
    
    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.6) { [weak self] in
            guard let `self` = self else { return }
            let frame = self.view.frame
            let yComponent = self.partialView
            self.view.frame = CGRect(x: 0,
                                     y: yComponent,
                                     width: frame.width,
                                     height: UIScreen.main.bounds.height - self.partialView)
        }
    }
    
    
     public func style(_ style: style) {
        switch style {
        case .dark:
            darkStyle()
        case .light:
            lightStyle()
        }
    }
    
    
    private func darkStyle() {
        self.view.backgroundColor = UIColor(red: 0.149, green: 0.149, blue: 0.149, alpha: 1.0)
        redSlider.minimumTrackTintColor = UIColor(red: 0.3255, green: 0.3255, blue: 0.3255, alpha: 1.0)
        redSlider.maximumTrackTintColor = UIColor(red: 0.3255, green: 0.3255, blue: 0.3255, alpha: 1.0)
        
        greenSlider.minimumTrackTintColor = UIColor(red: 0.3255, green: 0.3255, blue: 0.3255, alpha: 1.0)
        greenSlider.maximumTrackTintColor = UIColor(red: 0.3255, green: 0.3255, blue: 0.3255, alpha: 1.0)
        
        blueSlider.minimumTrackTintColor = UIColor(red: 0.3255, green: 0.3255, blue: 0.3255, alpha: 1.0)
        blueSlider.maximumTrackTintColor = UIColor(red: 0.3255, green: 0.3255, blue: 0.3255, alpha: 1.0)
        
        DoneButton.tintColor = UIColor(red: 0.8667, green: 0.8667, blue: 0.8667, alpha: 1.0)
        cancelButton.tintColor = UIColor(red: 0.8667, green: 0.8667, blue: 0.8667, alpha: 1.0)
        Haxlab.textColor = UIColor(red: 0.8667, green: 0.8667, blue: 0.8667, alpha: 1.0)
        
    }
    
    private func lightStyle() {
        self.view.backgroundColor = UIColor.white
        
        redSlider.minimumTrackTintColor = UIColor(red: 0.9137, green: 0.9137, blue: 0.9373, alpha: 1.0)
        redSlider.maximumTrackTintColor = UIColor(red: 0.9137, green: 0.9137, blue: 0.9373, alpha: 1.0)
        
        
        greenSlider.minimumTrackTintColor = UIColor(red: 0.9137, green: 0.9137, blue: 0.9373, alpha: 1.0)
        greenSlider.maximumTrackTintColor = UIColor(red: 0.9137, green: 0.9137, blue: 0.9373, alpha: 1.0)
        
        blueSlider.minimumTrackTintColor = UIColor(red: 0.9137, green: 0.9137, blue: 0.9373, alpha: 1.0)
        blueSlider.maximumTrackTintColor = UIColor(red: 0.9137, green: 0.9137, blue: 0.9373, alpha: 1.0)
        
        DoneButton.tintColor = UIColor.black
        cancelButton.tintColor = UIColor.black
        Haxlab.textColor = UIColor.black
    }
    
    
    
    //MARK: Pan Gesture
    @objc func panGesture(_ recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        let velocity = recognizer.velocity(in: self.view)
        
        let y = self.view.frame.minY
        if y + translation.y >= fullView {
            let newMinY = y + translation.y
            self.view.frame = CGRect(x: 0, y: newMinY, width: view.frame.width, height: UIScreen.main.bounds.height - newMinY )
            self.view.layoutIfNeeded()
            recognizer.setTranslation(CGPoint.zero, in: self.view)
        }
        
        if recognizer.state == .ended {
            var duration =  velocity.y < 0 ? Double((y - fullView) / -velocity.y) : Double((partialView - y) / velocity.y )
            duration = duration > 1.3 ? 1 : duration
            //velocity is direction of gesture
            UIView.animate(withDuration: duration, delay: 0.0, options: [.allowUserInteraction], animations: {
                if  velocity.y >= 0 {
                    if y + translation.y >= self.partialView  {
                        self.removeBottomSheetView()
                    } else {
                        self.view.frame = CGRect(x: 0, y: self.partialView, width: self.view.frame.width, height: UIScreen.main.bounds.height - self.partialView)
                        self.view.layoutIfNeeded()
                    }
                } else {
                    if y + translation.y >= self.partialView  {
                        self.view.frame = CGRect(x: 0, y: self.partialView, width: self.view.frame.width, height: UIScreen.main.bounds.height - self.partialView)
                        self.view.layoutIfNeeded()
                    } else {
                        self.view.frame = CGRect(x: 0, y: self.fullView, width: self.view.frame.width, height: UIScreen.main.bounds.height - self.fullView)
                        self.view.layoutIfNeeded()
                    }
                }
                
            }, completion: nil)
        }
    }
    
    
    @objc func changeRedSliderVlaue(_ sender: UISlider) {
        let color =  UIColor(red: CGFloat(redSlider.value)/255, green: CGFloat(greenSlider.value)/255, blue: CGFloat(blueSlider.value)/255, alpha: 1.0)
        self.color(colors: color)
    }
    
    @objc func changeGreenSliderVlaue(_ sender: UISlider) {
        let color =  UIColor(red: CGFloat(redSlider.value)/255, green: CGFloat(greenSlider.value)/255, blue: CGFloat(blueSlider.value)/255, alpha: 1.0)
        self.color(colors: color)
    }
    
    @objc func changeBlueSliderVlaue(_ sender: UISlider) {
        let color =  UIColor(red: CGFloat(redSlider.value)/255, green: CGFloat(greenSlider.value)/255, blue: CGFloat(blueSlider.value)/255, alpha: 1.0)
        self.color(colors: color)
    }
    
    func color(colors: UIColor) {
        self.Haxlab.text = colors.toHexString().uppercased()
        self.ColorView.backgroundColor = colors
        self.SliderColorDelegate?.sliderColorChanged(color: colors)
    }
    
    
    @objc func didPressDone() {
        removeBottomSheetView()
    }
    
    @objc func didPressCancel() {
        removeBottomSheetView()
        
    }
    
}



extension UISliderColorVC {
    
    func prepareBackgroundView(){
        let blurEffect = UIBlurEffect.init(style: .dark)
        let visualEffect = UIVisualEffectView.init(effect: blurEffect)
        let bluredView = UIVisualEffectView.init(effect: blurEffect)
        bluredView.contentView.addSubview(visualEffect)
        visualEffect.frame = UIScreen.main.bounds
        bluredView.frame = UIScreen.main.bounds
        view.insertSubview(bluredView, at: 0)
    }
    
    func removeBottomSheetView() {
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: UIView.AnimationOptions.curveEaseIn,
                       animations: { () -> Void in
                        var frame = self.view.frame
                        frame.origin.y = UIScreen.main.bounds.maxY
                        self.view.frame = frame
                        
        }, completion: { (finished) -> Void in
            self.view.removeFromSuperview()
            self.removeFromParent()
        })
    }
}

public extension UIColor {
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        
        return String(format:"#%06x", rgb)
    }
}


public class CustomSlider: UISlider {
    override public func trackRect(forBounds bounds: CGRect) -> CGRect {
        let point = CGPoint(x: bounds.minX, y: bounds.midY)
        let defaultBounds = super.trackRect(forBounds: bounds)
        return CGRect(origin: point, size: CGSize(width: defaultBounds.size.width, height: 10))
    }
}
