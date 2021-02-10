//
//  ViewController.swift
//  Firebase101
//
//  Created by Noah on 2021/02/06.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    let db = Database.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateLabel()
    }

    func updateLabel() {
        db.child("firstData").observeSingleEvent(of: .value) { snapshot in
            print("---> \(snapshot)")

            let value = snapshot.value as? String ?? ""

            DispatchQueue.main.async {
                self.dataLabel.text = value
            }
        }
    }
}

