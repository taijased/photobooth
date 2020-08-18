//
//  MaskModel.swift
//  photobooth
//
//  Created by Максим Спиридонов on 18.08.2020.
//  Copyright © 2020 Максим Спиридонов. All rights reserved.
//

import Foundation



struct MaskModel {
    let id: String
    let name: String
    let imageName: String
    init(id: String, name: String) {
        self.id = id
        self.name = name
        self.imageName = id
    }
}
