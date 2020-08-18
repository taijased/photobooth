//
//  PhotoTopControlsView.swift
//  photobooth
//
//  Created by Максим Спиридонов on 18.08.2020.
//  Copyright © 2020 Максим Спиридонов. All rights reserved.
//


import UIKit

enum PhotoTopControlsViewEvents {
    case done
    case share
}


protocol PhotoTopControlsViewDelegate: class {
    func onEvent(type: PhotoTopControlsViewEvents)
}

final class PhotoTopControlsView: UIView {
    
    
    weak var delegate: PhotoTopControlsViewDelegate?
    
    
    fileprivate let opacityView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.init(hexValue: "#000000", alpha: 0.4)
        return view
    }()
    
    fileprivate let doneButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.layer.cornerRadius = 28
        button.layer.masksToBounds = false
        button.isUserInteractionEnabled = true
        button.setTitle("Готово", for: .normal)
        button.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
        return button
    }()
    
    fileprivate let shareButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.layer.cornerRadius = 13
        button.layer.masksToBounds = false
        button.isUserInteractionEnabled = true
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
        button.tintColor = .white
        return button
    }()
    
    
    
    @objc func doneButtonTapped(_ sender: UIButton) {
        print(#function)
        sender.flash()
        delegate?.onEvent(type: .done)
    }
    
    @objc func shareButtonTapped(_ sender: UIButton) {
        print(#function)
        sender.flash()
        delegate?.onEvent(type: .share)
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
        
        addSubview(doneButton)
        doneButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        doneButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        doneButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        doneButton.heightAnchor.constraint(equalToConstant: 21).isActive = true
        
        addSubview(shareButton)
        shareButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        shareButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        shareButton.widthAnchor.constraint(equalToConstant: 17).isActive = true
        shareButton.heightAnchor.constraint(equalToConstant: 22).isActive = true

    }
    
}
