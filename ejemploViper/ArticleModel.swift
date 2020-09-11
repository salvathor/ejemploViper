//
//  ArticleModel.swift
//  ejemploViper
//
//  Created by Salvador Lopez on 11/09/20.
//  Copyright © 2020 Salvador Lopez. All rights reserved.
//

import Foundation

struct ArticleList: Decodable {
  let articles: [Article]
}

struct Article: Decodable {
  let title: String?
  let description: String?
}
