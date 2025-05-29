//
//  AnasayfaViewModel.swift
//  KitaplikUygulamasi
//
//  Created by Halil Keremoğlu on 28.05.2025.
//
import Foundation
import CoreData

class AnasayfaViewModel: ObservableObject {
    @Published var kategorilerListesi: [KategorilerModel] = []
    
    private let context = PersistenceController.shared.context
    
    func kategorileriYukle() {
        let fetchRequest: NSFetchRequest<KategorilerModel> = KategorilerModel.fetchRequest()
        
        do {
            self.kategorilerListesi = try context.fetch(fetchRequest) //Core Data’dan kayıtlı KategorilerModel verilerini getirir.
            
        } catch {
            print("Kategoriler yüklenirken hata oluştu: \(error)")
        }
    }
    
    func ornekVeriEkle() {
        let context = PersistenceController.shared.context
        
        // Eğer zaten veri varsa tekrar ekleme
            let fetchRequest: NSFetchRequest<KategorilerModel> = KategorilerModel.fetchRequest()
            fetchRequest.fetchLimit = 1  //Yani: “Sadece 1 tane bile kayıt varsa bana getir.” 
            
            do {
                let mevcutVeri = try context.fetch(fetchRequest)
                if !mevcutVeri.isEmpty {
                    return // Zaten veri var, tekrar ekleme
                }
            } catch {
                print("Veri kontrol edilirken hata oluştu: \(error)")
            }

        // Kategorileri oluştur
        let roman = KategorilerModel(context: context)
        roman.kategori_ad = "Roman"

        let hikaye = KategorilerModel(context: context)
        hikaye.kategori_ad = "Hikaye"

        let siir = KategorilerModel(context: context)
        siir.kategori_ad = "Şiir"

        // Romanlar
        let kitap1 = KitaplarModel(context: context)
        kitap1.kitap_ad = "Suç ve Ceza"
        kitap1.kitap_yazar = "Fyodor Dostoyevski"
        kitap1.kitap_sayfa = "687"
        kitap1.kitap_resim = "sucdceza"
        kitap1.kategori = roman

        let kitap2 = KitaplarModel(context: context)
        kitap2.kitap_ad = "Sefiller"
        kitap2.kitap_yazar = "Victor Hugo"
        kitap2.kitap_sayfa = "1232"
        kitap2.kitap_resim = "sefiller"
        kitap2.kategori = roman

        // Hikayeler
        let kitap3 = KitaplarModel(context: context)
        kitap3.kitap_ad = "Kaşağı"
        kitap3.kitap_yazar = "Ömer Seyfettin"
        kitap3.kitap_sayfa = "32"
        kitap3.kitap_resim = "kasagi"
        kitap3.kategori = hikaye

        let kitap4 = KitaplarModel(context: context)
        kitap4.kitap_ad = "Falaka"
        kitap4.kitap_yazar = "Ömer Seyfettin"
        kitap4.kitap_sayfa = "28"
        kitap4.kitap_resim = "falaka"
        kitap4.kategori = hikaye

        // Şiirler
        let kitap5 = KitaplarModel(context: context)
        kitap5.kitap_ad = "Safahat"
        kitap5.kitap_yazar = "Mehmet Akif Ersoy"
        kitap5.kitap_sayfa = "264"
        kitap5.kitap_resim = "safahat"
        kitap5.kategori = siir

        let kitap6 = KitaplarModel(context: context)
        kitap6.kitap_ad = "Çile"
        kitap6.kitap_yazar = "Necip Fazıl Kısakürek"
        kitap6.kitap_sayfa = "168"
        kitap6.kitap_resim = "cile"
        kitap6.kategori = siir

        // Kaydet
        do {
            try context.save()
            print("Veriler başarıyla eklendi.")
        } catch {
            print("Veri ekleme hatası: \(error)")
        }
    }

    
}
