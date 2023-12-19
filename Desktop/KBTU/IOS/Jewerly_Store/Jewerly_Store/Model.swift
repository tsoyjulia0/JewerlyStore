//
//  Model.swift
//  Jewerly_Store
//
//  Created by Юлия Цой on 02.12.2023.
//

import Foundation

struct User {
    var name: String
    var phone: String
    var password: String
}

struct Category {
    let id: Int  // Add this property
    let name: String
    let imageName: String

    init(id: Int, name: String, imageName: String, products: [Product] = []) {
           self.id = id
           self.name = name
           self.imageName = imageName
       }
}

//deded
extension Category {
    static func makeMock() -> [Category] {
        return [
            .init(id: 1, name: "Rings", imageName: "rings"),
            .init(id: 2, name: "Earrings", imageName: "earrings"),
            .init(id: 3, name: "Bracelets", imageName: "bracelets"),
            .init(id: 4, name: "Pendunts", imageName: "pendunts"),
            .init(id: 5, name: "Chains", imageName: "chains"),
            .init(id: 6, name: "Hairpins", imageName: "hairpins")
        ]
    }
}
