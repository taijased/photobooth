//
//  HomeViewModel.swift
//  photobooth
//
//  Created by Максим Спиридонов on 18.08.2020.
//  Copyright © 2020 Максим Спиридонов. All rights reserved.
//

import Foundation



protocol HomeViewModelDelegate: class {
    func navigationTo(to: HomeNavigation)
}

protocol HomeViewModelType {
    var bottomControls: HomeBottomControlsView { get set }
    var delegate: HomeViewModelDelegate? { get set }
}

class HomeViewModel {
    
    let bottomControls: HomeBottomControlsView = HomeBottomControlsView()
    var delegate: HomeViewModelDelegate?
    
    init() {
        bottomControls.delegate = self
        
    }
}


//MARK: - HomeBottomControlsViewDelegate
extension HomeViewModel: HomeBottomControlsViewDelegate {
    func onEvent(type: BottomControlsEvents) {
        switch type {
        case .takePhoto:
            delegate?.navigationTo(to: .photo)
        case .more:
            delegate?.navigationTo(to: .choose)
        }
    }
}
