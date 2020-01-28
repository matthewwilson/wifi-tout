//
//  HttpPinger.swift
//  wifi-tout
//
//  Created by Matthew Wilson on 28/01/2020.
//  Copyright © 2020 Matthew Wilson. All rights reserved.
//

import Foundation

class HttpPinger {
    public typealias PingCompletion = (Bool) -> Void
    
    func ping(_ completion: @escaping PingCompletion) {
        if let url = URL(string: "https://google.com") {
          var request = URLRequest(url: url)
          request.httpMethod = "HEAD"

          URLSession(configuration: .default)
            .dataTask(with: request) { (_, response, error) -> Void in
              guard error == nil else {
                completion(false)
                return
              }

              guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                completion(false)
                return
              }

              completion(true)
            }
            .resume()
        }
    }
}
