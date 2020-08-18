//
//  ChooseViewModel.swift
//  photobooth
//
//  Created by Максим Спиридонов on 18.08.2020.
//  Copyright © 2020 Максим Спиридонов. All rights reserved.
//

import UIKit


protocol ChooseViewModelType {
    var collectionView: ChooseCollectionView { get set }
}

final class ChooseViewModel: ChooseViewModelType {
    
    
    var collectionView: ChooseCollectionView
    
    init() {
        collectionView = ChooseCollectionView()
    }
}
