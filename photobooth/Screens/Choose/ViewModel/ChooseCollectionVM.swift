//
//  ChooseCollectionVM.swift
//  photobooth
//
//  Created by Максим Спиридонов on 18.08.2020.
//  Copyright © 2020 Максим Спиридонов. All rights reserved.
//


import UIKit


protocol CollectionViewVMType {
    
    associatedtype CollectionViewCellVMType
    associatedtype CellModel
    
    var minimumInteritemSpacingForSectionAt: CGFloat { get }
    var minimumLineSpacingForSectionAt: CGFloat { get }
    func sizeForItemAt(_ size: CGSize) -> CGSize
    func numberOfRows() -> Int
    func viewModelForSelectedRow() -> CellModel?
    func selectItem(atIndexPath indexPath: IndexPath)
    var onReloadData: (() -> Void)? { get set }
    func isEmpty() -> Bool
    func cellViewModel(forIndexPath indexPath: IndexPath) -> CollectionViewCellVMType?
    
}


extension CollectionViewVMType {
    
}


protocol CollectionViewCellType {
    var indexPath: IndexPath { get }
}


class ChooseCollectionVM: CollectionViewVMType {

    
    typealias CollectionViewCellVMType = ChooseCollectionViewCellVMType
    typealias CellModel = MaskModel
    
    var onReloadData: (() -> Void)?
    private var selectedIndexPath: IndexPath?
    
    var minimumInteritemSpacingForSectionAt: CGFloat = 12.0
    var minimumLineSpacingForSectionAt: CGFloat = 12.0
    
    
    var cells: [CellModel]?
    
    
    init() {
        fetchCells()
    }
    
    fileprivate func fetchCells() {
        cells = [
            MaskModel(id: "Sphere", name: "Sphere"),
            MaskModel(id: "Circle", name: "Circle"),
            MaskModel(id: "Sphere", name: "Sphere"),
            MaskModel(id: "Circle", name: "Circle"),
            MaskModel(id: "Sphere", name: "Sphere"),
            MaskModel(id: "Circle", name: "Circle"),
            MaskModel(id: "Sphere", name: "Sphere"),
            MaskModel(id: "Circle", name: "Circle"),
        ]
    }
    
    
    func sizeForItemAt(_ size: CGSize) -> CGSize {
        return CGSize(width: 160.0, height: 140.0)
    }
    
    
    func isEmpty() -> Bool {
        return cells?.isEmpty ?? true
    }
    
    func numberOfRows() -> Int {
        return cells?.count ?? 0
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> CollectionViewCellVMType? {
        guard let cells = cells else { return nil }
        let cell = cells[indexPath.row]
        return ChooseCollectionViewCellVM(cell: cell, indexPath: indexPath)
    }
    
    func viewModelForSelectedRow() -> CellModel? {
        guard let selectedIndexPath = selectedIndexPath, let cells = cells else { return nil }
        return cells[selectedIndexPath.row]
    }
    
    func selectItem(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
}

