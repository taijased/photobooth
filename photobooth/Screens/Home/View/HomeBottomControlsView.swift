//
//  HomeBottomControlsView.swift
//  photobooth
//
//  Created by Максим Спиридонов on 18.08.2020.
//  Copyright © 2020 Максим Спиридонов. All rights reserved.
//


import UIKit

enum BottomControlsEvents {
    case takePhoto
    case more
}


protocol HomeBottomControlsViewDelegate: class {
    func onEvent(type: BottomControlsEvents)
}

final class HomeBottomControlsView: UIView {
    
    
    weak var delegate: HomeBottomControlsViewDelegate?
    
    
    fileprivate let opacityView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.init(hexValue: "#000000", alpha: 0.4)
        return view
    }()
    
    fileprivate let takePhotoButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.layer.cornerRadius = 28
        button.layer.masksToBounds = false
        button.isUserInteractionEnabled = true
        button.setImage(UIImage(named: "takePhoto"), for: .normal)
        button.addTarget(self, action: #selector(takePhotoButtonTapped), for: .touchUpInside)
        return button
    }()
    
    fileprivate let moreButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.layer.cornerRadius = 13
        button.layer.masksToBounds = false
        button.isUserInteractionEnabled = true
        button.setImage(UIImage(named: "more"), for: .normal)
        button.addTarget(self, action: #selector(moreButtonTapped), for: .touchUpInside)
        return button
    }()
    

    
    @objc func takePhotoButtonTapped(_ sender: UIButton) {
        sender.flash()
        delegate?.onEvent(type: .takePhoto)
    }
    
    @objc func moreButtonTapped(_ sender: UIButton) {
        sender.flash()
        delegate?.onEvent(type: .more)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    fileprivate func setupUI() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        addSubview(opacityView)
        opacityView.fillSuperview()
        
        addSubview(takePhotoButton)
        takePhotoButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        takePhotoButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        takePhotoButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        takePhotoButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
      
        addSubview(moreButton)
        moreButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        moreButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
        moreButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        moreButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
}
