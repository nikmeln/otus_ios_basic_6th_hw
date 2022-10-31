//
//  ViewController.swift
//  6th homework
//
//  Created by n on 02.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var firstLabel: UILabel = {
        return UILabel()
    }()
    private lazy var secondLabel: UILabel = {
        return UILabel()
    }()
    private lazy var imageView: UIImageView = {
        return UIImageView()
    }()
    
    //imageView constraints
    private var ivTopConstraintToView_portrait = NSLayoutConstraint()
    private var ivTopConstraintToLabel_portrait = NSLayoutConstraint()
    private var ivBottomConstraint_portrait = NSLayoutConstraint()
    private var ivLeadingConstraint_portrait = NSLayoutConstraint()
    private var ivTrailingConstraint_portrait = NSLayoutConstraint()
    private var ivHeightConstraint = NSLayoutConstraint()
    private var ivWidthConstraint = NSLayoutConstraint()
    
    private var ivTopConstraintToView_landscape = NSLayoutConstraint()
    private var ivTopConstraintToLabel_landscape = NSLayoutConstraint()
    private var ivBottomConstraint_landscape = NSLayoutConstraint()
    private var ivLeadingConstraint_landscape = NSLayoutConstraint()
    private var ivTrailingConstraint_landscape = NSLayoutConstraint()
    
    //firstLabel constraints
    private var flTopConstraint_portrait = NSLayoutConstraint()
    private var flBottomConstraint_portrait = NSLayoutConstraint()
    private var flLeadingConstraint_portrait = NSLayoutConstraint()
    private var flTrailingConstraint_portrait = NSLayoutConstraint()
    
    private var flTopConstraint_landscape = NSLayoutConstraint()
    private var flBottomConstraint_landscape = NSLayoutConstraint()
    private var flLeadingConstraint_landscape = NSLayoutConstraint()
    private var flTrailingConstraint_landscape = NSLayoutConstraint()
    
    //secondLabel constraints
    private var slTopConstraint_portrait = NSLayoutConstraint()
    private var slBottomConstraint_portrait = NSLayoutConstraint()
    private var slLeadingConstraint_portrait = NSLayoutConstraint()
    private var slTrailingConstraint_portrait = NSLayoutConstraint()
    
    private var slTopConstraint_landscape = NSLayoutConstraint()
    private var slBottomConstraint_landscape = NSLayoutConstraint()
    private var slLeadingConstraint_landscape = NSLayoutConstraint()
    private var slTrailingConstraint_landscape = NSLayoutConstraint()

    private var isConfigured: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(forName: UIDevice.orientationDidChangeNotification, object: .none, queue: .none) { [weak self] _ in
            print("orientationDidChangeNotification")
            self?.screenOrientationDidChange()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupView()
    }
    
    func setupView() {
        print("setupView")
        if isConfigured == true {
            print("setupView has been configured already")
            return
        }
        
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        firstLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        firstLabel.numberOfLines = 1
        firstLabel.text = "first label, first label"
        
        
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        secondLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        secondLabel.numberOfLines = 1
        secondLabel.text = "second label, second label"
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .red
        ivHeightConstraint = NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
        ivHeightConstraint.priority = .defaultLow
        ivHeightConstraint.isActive = true
        ivWidthConstraint = NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
        ivHeightConstraint.priority = .defaultLow
        ivWidthConstraint.isActive = true
        
        self.view.addSubview(firstLabel)
        self.view.addSubview(secondLabel)
        self.view.addSubview(imageView)
        
        configurePortraitConstraints()

        configureLandscapeConstraints()
        
        isConfigured = true
    }
    
    private func configurePortraitConstraints() {
        ivTopConstraintToView_portrait = NSLayoutConstraint(item: imageView, attribute: .topMargin, relatedBy: .greaterThanOrEqual, toItem: view, attribute: .centerYWithinMargins, multiplier: 1, constant: 10)
        ivTopConstraintToView_portrait.priority = .defaultLow
        ivTopConstraintToLabel_portrait = NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .lessThanOrEqual, toItem: firstLabel, attribute: .bottomMargin, multiplier: 1, constant: 10)
        ivTopConstraintToLabel_portrait.priority = .required
        ivTrailingConstraint_portrait = NSLayoutConstraint(item: imageView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: -20)
        ivLeadingConstraint_portrait = NSLayoutConstraint(item: imageView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1, constant: 20)
        ivTrailingConstraint_portrait = NSLayoutConstraint(item: imageView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: -20)
        
        
        flTopConstraint_portrait = NSLayoutConstraint(item: firstLabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .topMargin, multiplier: 1, constant: 20)
        flLeadingConstraint_portrait = NSLayoutConstraint(item: firstLabel, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1, constant: 20)
        flTrailingConstraint_portrait = NSLayoutConstraint(item: firstLabel, attribute: .trailing, relatedBy: .equal, toItem: secondLabel, attribute: .leadingMargin, multiplier: 1, constant: -20)
        
        slTopConstraint_portrait = NSLayoutConstraint(item: secondLabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .topMargin, multiplier: 1, constant: 20)
        slTrailingConstraint_portrait = NSLayoutConstraint(item: secondLabel, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: -20)
    }
    
    private func configureLandscapeConstraints() {
        flTopConstraint_landscape = NSLayoutConstraint(item: firstLabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .topMargin, multiplier: 1, constant: 20)
        flLeadingConstraint_landscape = NSLayoutConstraint(item: firstLabel, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1, constant: 20)
        flTrailingConstraint_landscape = NSLayoutConstraint(item: firstLabel, attribute: .trailing, relatedBy: .equal, toItem: secondLabel, attribute: .leadingMargin, multiplier: 1, constant: -20)
        flBottomConstraint_landscape = NSLayoutConstraint(item: firstLabel, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottomMargin, multiplier: 1, constant: 20)
        
        slTopConstraint_landscape = NSLayoutConstraint(item: secondLabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .topMargin, multiplier: 1, constant: 20)
        slTrailingConstraint_landscape = NSLayoutConstraint(item: secondLabel, attribute: .trailing, relatedBy: .equal, toItem: imageView, attribute: .leadingMargin, multiplier: 1, constant: -20)
        slBottomConstraint_landscape = NSLayoutConstraint(item: secondLabel, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottomMargin, multiplier: 1, constant: 20)
        
        ivTopConstraintToView_landscape = NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .topMargin, multiplier: 1, constant: 20)
        ivBottomConstraint_landscape = NSLayoutConstraint(item: imageView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottomMargin, multiplier: 1, constant: -20)
        ivTrailingConstraint_landscape = NSLayoutConstraint(item: imageView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: -20)
    }

    private func activateConstraints(isLandscape: Bool) {
        print("activateConstraints isLandscape = \(isLandscape)")
        
        ivTopConstraintToView_portrait.isActive = !isLandscape
        ivTopConstraintToLabel_portrait.isActive = !isLandscape
        ivTrailingConstraint_portrait.isActive = !isLandscape
        ivLeadingConstraint_portrait.isActive = !isLandscape
        
        flTopConstraint_portrait.isActive = !isLandscape
        flLeadingConstraint_portrait.isActive = !isLandscape
        flTrailingConstraint_portrait.isActive = !isLandscape
        
        slTopConstraint_portrait.isActive = !isLandscape
        slTrailingConstraint_portrait.isActive = !isLandscape
        
        
        flTopConstraint_landscape.isActive = isLandscape
        flLeadingConstraint_landscape.isActive = isLandscape
        flTrailingConstraint_landscape.isActive = isLandscape
        flBottomConstraint_landscape.isActive = isLandscape
        
        slTopConstraint_landscape.isActive = isLandscape
        slTrailingConstraint_landscape.isActive = isLandscape
        slBottomConstraint_landscape.isActive = isLandscape
        
        ivTopConstraintToView_landscape.isActive = isLandscape
        ivBottomConstraint_landscape.isActive = isLandscape
        ivTrailingConstraint_landscape.isActive = isLandscape
    }
    
    func screenOrientationDidChange() {
        print("screenOrientationDidChange")
        if isConfigured != true {
            print("screenOrientationDidChange is not configured")
            return
        }
        
        print(UIDevice.current.orientation)
        
        switch UIDevice.current.orientation {
        case .portrait, .portraitUpsideDown:
            activateConstraints(isLandscape: false)
        case .landscapeLeft, .landscapeRight:
            activateConstraints(isLandscape: true)
        case .faceUp, .faceDown, .unknown:
            return
        @unknown default:
            return
        }
        //based on the current orientation of the screen change isActive for all constraints.
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        
    }
}

