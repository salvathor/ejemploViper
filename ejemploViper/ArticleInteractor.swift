//
//  ArticleInteractor.swift
//  ejemploViper
//
//  Created by Salvador Lopez on 11/09/20.
//  Copyright © 2020 Salvador Lopez. All rights reserved.
//

import Foundation

class ArticleInteractor: PresenterToInteractorProtocol {
  
  private let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=5210846b9afc4f81a9ae4b3b39cc8cb4")
  
  private var articleList: ArticleList!
  
  var presenter: InteractorToPresenterProtocol?
  
  // Consumo al web service
  func fecthArticle() {
    
    WebService().getArticles(url: url!) { (articles) in
      if let articles = articles {
        self.presenter?.articleFetchSuccess(articles: articles)
      }else{
        self.presenter?.articleFetchFailed()
      }
    }
    
  }
  
  
}
