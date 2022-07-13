//
//  MainViewModel.swift
//  Bible
//
//  Created by Bogdan Sevcenco on 2/17/22.
//

import Foundation
import SwiftUI

class MainViewModel: ObservableObject {
    @Published var bible : Bible?
//     static let access = MainViewModel()
    
    
    func fetchAllBooks (book: String, chapter: Int) {

       
        let headers = [
            "x-rapidapi-host": "ajith-holy-bible.p.rapidapi.com",
            "x-rapidapi-key": "6c418c17acmsh7c831ff4a28ba11p107f1cjsnc244f3f51af8"
        ]
        var url = "https://ajith-holy-bible.p.rapidapi.com/GetChapter?Book=\(book)&chapter=\(chapter)"
        url = url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
//        url.queryItems = …continue as above …

        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
//                let httpResponse = response as? HTTPURLResponse
//                print(httpResponse)
                do {
                    if let data = data {
                        let jsonDecoder = JSONDecoder()
                        let result = try jsonDecoder.decode(Bible.self, from: data)
                        DispatchQueue.main.async {
                            self.bible = result
                            print("Bogdan: \(result)")
                        }
                    }
                } catch {
                    print("No data")
                }
            }
        })

        dataTask.resume()
    }
    
}
