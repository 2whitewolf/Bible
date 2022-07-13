//
//  ChapterInBook.swift
//  Bible
//
//  Created by Bogdan Sevcenco on 2/17/22.
//

import SwiftUI

struct ChapterInBook: View {
    @Environment(\.colorScheme) var colorScheme
//    @ObservedObject var books: BooksViewModel
//  
    var bookName: String
    var chapters: Int
   
    var body: some View {
        ZStack{
           
                 List {
                    ForEach(1...chapters, id: \.self) { name in
                        NavigationLink(destination: ChapterDetail(vm: MainViewModel(), book: bookName, chapter: name)) {
                            Text("Chapter \(name)")
                        }
                    }
                 }
                 .navigationTitle("Chapters in \(bookName)")
                 
        }
    }
}

struct ChapterInBook_Previews: PreviewProvider {
    static var previews: some View {
        ChapterInBook(bookName: "Genesis",chapters: 50)
    }
}
