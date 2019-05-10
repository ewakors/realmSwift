//
//  Models.swift
//  realm2
//
//  Created by Ewa Korszaczuk on 09/05/2019.
//  Copyright © 2019 Ewa Korszaczuk. All rights reserved.
//

import Foundation
import RealmSwift

class santa: Object {
    @objc dynamic var id = 0
    @objc dynamic var name: String = ""
    let elf = List<elf>()
    let reaindeer = List<reindeer2>()

    override static func primaryKey() -> String? {
        return "id"
    }
}
class elf: Object {
    @objc dynamic var id = 0
    @objc dynamic var name: String = ""
    let reaindeer = List<reindeer2>()
    let area = List<area>()
    let id_santa = RealmOptional<Int>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
class reindeer2: Object {
    @objc dynamic var id = 0
    @objc dynamic var name: String = ""
    let id_santa = RealmOptional<Int>()
    let id_elf = RealmOptional<Int>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
class address: Object {
    @objc dynamic var id = 0
    @objc dynamic var city: String = ""
    @objc dynamic var country: String = ""
    @objc dynamic var street: String = ""
    let id_area = RealmOptional<Int>()
    let gift = List<gift>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
class area: Object {
    @objc dynamic var id = 0
    @objc dynamic var name: String = ""
    let id_elf = RealmOptional<Int>()
    let area = List<area>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
class gift: Object {
    @objc dynamic var id = 0
    @objc dynamic var name: String = ""
    @objc dynamic var company_name: String = ""
    @objc dynamic var is_given: Bool = false
    @objc dynamic var give_date: Int = 0
    @objc dynamic var weight: Float = 0.0
    let id_address = RealmOptional<Int>()
    let id_children = RealmOptional<Int>()

    override static func primaryKey() -> String? {
        return "id"
    }
}
class children1: Object {
    @objc dynamic var id = 0
    @objc dynamic var name: String = ""
    @objc dynamic var surname: String = ""
    @objc dynamic var age: Int = 0
    @objc dynamic var gender: String = ""
    let gift = List<gift>()

    override static func primaryKey() -> String? {
        return "id"
    }
}
