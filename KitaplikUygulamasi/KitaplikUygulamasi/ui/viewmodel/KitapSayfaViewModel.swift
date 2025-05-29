//
//  DetaySayfaViewModel.swift
//  KitaplikUygulamasi
//
//  Created by Halil Keremoğlu on 28.05.2025.
//

import Foundation
import CoreData

class KitapSayfaViewModel: ObservableObject {
    @Published var kitaplarListesi: [KitaplarModel] = []
    
    private let context = PersistenceController.shared.context
    
    // Kategori nesnesinin NSManagedObjectID'si değil, KategorilerModel objesi parametre olabilir daha iyi
    func kitaplarıYukle(kategori: KategorilerModel) {
        if let kitaplarSet = kategori.kitaplar as? Set<KitaplarModel> { //kategori.kitaplar ilişkisi bir NSSet olarak gelir çünkü Core Data ilişki türleri Set olarak saklanır.

            self.kitaplarListesi = Array(kitaplarSet)
        } else {
            self.kitaplarListesi = []
        }
    }
}
