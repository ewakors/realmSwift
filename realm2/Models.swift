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
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
class elf: Object {
    @objc dynamic var id = 0
    @objc dynamic var name: String = ""
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
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
class area: Object {
    @objc dynamic var id = 0
    @objc dynamic var name: String = ""
    let id_elf = RealmOptional<Int>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
