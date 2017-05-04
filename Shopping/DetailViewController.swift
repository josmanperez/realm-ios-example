//
//  DetailViewController.swift
//  Shopping
//
//  Created by Amit Bijlani on 10/27/16.
//  Copyright © 2016 Teamtreehouse. All rights reserved.
//

import UIKit
import RealmSwift

protocol DetailViewControllerProtocol: class {
    func selected(category: Category)
}


class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var qtyTextField: UITextField!
    @IBOutlet weak var categoryButton: UIButton!
    
    var detailItem: Item?
    let realm = try! Realm()
    var selectedCategory: Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    
    func configureView() {
        if let item = detailItem {
            titleTextField.text = item.title
            qtyTextField.text = "\(item.qty)"
            categoryButton.setTitle(item.category?.title, for: .normal)
        }
    }
    
    // MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCategories" {
            let controller = segue.destination as! CategoryTableViewController
            controller.selectedCategory = detailItem?.category
            controller.delegate = self
        }
    }
    
    
    // MARK: - IBAction
    
    @IBAction func doneTapped(_ sender: AnyObject) {
        guard let title = titleTextField.text,
            let qty = Int(qtyTextField.text!) else { dismiss(animated: true); return }
        
        if detailItem != nil {
            updateItem(with: title, qty: qty)
        } else {
            insertItem(with: title, qty: qty)
        }
        
        
        
        dismiss(animated: true)
    }
    
    func dismiss(animated: Bool) {
        _ = navigationController?.popViewController(animated: animated)
    }
    
    func insertItem(with title: String, qty: Int) {
        let item = Item()
        item.title = title
        item.qty = qty
        item.category = selectedCategory
        do {
            try realm.write {
                realm.add(item)
            }
        } catch {
            print(error)
        }
    }
    
    func updateItem(with title: String, qty: Int) {
        if let item = detailItem {
            do {
                try realm.write {
                    item.title = title
                    item.qty = qty
                    item.category = selectedCategory
                }
            } catch {
                print(error)
            }
        }
    }
}

extension DetailViewController: DetailViewControllerProtocol {
    
    func selected(category: Category) {
        selectedCategory = category
        categoryButton.setTitle(category.title, for: .normal)
        dismiss(animated: true)
    }
    
    
    
    
}













