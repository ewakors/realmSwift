//
//  ProjectsViewController.swift
//  realm2
//
//  Created by Ewa Korszaczuk on 08/05/2019.
//  Copyright © 2019 Ewa Korszaczuk. All rights reserved.
//

import UIKit
import RealmSwift

class ProjectsViewController: UIViewController {
    
    //    let realm: Realm
    //    let santaItems: Results<santa>
    ////    let elfItem: Results<elf4>
    //    let reindeerItem: Results<reindeer2>
    ////    let addressItem: Results<address>
    ////    let areaItem: Results<area>
    ////    let giftItem: Results<gift>
    ////    let childrenItem: Results<children1>
    //
    //    var notificationToken: NotificationToken?
    //    var tableView = UITableView()
    //
    ////    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    ////        let syncConfig = SyncConfiguration(user: SyncUser.current!, realmURL: Constants.REALM_URL)
    ////        self.realm = try! Realm(configuration: Realm.Configuration(syncConfiguration: syncConfig))
    ////
    ////        self.santaItems = realm.objects(santa.self)
    ////        self.elfItem = realm.objects(elf4.self).filter("id=4")
    ////        self.reindeerItem = realm.objects(reindeer2.self)
    ////        self.addressItem = realm.objects(address.self).filter("id_area=32")
    ////        self.areaItem = realm.objects(area.self)
    ////        self.giftItem = realm.objects(gift.self)
    ////        self.childrenItem = realm.objects(children1.self)
    ////
    ////        super.init(nibName: nil, bundle: nil)
    ////    }
    //    init(santa: Results<santa>, reindeerItem: Results<reindeer2>) {
    //                let syncConfig = SyncConfiguration(user: SyncUser.current!, realmURL: Constants.REALM_URL)
    //                self.realm = try! Realm(configuration: Realm.Configuration(syncConfiguration: syncConfig))
    ////        self.realm = realm
    //        self.santaItems = santa
    //        self.reindeerItem = reindeerItem
    //        super.init(nibName: nil, bundle: nil)
    //    }
    //
    //    required init?(coder aDecoder: NSCoder) {
    //        fatalError("init(coder:) has not been implemented")
    //    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(Realm.Configuration.defaultConfiguration.fileURL)
        if let realmPath = Realm.Configuration.defaultConfiguration.fileURL?.lastPathComponent {
            do {
                let attributes = try FileManager.default.attributesOfItem(atPath:realmPath)
                if let fileSize = attributes[FileAttributeKey.size] as? Double {
                    
                    print("database size: \(fileSize)")                }
            }
            catch (let error) {
                print("FileManager Error: \(error)")
            }
        }
      
     
//        let newSanta = santa()
//        newSanta.id = 2
//        newSanta.name = "santa22"
//        try! realm.write {
//            realm.add(newSanta)
//        }
        
        
        //        for i in 0..<addressItem.count {
        //            let string = addressItem[i].street
        //            let needle = "24"
        //            let needle2 = "44"
        //
        //            if string.contains(needle) || string.contains(needle2) {
        //                try! realm.write {
        //                    print("elf: \(addressItem[i].street) ")
        //                    //elfItem[i].reaindeer.append(reindeerItem[j])
        //                }
        //            }
        //        }
        
