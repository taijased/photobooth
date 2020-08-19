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
    
    fileprivate let visualEffectView: UIVisualEffectView = {

        let view = UIVisualEffectView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.effect = nil
        return view
    }()
    
    fileprivate let imageView: WebImageView = {
        let imageView = WebImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    
    
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, image: UIImage) {
        self.imageView.image = image
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI() {
        
        view.backgroundColor = .clear
        
        
        view.addSubview(visualEffectView)
        visualEffectView.fillSuperview()
        visualEffectView.effect = UIBlurEffect(style: .extraLight)
        
        view.addSubview(controlsView)
        controlsView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        controlsView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        controlsView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        controlsView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        
        controlsView.delegate = self
        
        
        view.addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 429).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 320).isActive = true
        
        
        
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
