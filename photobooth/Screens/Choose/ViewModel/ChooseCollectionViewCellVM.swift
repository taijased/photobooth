//
//  ChooseCollectionViewCellVM.swift
//  photobooth
//
//  Created by Максим Спиридонов on 18.08.2020.
//  Copyright © 2020 Максим Спиридонов. All rights reserved.
//


import UIKit

protocol ChooseCollectionViewCellVMType: class {
    var object: MaskModel { get }
    var isLandscape: Bool { get }
}



final class ChooseCollectionViewCellVM: ChooseCollectionViewCellVMType, CollectionViewCellType {
    var indexPath: IndexPath
    let object: MaskModel
    var isLandscape: Bool
    
    init(cell: MaskModel, indexPath: IndexPath, isLandscape: Bool) {
        self.object = cell
        self.indexPath = indexPath
        self.isLandscape = isLandscape
    }
}
