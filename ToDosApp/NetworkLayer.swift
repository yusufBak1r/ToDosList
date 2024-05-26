//
//  NetworkLayer.swift
//  ToDosApp
//
//  Created by yusuf bakır on 26.05.2024.
//

import Foundation
//protocol NetworkLayerProtocol {
//    func makeRequest()
//}
//class NetworkLayer:NetworkLayerProtocol {
//    func makeRequest() {
//        let url = URL(string: "")
//        let session = URLSession.shared
//        var request = URLRequest(url: url!)
//        request.httpMethod = "GET"
//        let task = session.dataTask(with: request) { data,response,error in
//            if let error = error {
//                   print("Hata oluştu: \(error)")
//                   return
//               }
//            if let data = data {
//                   // Veriyi String formatında yazdırmak
//                   if let responseString = String(data: data, encoding: .utf8) {
//                       print("Gelen veri: \(responseString)")
//                   }
//                   
//                   // JSON verisini işlemek
//                   do {
//                       if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
//                           print("JSON Yanıt: \(json)")
//                       }
//                   } catch let jsonError {
//                       print("JSON işleme hatası: \(jsonError)")
//                   }
//               }
//        }
//        task.resume()
//    }
//    
//    
//}
