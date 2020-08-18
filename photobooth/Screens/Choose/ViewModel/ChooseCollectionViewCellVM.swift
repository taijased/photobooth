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
}



final class ChooseCollectionViewCellVM: ChooseCollectionViewCellVMType, CollectionViewCellType {
    var indexPath: IndexPath
    let object: MaskModel
    
    init(cell: MaskModel, indexPath: IndexPath) {
        self.object = cell
        self.indexPath = indexPath
    }
}
