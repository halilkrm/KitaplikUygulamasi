//
//  PersistenceController.swift
//  KitaplikUygulamasi
//
//  Created by Halil Keremoğlu on 29.05.2025.
//

import Foundation
import CoreData

class PersistenceController {
    static let shared = PersistenceController() // Singleton erişim tüm core data işlemleri bu örnek üzerinde yapılır

    let container: NSPersistentContainer // core datanın merkez bileşeni

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "KitaplarModel") // Core Data model dosyanın adıyla aynı olmalı

        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null") // test için
        }

        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Core Data yüklenirken hata oluştu: \(error)")
            }
        }
    }

    var context: NSManagedObjectContext {
        return container.viewContext
    }
}