        //        for i in 0..<elfItem.count {
        //            for j  in 0..<reindeerItem.count {
        //                if elfItem[i].id == reindeerItem[j].id_elf.value {
        //                    try! realm.write {
        //                        print("elf: \(elfItem[i].name) \(reindeerItem[j].name)")
        //                        //elfItem[i].reaindeer.append(reindeerItem[j])
        //                    }
        //                }
        //            }
        //        }
        
    }
    
    @IBAction func realmButtonAction(_ sender: Any) {
        let syncConfig = SyncConfiguration(user: SyncUser.current!, realmURL: Constants.REALM_URL)
        let realm: Realm = try! Realm(configuration: Realm.Configuration(syncConfiguration: syncConfig))
        
        let santaItems: Results<santa>
        let elfItem: Results<elf>
        let reindeerItem: Results<reindeer2>
        let addressItem: Results<address>
        let areaItem: Results<area>
        let giftItem: Results<gift>
        let childrenItem: Results<children1>
        
        elfItem = realm.objects(elf.self)
        reindeerItem = realm.objects(reindeer2.self)
        areaItem = realm.objects(area.self)
        addressItem = realm.objects(address.self)
        childrenItem = realm.objects(children1.self)
        santaItems = realm.objects(santa.self)
        //select from gift
        let s = Stopwatch()
        giftItem = realm.objects(gift.self)
        print("\(s.elapsedTimeString())")

       //add new children
//        let s = Stopwatch()
//        let newGift = gift()
//        newGift.id = 564
//        let newChildren = children1()
//        newChildren.id = 25001
//        newChildren.name = "Ania"
//        newChildren.surname = "Kowalska"
//        newChildren.age = 18
//        newChildren.gender = "female"
//        newChildren.gift.append(newGift)
//        try! realm.write {
//            realm.add(newChildren)
//        }
//        print("\(s.elapsedTimeString())")

        //add new reindeer
//        let s = Stopwatch()
//        let newReinder = reindeer2()
//        newReinder.id = 2001
//        newReinder.name = "Elfik"
//        newReinder.id_elf.value = 23
//        newReinder.id_santa.value = 1
//        try! realm.write {
//            realm.add(newReinder)
//        }
//        print("\(s.elapsedTimeString())")

        //add new gift
        //        let s = Stopwatch()
//        let newGift = gift()
//        newGift.id = 30001
//        newGift.name = "lalka"
//        newGift.company_name = "barbie"
//        newGift.is_given = false
//        newGift.give_date = 1388010342
//        newGift.weight = 3.4
//        newGift.id_children.value = 2345
//        newGift.id_address.value = 54
        //        try! realm.write {
        //            realm.add(newGift)
        //        }
        //        print("\(s.elapsedTimeString())")

        //select name, company_name, is_given from gift where id= 2678
//        let s = Stopwatch()
//        giftItem = realm.objects(gift.self).filter("id=2678")
//        print("\(s.elapsedTimeString())")
        
//        select from gift where id_address = 240 && id_children = 16513
        //        let s = Stopwatch()
//                giftItem = realm.objects(gift.self).filter("id_address=240 AND id_children = 16513")
        //        print("\(s.elapsedTimeString())")

//        SELECT * FROM gift where is_given = FALSE || give_date = 1387948873
        //        let s = Stopwatch()
//                        giftItem = realm.objects(gift.self).filter("is_given = false OR give_date = 1387948873")
        //        print("\(s.elapsedTimeString())")
        
//        SELECT * FROM gift where is_given = \"TRUE\" and give_date = 1387948873 and id_address = 8400 and id_children = 13581
        //        let s = Stopwatch()
//                                giftItem = realm.objects(gift.self).filter("is_given = true and give_date = 1387948873 and id_address = 8400 and id_children = 13581")
        //        print("\(s.elapsedTimeString())")
        
//        SELECT g.name, c.name FROM gift g, children c where c.id = g.id_children and c.id = 4683
        //        let s = Stopwatch()
//                                        childrenItem = realm.objects(children.self).filter("id = 4683 and gift.id_children = 4683")
        //        print("\(s.elapsedTimeString())")
        
        //        let s = Stopwatch()
        //        for i in 0..<addressItem.count {
        //            let string = addressItem[i].street
        //            let needle = "24"
        //            let needle2 = "44"
        //
        //            if string.contains(needle) || string.contains(needle2) {
        //                try! realm.write {
        //                    print("elf: \(addressItem[i].street) ")
        //                    //elfItem[i].reaindeer.append(reindeerItem[j])
        //                }
        //            }
        //        }
        //        print("\(s.elapsedTimeString())")

        for i in 0..<addressItem.count {
            for j  in 0..<giftItem.count {
                if addressItem[i].id == giftItem[j].id_address.value {
                    try! realm.write {
                        //                                print("elf: \(elfItem[i].name) \(reindeerItem[j].name)")
                        addressItem[i].gift.append(giftItem[j])
                    }
                }
            }
        }
//        for i in 0..<childrenItem.count {
//            for j  in 0..<giftItem.count {
//                if childrenItem[i].id == giftItem[j].id_children.value {
//                    try! realm.write {
//                        //                                print("elf: \(elfItem[i].name) \(reindeerItem[j].name)")
//                        childrenItem[i].gift.append(giftItem[j])
//                    }
//                }
//            }
//        }
        
        
    }
    
}
