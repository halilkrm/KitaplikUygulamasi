//
//  Kahvesayfa.swift
//  KitaplikUygulamasi
//
//  Created by Halil Keremoğlu on 28.05.2025.
//

import SwiftUI

struct Kitapsayfa: View {
    @ObservedObject var viewModel = KitapSayfaViewModel()
    var kategori: KategorilerModel

    var body: some View {
        GeometryReader { geometry in
            let ekranGenislik = geometry.size.width
            let itemGenislik = (ekranGenislik - 40) / 2

            let kitaplar = viewModel.kitaplarListesi // type inference kolaylaştırılır

            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 30) {
                    ForEach(kitaplar, id: \.objectID) { kitap in
                        kitapNavigationLink(for: kitap, width: itemGenislik)
                    }
                }
                .padding(10)
            }
            .navigationTitle(kategori.kategori_ad ?? "Kategori")
            .onAppear {
                viewModel.kitaplarıYukle(kategori: kategori)
            }
        }
    }

    @ViewBuilder // her bir kitap için tıklanabilir navigation link olusturur
    private func kitapNavigationLink(for kitap: KitaplarModel, width: CGFloat) -> some View {
        NavigationLink(destination: Detaysayfa(kitap: kitap)) {
            KitaplarSatir(kitap: kitap, genislik: width)
        }
    }
}



/*#Preview {
    Kitapsayfa()
}*/
