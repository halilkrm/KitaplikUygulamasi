//
//  Detaysayfa.swift
//  KitaplikUygulamasi
//
//  Created by Halil Keremoğlu on 28.05.2025.
//

import SwiftUI

struct Detaysayfa: View {
    
    var kitap = KitaplarModel()
    

    var body: some View {
        
        VStack(spacing:50){
            Image(kitap.kitap_resim!)
        
            Text(kitap.kitap_ad!).font(.system(size: 30))
            
            Text("\(kitap.kitap_yazar!)").font(.system(size: 50)).foregroundColor(.blue)
            
            Button("Satın Al"){
                print("Detay Sayfa : \(kitap.kitap_ad!) satın alındı")
            }
            .foregroundColor(.white)
            .frame(width: 250,height: 50)
            .background(.indigo)
            .cornerRadius(10)
        }.navigationTitle(kitap.kitap_ad!)
        }
    
    
}

#Preview {
    Detaysayfa()
}
