//
//  CartViewController.swift
//  Jewerly_Store
//
//  Created by Юлия Цой on 18.12.2023.
//

import UIKit

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CartTableViewCellDelegate{
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var overallPriceLabel: UILabel!
    
    var cartProducts: [Product] = Product.makeMock()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        updateUI()
        updateTotalPriceLabel()
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(.init(nibName: String(describing: CartTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: CartTableViewCell.self))
    }

    private func updateUI() {
        cartProducts = CartManager.shared.getCartProducts()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return cartProducts.count
        }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CartTableViewCell.self), for: indexPath) as? CartTableViewCell else {
            return UITableViewCell()
        }

        let product = cartProducts[indexPath.row]
        cell.configure(with: product, index: indexPath.row)
        cell.delegate = self

        return cell
    }
    
    func removeProduct(at index: Int) {
        CartManager.shared.removeProductFromCart(at: index)
        updateUI()
    }
    
    func didTapRemoveButton(at index: Int) {
        removeProduct(at: index)
        showAlert(message: "Product has been removed")
        updateUI()
        updateTotalPriceLabel()
        tableView.reloadData()
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Done!", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

    func calculateTotalPrice() -> String {
        var totalPrice: Double = 0.0
            for product in cartProducts {
                if let price = Double(product.price) {
                    totalPrice += price
                    print (totalPrice)
                }
            }
        let formattedTotalPrice = String(format: "%.2f", totalPrice)
        return formattedTotalPrice
    }
    
    func updateTotalPriceLabel() {
        let totalPrice = calculateTotalPrice()
        overallPriceLabel.text = "$\(totalPrice)"
    }
}
