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
//        childrenItem = realm.objects(children1.self)
        santaItems = realm.objects(santa.self)
//                for i in 0..<areaItem.count {
//                    for j  in 0..<addressItem.count {
//                        if areaItem[i].id == addressItem[j].id_area.value {
//                            try! realm.write {
//                                areaItem[i].address.append(addressItem[j])
//                            }
//                        }
//                    }
//                }
        
        //select from gift
//        let s = Stopwatch()
//        giftItem = realm.objects(gift.self)
//        print("\(s.elapsedTimeString())")
  
        //add new children
//        let s = Stopwatch()
//        let newChildren = children1()
//        newChildren.id = 25020
//        newChildren.name = "Janjanjanjanjanjanjanjanjanjna"
//        newChildren.surname = "Kowalsk44444a"
//        newChildren.age = 18
//        newChildren.gender = "male"
//        if let addGift = addGift {
//            newChildren.gift.append(addGift)
//            try! realm.write {
//                realm.add(newChildren)
//            }
//            print("\(s.elapsedTimeString())")
//        }
        
        
        //add new reindeer
//        let s = Stopwatch()
//        let newReinder = reindeer2()
//        newReinder.id = reindeerItem.count + 1
//        newReinder.name = "Nowy elf"
//        newReinder.id_elf.value = 12
//        newReinder.id_santa.value = 1
//        try! realm.write {
//            realm.add(newReinder)
//        }
//        print("\(s.elapsedTimeString())")

        
        //add new gift
//        let s = Stopwatch()
//        let newGift = gift()
//        newGift.id = giftItem.count + 1
//        newGift.name = "rower dzieciecy"
//        newGift.company_name = "bmx"
//        newGift.is_given = true
//        newGift.give_date = 1388010742
//        newGift.weight = 8.4
//        newGift.id_children.value = 2458
//        newGift.id_address.value = 56
//        try! realm.write {
//            realm.add(newGift)
//        }
//        print("\(s.elapsedTimeString())")
        
//        select name, company_name, is_given from gift where id= 2678
//                let s = Stopwatch()
//                giftItem = realm.objects(gift.self).filter("id=2678")
//                print("\(s.elapsedTimeString())")
        
//        select from gift where id_address = 240 && id_children = 16513
//                let s = Stopwatch()
//                        giftItem = realm.objects(gift.self).filter("id_address=240 AND id_children = 16513")
//                print("\(s.elapsedTimeString())")
       
        
//                SELECT * FROM gift where is_given = FALSE || give_date = 1387948873
//        let s = Stopwatch()
//        giftItem = realm.objects(gift.self).filter("is_given = false OR give_date = 1387948873")
//        print("\(s.elapsedTimeString())")
        
        //        SELECT * FROM gift where is_given = \"TRUE\" and give_date = 1387948873 and id_address = 8400 and id_children = 13581
//        let s = Stopwatch()
//        giftItem = realm.objects(gift.self).filter("is_given = true and give_date = 1387948873 and id_address = 8400 and id_children = 13581")
//        print("\(s.elapsedTimeString())")

        
        //        SELECT g.name, c.name FROM gift g, children c where c.id = g.id_children and c.id = 4683
//        let s = Stopwatch()
//        let children2 = realm.objects(children1.self).filter("id = 4827").first
//        let childrenName = children2?.name
//        if let count = children2?.gift.count {
//            for i in 0..<count{
//                let giftName = children2?.gift[i].id
//            }
//            print("\(s.elapsedTimeString())")
//        }
       
        
        var street = ""
        var city = ""
        var country = ""
        var areaName = ""
        let s = Stopwatch()
        for i in 0..<areaItem.count {
            for j in 0..<areaItem[i].address.count {
                let string = areaItem[i].address[j].street
                let needle = "24"
                let needle2 = "44"
                
                if string.contains(needle) || string.contains(needle2) {
                    street = areaItem[i].address[j].street
                    city = areaItem[i].address[j].city
                    country = areaItem[i].address[j].country
                    areaName = areaItem[i].name
                    //print("\(areaName) \(street) \(city)")
                }
            }
          
        }
        print("\(s.elapsedTimeString())")
        
//        UPDATE gift SET name = 'barbie' WHERE id = 1432;
//        let s = Stopwatch()
//        let giftUpdate = realm.objects(gift.self).filter("id=721").first
//        try! realm.write {
//            giftUpdate?.name = "barbie"
//        }
//        print("\(s.elapsedTimeString())")

//        UPDATE gift SET name = 'barbie' WHERE is_given = \"FALSE\" and weight < 2;
//        let s = Stopwatch()
//        let giftUpdate = realm.objects(gift.self).filter("is_given = false AND weight < 2")
//        for i in 0..<giftUpdate.count {
//            try! realm.write {
//                giftUpdate[i].name = "barbie123"
//            }
//        }
//        print("\(s.elapsedTimeString())")

        
//        UPDATE address SET city = 'Toledo' WHERE id_area = 32 and (street like \"%24%\" or street like \"%44%\");
//        let address1Update = realm.objects(address.self).filter("id_area = 32")
//                let s = Stopwatch()
//                for i in 0..<address1Update.count {
//                    let string = address1Update[i].street
//                    let needle = "24"
//                    let needle2 = "44"
//
//                    if string.contains(needle) || string.contains(needle2) {
//                        try! realm.write {
//        address1Update[i].city = "Toledo"
//                        }
//                    }
//                }
//        print("\(s.elapsedTimeString())")

        
//        "DELETE FROM gift where is_given = \"TRUE\""
//        let giftDelete = realm.objects(gift.self).filter("is_given = true")
//        let s = Stopwatch()
//        for i in 0..<giftDelete.count {
//            try! realm.write {
//                realm.delete(giftDelete[i])
//            }
//        }
//        print("\(s.elapsedTimeString())")

        
//        DELETE FROM children where age >= 17"
//        let s = Stopwatch()
//        let deleteChildren = realm.objects(children1.self)
//        for i in 0..<deleteChildren.count {
//            if deleteChildren[i].age >= 17 {
//                try! realm.write {
//                    realm.delete(deleteChildren[i])
//                }
//            }
//
//        }
//        print("\(s.elapsedTimeString())")

//        "DELETE FROM elf where name like \"%a\""
//        let s = Stopwatch()
//
//        let deleteElf = realm.objects(elf.self)
//        for i in 0..<deleteElf.count {
//            let str = deleteElf[i].name
//            if str.last == "a" {
////                print(deleteElf[i].name)
//                try! realm.write {
//                    //realm.delete(deleteElf[i])
//                }
//            }
//        }
//        print("\(s.elapsedTimeString())")

        
//        for i in 0..<addressItem.count {
//            for j  in 0..<giftItem.count {
//                if addressItem[i].id == giftItem[j].id_address.value {
//                    try! realm.write {
//                        addressItem[i].gift.append(giftItem[j])
//                    }
//                }
//            }
//        }
//                for i in 0..<childrenItem.count {
//                    for j  in 0..<giftItem.count {
//                        if childrenItem[i].id == giftItem[j].id_children.value {
//                            try! realm.write {
//                                childrenItem[i].gift.append(giftItem[j])
//                            }
//                        }
//                    }
//                }
        
    }
    
}
