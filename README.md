<div align="center">

# 📚 Kitaplık Uygulaması

A native iOS library application built with **SwiftUI** and **Core Data**.

![Swift](https://img.shields.io/badge/Swift-iOS-F05138?logo=swift&logoColor=white)
![SwiftUI](https://img.shields.io/badge/UI-SwiftUI-0D96F6?logo=swift&logoColor=white)
![Core Data](https://img.shields.io/badge/Persistence-Core%20Data-5E5CE6)

</div>

---

## Overview

The current application displays book categories, loads books related to the selected category, shows them in a two-column grid, and opens a book detail screen.

Data is stored with Core Data.

---

## Implemented Features

- SwiftUI `NavigationStack`
- Category list
- Navigation from category to books
- Category-to-book Core Data relationship
- Two-column `LazyVGrid`
- Navigation from a book to its detail screen
- Initial sample-data insertion when no category record exists
- Core Data fetch for categories

---

## Current Navigation Flow

```text
Categories
   ↓
Books for selected category
   ↓
Book detail
```

---

## Core Data Usage

### Category Loading

`AnasayfaViewModel` fetches:

```swift
KategorilerModel
```

with `NSFetchRequest`.

### Category-to-Book Relationship

`KitapSayfaViewModel` reads the selected category's:

```swift
kategori.kitaplar
```

relationship and converts it into the published book list.

---

## Sample Data in the Current Source

Sample data is inserted only when an existing category record is not found.

### Categories

- Roman
- Hikaye
- Şiir

### Books

| Category | Book | Author | Pages |
|---|---|---|---|
| Roman | Suç ve Ceza | Fyodor Dostoyevski | 687 |
| Roman | Sefiller | Victor Hugo | 1232 |
| Hikaye | Kaşağı | Ömer Seyfettin | 32 |
| Hikaye | Falaka | Ömer Seyfettin | 28 |
| Şiir | Safahat | Mehmet Akif Ersoy | 264 |
| Şiir | Çile | Necip Fazıl Kısakürek | 168 |

---

## Main Source Structure

```text
KitaplikUygulamasi/
├── KitaplikUygulamasi/
│   ├── ui/
│   │   ├── view/
│   │   │   ├── Anasayfa.swift
│   │   │   ├── Kitapsayfa.swift
│   │   │   └── Detaysayfa.swift
│   │   └── viewmodel/
│   │       ├── AnasayfaViewModel.swift
│   │       └── KitapSayfaViewModel.swift
│   └── ...
└── README.md
```

---

## Current Detail-Screen Behavior

The detail screen displays values from the selected `KitaplarModel`, including:

- image asset name
- book name
- author

The current `Satın Al` button prints a message to the console. It does not implement a payment or order backend.

---

## Getting Started

### Requirements

- macOS
- Xcode
- iOS Simulator or physical iOS device

### Clone

```bash
git clone https://github.com/halilkrm/KitaplikUygulamasi.git
cd KitaplikUygulamasi
```

Open the included Xcode project and run it.

The current data flow does not require a remote backend.
