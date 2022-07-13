//
//  ContentView.swift
//  Bible
//
//  Created by Bogdan Sevcenco on 1/28/22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var selectedBook: String = "Genesis"
    var testament : String
    
    enum Testament {
        case oldTestament,newTestament
        var books: [Books] {
            switch self {
            case .oldTestament:
                return [Books(name: "Genesis" , chapters:50),
                        Books(name: "Exodus" , chapters:40),
                        Books(name: "Leviticus" , chapters:27),
                        Books(name: "Numbers" , chapters:36),
                        Books(name: "Deuteronomy" , chapters:34),
                        Books(name: "Joshua" , chapters:24),
                        Books(name: "Judges" , chapters:21),
                        Books(name: "Ruth" , chapters:4),
                        Books(name: "1 Samuel" , chapters:31),
                        Books(name: "2 Samuel" , chapters:24),
                        Books(name: "1 Kings" , chapters:22),
                        Books(name: "2 Kings" , chapters:25),
                        Books(name: "1 Chronicles" , chapters:29),
                        Books(name: "2 Chronicles " , chapters:36),
                        Books(name: "Ezra" , chapters:10),
                        Books(name: "Nehemiah" , chapters:13),
                        Books(name: "Esther" , chapters:13),
                        Books(name: "Job" , chapters:42),
                        Books(name: "Psalms" , chapters:150),
                        Books(name: "Proverbs" , chapters:31),
                        Books(name: "Ecclesiastes" , chapters:12),
                        Books(name: "Song of Solomon" , chapters:8),
                        Books(name: "Isaiah" , chapters:66),
                        Books(name: "Jeremiah" , chapters:52),
                        Books(name: "Lamentations" , chapters:5),
                        Books(name: "Ezekiel" , chapters:48),
                        Books(name: "Daniel " , chapters:12),
                        Books(name: "Hosea" , chapters:14),
                        Books(name: "Joel" , chapters:3),
                        Books(name: "Amos" , chapters:9),
                        Books(name: "Obadiah" , chapters:1),
                        Books(name: "Jonah" , chapters:4),
                        Books(name: "Micah" , chapters:4),
                        Books(name: "Nahum" , chapters:3),
                        Books(name: "Habakkuk" , chapters:3),
                        Books(name: "Zephaniah" , chapters:3),
                        Books(name: "Haggai" , chapters:2),
                        Books(name: "Zechariah" , chapters:14),
                        Books(name: "Malachi" , chapters:4),
  ]
            case .newTestament:
                return [Books(name: "Matthew" , chapters:28),
                        Books(name: "Mark" , chapters:16),
                        Books(name: "Luke" , chapters:24),
                        Books(name: "John" , chapters:21),
                        Books(name: "Acts" , chapters:28),
                        Books(name: "Romans" , chapters:16),
                        Books(name: "1 Corinthians" , chapters:16),
                        Books(name: "2 Corinthians" , chapters:13),
                        Books(name: "Galatians " , chapters:6),
                        Books(name: "Ephesians" , chapters:6),
                        Books(name: "Philippians" , chapters:4),
                        Books(name: "Colossians" , chapters:4),
                        Books(name: "1 Thessalonians" , chapters:5),
                        Books(name: "2 Thessalonians" , chapters:3),
                        Books(name: "1 Timothy" , chapters:6),
                        Books(name: "2 Timothy" , chapters:4),
                        Books(name: "Titus" , chapters:3),
                        Books(name: "Philemon" , chapters:1),
                        Books(name: "Hebrews" , chapters:13),
                        Books(name: "James" , chapters:5),
                        Books(name: "1 Peter" , chapters:5),
                        Books(name: "2 Peter" , chapters:3),
                        Books(name: "1 John" , chapters:5),
                        Books(name: "2 John" , chapters:1),
                        Books(name: "3 John" , chapters:1),
                        Books(name: "Jude" , chapters:1),
                        Books(name: "Revelation" , chapters:22)
]
            
            }
        }
    }


    
    let oldTestament: [Books] = [Books(name: "Genesis" , chapters:50),
                          Books(name: "Exodus" , chapters:40),
                          Books(name: "Leviticus" , chapters:27),
                          Books(name: "Numbers" , chapters:36),
                          Books(name: "Deuteronomy" , chapters:34),
                          Books(name: "Joshua" , chapters:24),
                          Books(name: "Judges" , chapters:21),
                          Books(name: "Ruth" , chapters:4),
                          Books(name: "1 Samuel" , chapters:31),
                          Books(name: "2 Samuel" , chapters:24),
                          Books(name: "1 Kings" , chapters:22),
                          Books(name: "2 Kings" , chapters:25),
                          Books(name: "1 Chronicles" , chapters:29),
                          Books(name: "2 Chronicles " , chapters:36),
                          Books(name: "Ezra" , chapters:10),
                          Books(name: "Nehemiah" , chapters:13),
                          Books(name: "Esther" , chapters:13),
                          Books(name: "Job" , chapters:42),
                          Books(name: "Psalms" , chapters:150),
                          Books(name: "Proverbs" , chapters:31),
                          Books(name: "Ecclesiastes" , chapters:12),
                          Books(name: "Song of Solomon" , chapters:8),
                          Books(name: "Isaiah" , chapters:66),
                          Books(name: "Jeremiah" , chapters:52),
                          Books(name: "Lamentations" , chapters:5),
                          Books(name: "Ezekiel" , chapters:48),
                          Books(name: "Daniel " , chapters:12),
                          Books(name: "Hosea" , chapters:14),
                          Books(name: "Joel" , chapters:3),
                          Books(name: "Amos" , chapters:9),
                          Books(name: "Obadiah" , chapters:1),
                          Books(name: "Jonah" , chapters:4),
                          Books(name: "Micah" , chapters:4),
                          Books(name: "Nahum" , chapters:3),
                          Books(name: "Habakkuk" , chapters:3),
                          Books(name: "Zephaniah" , chapters:3),
                          Books(name: "Haggai" , chapters:2),
                          Books(name: "Zechariah" , chapters:14),
                          Books(name: "Malachi" , chapters:4),
    ]
    
    var newTestament: [Books] = [Books(name: "Matthew" , chapters:28),
                                 Books(name: "Mark" , chapters:16),
                                 Books(name: "Luke" , chapters:24),
                                 Books(name: "John" , chapters:21),
                                 Books(name: "Acts" , chapters:28),
                                 Books(name: "Romans" , chapters:16),
                                 Books(name: "1 Corinthians" , chapters:16),
                                 Books(name: "2 Corinthians" , chapters:13),
                                 Books(name: "Galatians " , chapters:6),
                                 Books(name: "Ephesians" , chapters:6),
                                 Books(name: "Philippians" , chapters:4),
                                 Books(name: "Colossians" , chapters:4),
                                 Books(name: "1 Thessalonians" , chapters:5),
                                 Books(name: "2 Thessalonians" , chapters:3),
                                 Books(name: "1 Timothy" , chapters:6),
                                 Books(name: "2 Timothy" , chapters:4),
                                 Books(name: "Titus" , chapters:3),
                                 Books(name: "Philemon" , chapters:1),
                                 Books(name: "Hebrews" , chapters:13),
                                 Books(name: "James" , chapters:5),
                                 Books(name: "1 Peter" , chapters:5),
                                 Books(name: "2 Peter" , chapters:3),
                                 Books(name: "1 John" , chapters:5),
                                 Books(name: "2 John" , chapters:1),
                                 Books(name: "3 John" , chapters:1),
                                 Books(name: "Jude" , chapters:1),
                                 Books(name: "Revelation" , chapters:22)
    ]
    
    
    
   
    var body: some View {
        ZStack {
           
            List(testament == "Old Testament" ? oldTestament : newTestament, id: \.id) { book in
                    NavigationLink(
                        destination: ChapterInBook(bookName: book.name, chapters: book.chapters),
                        label: {
                            Text(book.name)
                        })
                }
                        .navigationTitle("Books")
                    
           
                
                
        
        }
//        .onAppear{
//            testament == "oldTestament" ?
//        }
        
    }
}
    
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(testament: "oldTestament")
    }
}
