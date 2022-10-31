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
    
    private var portraitConstraints = [NSLayoutConstraint]()
    private var landscapeConstraints = [NSLayoutConstraint]()
    
    private var ivHeightConstraint = NSLayoutConstraint()
    private var ivWidthConstraint = NSLayoutConstraint()

    private var isConfigured: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(forName: UIDevice.orientationDidChangeNotification, object: .none, queue: .none) { [weak self] _ in
            print("orientationDidChangeNotification")
            
            self?.reconfigureConstraints()
            //self?.view.setNeedsUpdateConstraints()
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupView()
    }
    
    private func setupView() {
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
        let ivTopConstraintToView_portrait = NSLayoutConstraint(item: imageView, attribute: .topMargin, relatedBy: .greaterThanOrEqual, toItem: view, attribute: .centerYWithinMargins, multiplier: 1, constant: 10)
        ivTopConstraintToView_portrait.priority = .defaultLow
        let ivTopConstraintToLabel_portrait = NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .lessThanOrEqual, toItem: firstLabel, attribute: .bottomMargin, multiplier: 1, constant: 10)
        ivTopConstraintToLabel_portrait.priority = .required
        
        portraitConstraints.append(contentsOf: [
            ivTopConstraintToView_portrait,
            ivTopConstraintToLabel_portrait,
            NSLayoutConstraint(item: imageView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: -20),
            NSLayoutConstraint(item: imageView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: firstLabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .topMargin, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: firstLabel, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: firstLabel, attribute: .trailing, relatedBy: .equal, toItem: secondLabel, attribute: .leadingMargin, multiplier: 1, constant: -20),
            NSLayoutConstraint(item: secondLabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .topMargin, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: secondLabel, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: -20)
        ])
    }
    
    private func configureLandscapeConstraints() {
        landscapeConstraints.append(contentsOf: [
            NSLayoutConstraint(item: firstLabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .topMargin, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: firstLabel, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: firstLabel, attribute: .trailing, relatedBy: .equal, toItem: secondLabel, attribute: .leadingMargin, multiplier: 1, constant: -20),
            NSLayoutConstraint(item: firstLabel, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottomMargin, multiplier: 1, constant: 20),
            
            NSLayoutConstraint(item: secondLabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .topMargin, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: secondLabel, attribute: .trailing, relatedBy: .equal, toItem: imageView, attribute: .leadingMargin, multiplier: 1, constant: -20),
            NSLayoutConstraint(item: secondLabel, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottomMargin, multiplier: 1, constant: 20),
            
            NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .topMargin, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: imageView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottomMargin, multiplier: 1, constant: -20),
            NSLayoutConstraint(item: imageView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: -20)
        ])
    }

    private func activateConstraints(isLandscape: Bool) {
        print("activateConstraints isLandscape = \(isLandscape)")
        
        if isLandscape {
            NSLayoutConstraint.deactivate(portraitConstraints)
            
            NSLayoutConstraint.activate(landscapeConstraints)
        } else {
            NSLayoutConstraint.deactivate(landscapeConstraints)
            
            NSLayoutConstraint.activate(portraitConstraints)
        }
    }
    
    private func reconfigureConstraints() {
        print("screenOrientationDidChange")
        if isConfigured != true {
            print("screenOrientationDidChange has not been configured")
            return
        }
        
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
    }
    
    override func updateViewConstraints() {
        switch UIDevice.current.orientation {
        case .portrait, .portraitUpsideDown:
            NSLayoutConstraint.deactivate(landscapeConstraints)
            NSLayoutConstraint.activate(portraitConstraints)
            
            super.updateViewConstraints()
        case .landscapeLeft, .landscapeRight:
            NSLayoutConstraint.deactivate(portraitConstraints)
            NSLayoutConstraint.activate(landscapeConstraints)
            
            super.updateViewConstraints()
        case .faceUp, .faceDown, .unknown:
            super.updateViewConstraints()
            return
        @unknown default:
            super.updateViewConstraints()
            return
        }
    }
    
    //не работает даже при вызове reconfigureConstraints во viewWillAppear
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        //reconfigureConstraints()
    }
}

