//
//  MasterViewController
//  evergentbilling
//
//  Created by Aminul Hasan on 11/2/18.
//  Copyright © 2018 Evergent. All rights reserved.
//

import UIKit
import StoreKit
import RxSwift

class MasterViewController: UITableViewController, IProductsView {

  let showDetailSegueIdentifier = "showDetail"
  var presenter: IProductPresenter? = nil
  
  override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
    if identifier == showDetailSegueIdentifier {
      guard let indexPath = tableView.indexPathForSelectedRow else {
        return false
      }
      
      let product = self.presenter?.getCurrentProducts()[(indexPath as NSIndexPath).row]
      
        return (self.presenter?.isStorePurchased((product?.sku)!))!
    }
    
    return true
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == showDetailSegueIdentifier {
      guard let indexPath = tableView.indexPathForSelectedRow else { return }
      
      let product = self.presenter?.getCurrentProducts()[(indexPath as NSIndexPath).row]
      
        if let name = resourceNameForProductIdentifier((product?.sku)!),
             let detailViewController = segue.destination as? DetailViewController {
        let image = UIImage(named: name)
        detailViewController.image = image
      }
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Products"
    
    refreshControl = UIRefreshControl()
    refreshControl?.addTarget(self, action: #selector(MasterViewController.reload), for: .valueChanged)
    
    let restoreButton = UIBarButtonItem(title: "Restore",
                                        style: .plain,
                                        target: self,
                                        action: #selector(MasterViewController.restoreTapped(_:)))
    navigationItem.rightBarButtonItem = restoreButton
    
    NotificationCenter.default.addObserver(self, selector: #selector(MasterViewController.handlePurchaseNotification(_:)),
                                           name: .IAPHelperPurchaseNotification,
                                           object: nil)
    
    self.presenter = ProductsPresenter(self)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    reload()
  }
  
  @objc func reload() {
    self.presenter?.showProducts()
  }
  
  @objc func restoreTapped(_ sender: AnyObject) {
    StoreRepository.store.restorePurchases()
  }
    
    func reloadTable(products: [UIProduct]) {
        self.tableView.reloadData()
    }

    func endRefreshing() {
        self.refreshControl?.endRefreshing()
    }

  @objc func handlePurchaseNotification(_ notification: Notification) {
    guard
      let productID = notification.object as? String,
      let index = self.presenter?.getCurrentProducts().index(where: { product -> Bool in
        product.sku == productID
      })
    else { return }

    tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .fade)
  }
}

// MARK: - UITableViewDataSource

extension MasterViewController {
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.presenter?.getCurrentProducts().count ?? 0
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ProductCell
    
    let product = self.presenter?.getCurrentProducts()[(indexPath as NSIndexPath).row]
    
    cell.product = product
    
    cell.buyButtonHandler = { product in
      self.presenter?.buyProduct(sku: product.sku)
    }
    
    return cell
  }
}
