//
//  ChooseCollectionViewCell.swift
//  photobooth
//
//  Created by Максим Спиридонов on 18.08.2020.
//  Copyright © 2020 Максим Спиридонов. All rights reserved.
//


import UIKit



class ChooseCollectionViewCell: UICollectionViewCell {
    
    
    static let reuseId = "ChooseCollectionViewCell"
    
    var viewModel: ChooseCollectionViewCellVMType? {
        willSet(viewModel) {
            
            guard let viewModel = viewModel else { return }
            label.text = viewModel.object.name
            
            
            UIView.animate(withDuration: 0.25) {
                if viewModel.isLandscape {
                    self.rotate(angle: 90)
                } else {
                    self.transform = .identity
                }
            }

        }
    }
    
    
    fileprivate let cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 2
        view.backgroundColor = .white
        view.layer.borderColor = UIColor(red: 0.943, green: 0.943, blue: 0.943, alpha: 0.8).cgColor
        return view
    }()
    
    let myImageView: WebImageView = {
        let imageView = WebImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .clear
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    let defaultImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .center
        imageView.image = UIImage(named: "viewer_36x36")
        return imageView
    }()
    
    
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        //        label.font = UIFont.init(name: ".SFUIText-Medium", size: 14)
        return label
    }()
    
    let labelView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.943, green: 0.943, blue: 0.943, alpha: 0.8)
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
    }
    
    fileprivate func setupUI() {
        
        addSubview(cardView)
        cardView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        cardView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        
        
        cardView.addSubview(myImageView)
        myImageView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor).isActive = true
        myImageView.topAnchor.constraint(equalTo: cardView.topAnchor).isActive = true
        myImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor).isActive = true
        myImageView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor).isActive = true
        
        
        
        myImageView.addSubview(labelView)
        labelView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor).isActive = true
        labelView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor).isActive = true
        labelView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor).isActive = true
        labelView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        
        labelView.addSubview(label)
        label.centerYAnchor.constraint(equalTo: labelView.centerYAnchor).isActive = true
        
        label.leadingAnchor.constraint(equalTo: labelView.leadingAnchor, constant: 10).isActive = true
        label.trailingAnchor.constraint(equalTo: labelView.trailingAnchor, constant: -30).isActive = true
        label.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        myImageView.addSubview(defaultImageView)
        defaultImageView.topAnchor.constraint(equalTo: myImageView.topAnchor).isActive = true
        defaultImageView.leadingAnchor.constraint(equalTo: myImageView.leadingAnchor).isActive = true
        defaultImageView.trailingAnchor.constraint(equalTo: myImageView.trailingAnchor).isActive = true
        defaultImageView.bottomAnchor.constraint(equalTo: label.topAnchor).isActive = true
       
    }
    
    override func prepareForReuse() {
        myImageView.image = nil
        label.text = nil
        viewModel = nil
        self.transform = .identity
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 10
    }
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
