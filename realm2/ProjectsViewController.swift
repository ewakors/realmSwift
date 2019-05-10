//
//  ProjectsViewController.swift
//  realm2
//
//  Created by Ewa Korszaczuk on 08/05/2019.
//  Copyright © 2019 Ewa Korszaczuk. All rights reserved.
//

import UIKit
import RealmSwift

class ProjectsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let realm: Realm
    let santaItems: Results<santa>
    let elfItem: Results<elf>
    let reindeerItem: Results<reindeer2>
    let addressItem: Results<address>
    let areaItem: Results<area>
    let giftItem: Results<gift>
    let childrenItem: Results<children1>

    var notificationToken: NotificationToken?
    var tableView = UITableView()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        let syncConfig = SyncConfiguration(user: SyncUser.current!, realmURL: Constants.REALM_URL)
        self.realm = try! Realm(configuration: Realm.Configuration(syncConfiguration: syncConfig))
//        self.items = realm.objects(santaClaus.self).sorted(byKeyPath: "timestamp", ascending: false)
        self.santaItems = realm.objects(santa.self)
        self.elfItem = realm.objects(elf.self).filter("id = 98")
        self.reindeerItem = realm.objects(reindeer2.self)
        self.addressItem = realm.objects(address.self)
        self.areaItem = realm.objects(area.self)
        self.giftItem = realm.objects(gift.self)
        self.childrenItem = realm.objects(children1.self)
//        SELECT g.name, c.name FROM gift g, children c where c.id = g.id_children and c.id = 4683
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("project:")
        // Do any additional setup after loading the view.
        title = "Things ToDo!"
        view.addSubview(tableView)
        tableView.frame = self.view.frame
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
        print(Realm.Configuration.defaultConfiguration.fileURL)

        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(leftBarButtonDidClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(rightBarButtonDidClick))

        print("santa: \(santaItems)")
        print("elf: \(elfItem)")
        print("reindeer: \(reindeerItem)")
        print("address: \(addressItem)")
        print("area: \(areaItem)")
        print("gift: \(giftItem)")
        print("children: \(childrenItem)")

//        notificationToken = elfItem.observe { [weak self] (changes) in
//            guard let tableView = self?.tableView else { return }
//
//            switch changes {
//            case .initial:
//                // Results are now populated and can be accessed without blocking the UI
//                tableView.reloadData()
//            case .update(_, let deletions, let insertions, let modifications):
//                // Query results have changed, so apply them to the UITableView
//                tableView.beginUpdates()
//                tableView.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0) }),
//                                     with: .automatic)
//                tableView.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0)}),
//                                     with: .automatic)
//                tableView.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0) }),
//                                     with: .automatic)
//                tableView.endUpdates()
//            case .error(let error):
//                // An error occurred while opening the Realm file on the background worker thread
//                fatalError("\(error)")
//            }
//        }
    }
    
    deinit {
        notificationToken?.invalidate()
    }
    
    @objc func leftBarButtonDidClick() {
        let alertController = UIAlertController(title: "Add Item", message: "", preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Save", style: .default, handler: {
            alert -> Void in
            let textField = alertController.textFields![0] as UITextField
            let item = santa()
            item.name = textField.text ?? ""
            try! self.realm.write {
                self.realm.add(item)
            }
            // do something with textField
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alertController.addTextField(configurationHandler: {(textField : UITextField!) -> Void in
            textField.placeholder = "New Item Text"
        })
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func rightBarButtonDidClick() {
        let alertController = UIAlertController(title: "Logout", message: "", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Yes, Logout", style: .destructive, handler: {
            alert -> Void in
            SyncUser.current?.logOut()
            self.navigationController?.setViewControllers([ViewController()], animated: true)
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reindeerItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") ?? UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.selectionStyle = .none
        let item = reindeerItem[indexPath.row]
        cell.textLabel?.text = item.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = reindeerItem[indexPath.row]
        try! realm.write {
//            item.isDone = !item.isDone
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        let item = reindeerItem[indexPath.row]
        try! realm.write {
            realm.delete(item)
        }
    }
    
    
}
