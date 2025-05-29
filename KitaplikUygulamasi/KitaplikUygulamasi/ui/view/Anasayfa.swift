//
//  ContentView.swift
//  KitaplikUygulamasi
//
//  Created by Halil Keremoğlu on 28.05.2025.
//

import SwiftUI

struct Anasayfa: View {
    @ObservedObject var viewModel = AnasayfaViewModel()
    
    var body: some View {
        
        NavigationStack{
            List{
                ForEach(viewModel.kategorilerListesi){ kategori in
                    NavigationLink(destination: Kitapsayfa(kategori:kategori)){
                        KategoriItem(kategori:kategori)
                    }
                    
                }
            }.navigationTitle("Kategoriler")
                .onAppear {
                    // Eğer veri yoksa önce örnek verileri ekle sonra yükle
                    if viewModel.kategorilerListesi.isEmpty {
                        viewModel.ornekVeriEkle()
                    }
                    viewModel.kategorileriYukle()
                }
        }
    }
}

#Preview {
   Anasayfa()
}
