//
//  ProductDetailViewController.swift
//  Jewerly_Store
//
//  Created by Юлия Цой on 16.12.2023.
//

import UIKit

class ProductDetailViewController: UIViewController {

    @IBOutlet weak var productDetailsPrice: UILabel!
    @IBOutlet weak var productDetailsName: UILabel!
    @IBOutlet weak var productDetailsDesc: UILabel!
    @IBOutlet weak var productDetailsImage: UIImageView!
    
    var selectedProduct: Product = .init(id: 0, name: "", price: "", imageName: "", categoryID: 1, description: "") {
        didSet {
            let selectedProduct = selectedProduct
        }
    }
//
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        productDetailsDesc.numberOfLines = 0
        productDetailsDesc.lineBreakMode = .byWordWrapping
    }
    
    private func configureView() {
        productDetailsName?.text = selectedProduct.name
        productDetailsDesc?.text = selectedProduct.description
        productDetailsPrice?.text = selectedProduct.price
        productDetailsImage?.image = UIImage(named: selectedProduct.imageName)
    }
    

    

}
