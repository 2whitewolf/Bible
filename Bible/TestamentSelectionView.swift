//
//  TestamentSelectionView.swift
//  Bible
//
//  Created by Sevcenco Bogdan on 18.02.2022.
//

import SwiftUI

struct TestamentSelectionView: View {
    var testaments = ["Old Testament", "New Testament"]
    var body: some View {
        ZStack{
            
            VStack {
               
                NavigationView{
                List {
                   ForEach(testaments, id: \.self) { testament in
                       NavigationLink(destination: ContentView(testament: testament)) {
                           Text("\(testament)")
                       }
                   }
                }
                .navigationTitle("Bible")
            }
                
            }
        }
    }
}

struct TestamentSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        TestamentSelectionView()
    }
}
