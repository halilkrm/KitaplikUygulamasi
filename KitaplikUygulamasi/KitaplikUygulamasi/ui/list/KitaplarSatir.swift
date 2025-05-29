//
//  KitaplarSatir.swift
//  KitaplikUygulamasi
//
//  Created by Halil Keremoğlu on 28.05.2025.
//

import SwiftUI

struct KitaplarSatir: View {
    var kitap:KitaplarModel
    var genislik = 0.0
    var body: some View {
        VStack(spacing:5){
            Image(kitap.kitap_resim!).resizable().frame(width: genislik)
            Text(kitap.kitap_ad!).foregroundColor(.indigo)
            Text("Satın Al")
                .padding(5)
                .foregroundColor(.white)
                .background(.brown)
                .cornerRadius(5)
                .padding(.bottom,5)
                .onTapGesture {
                    print("\(kitap.kitap_ad!) satın alındı")
                }
        }.background(Rectangle().fill(.white).shadow(radius:4))
        
      
    }
}

/*#Preview {
    KitaplarSatir()
}*/
