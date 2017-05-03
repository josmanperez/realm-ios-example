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

   
    // MARK: - Segues
    
    @IBAction func doneTapped(_ sender: AnyObject) {
        guard let title = titleTextField.text,
            let qty = Int(qtyTextField.text!) else { dismiss(animated: true); return }

        let realm = try! Realm()
        let item = Item()
        item.title = title
        item.qty = qty
        
        do {
            try realm.write {
                realm.add(item)
            }
        } catch {
            print(error)
        }
        
        dismiss(animated: true)
    }

    func dismiss(animated: Bool) {
        _ = navigationController?.popViewController(animated: animated)
    }
}














