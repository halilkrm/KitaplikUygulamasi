//
//  KategoriItem.swift
//  KitaplikUygulamasi
//
//  Created by Halil Keremoğlu on 28.05.2025.
//

import SwiftUI

struct KategoriItem: View {
    var kategori = KategorilerModel()
    
    
    var body: some View {
        Text(kategori.kategori_ad!)
    }
}

/*#Preview {
    KategoriItem()
}*/
