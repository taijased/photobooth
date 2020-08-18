//
//  PhotoViewController.swift
//  photobooth
//
//  Created by Максим Спиридонов on 18.08.2020.
//  Copyright © 2020 Максим Спиридонов. All rights reserved.
//

import UIKit

final class PhotoViewController: UIViewController {
    
    
    
    
    fileprivate let controlsView: PhotoTopControlsView = PhotoTopControlsView()
    
    fileprivate let opacityTopView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        return view
    }()
    
    fileprivate let opacityBottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        return view
    }()
    
    fileprivate let opacityLeftView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        return view
    }()
    
    fileprivate let opacityRightView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    
    
    fileprivate func setupUI() {
        
        view.backgroundColor = .white
        view.addSubview(opacityBottomView)
        opacityBottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        opacityBottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        opacityBottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        opacityBottomView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        
        view.addSubview(opacityTopView)
        opacityTopView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        opacityTopView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        opacityTopView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        opacityTopView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        view.addSubview(opacityRightView)
        opacityRightView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        opacityRightView.bottomAnchor.constraint(equalTo: opacityBottomView.topAnchor).isActive = true
        opacityRightView.topAnchor.constraint(equalTo: opacityTopView.bottomAnchor).isActive = true
        opacityRightView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(opacityLeftView)
        opacityLeftView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        opacityLeftView.bottomAnchor.constraint(equalTo: opacityBottomView.topAnchor).isActive = true
        opacityLeftView.topAnchor.constraint(equalTo: opacityTopView.bottomAnchor).isActive = true
        opacityLeftView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        
        view.addSubview(controlsView)
        controlsView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        controlsView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        controlsView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        controlsView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        
        
        
        controlsView.delegate = self
        
        
        
    }
}



extension PhotoViewController: PhotoTopControlsViewDelegate {
    func onEvent(type: PhotoTopControlsViewEvents) {
        switch type {
        case .done:
            self.dismiss(animated: true, completion: nil)
        case .share:
            let image = UIImage(named: "more")
            let imageToShare = [ image! ]
            let activityViewController = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]
            
            self.present(activityViewController, animated: true, completion: nil)
        }
    }
}
