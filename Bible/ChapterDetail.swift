//
//  ChapterDetail.swift
//  Bible
//
//  Created by Bogdan Sevcenco on 1/28/22.
//

import SwiftUI

struct ChapterDetail: View {
    @Environment(\.colorScheme) var colorScheme
   
    @StateObject var vm = MainViewModel()
    var book: String
    @State var chapter = 1
    var body: some View {
        ZStack{
            VStack{

                ScrollView{
                    if vm.bible?.output.description == "" {
                        ProgressView("Loading")
                    }
                   
                    Text((vm.bible?.output.description) ?? "")
                }
                
                
                
                
            }
            .navigationTitle("\(book)    \(chapter)")
           
            .padding(.horizontal,20)
            .gesture(DragGesture()
                    .onEnded { value in
                    print("value ",value.translation.width)
                      let direction = detectDirection(value: value)
                switch direction {
                case .left :
                    self.chapter -= 1
//                    print(".left")
                case .right :
                    self.chapter += 1
                default :
                    print()
                }
                vm.fetchAllBooks(book: book, chapter: chapter)
                    }
                  )
           
        }
        .onAppear {
            vm.fetchAllBooks(book: book, chapter: chapter)
        }
    }
}

//struct ChapterDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        ChapterDetail()
//    }
//}
