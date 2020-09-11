//
//  ArticlePresenter.swift
//  ejemploViper
//
//  Created by Salvador Lopez on 11/09/20.
//  Copyright © 2020 Salvador Lopez. All rights reserved.
//

import Foundation

class ArticlePresenter: ViewToPresenterProtocol {
  
  var view: PresenterToViewProtocol?
  
  var interactor: PresenterToInteractorProtocol?
  
  var router: PresenterToRouterProtocol?
  
  // Voy a llamar desde la vista
  func startFetchingArticle() {
    // Decirle al intercator que recolecte informacion
    interactor?.fecthArticle()
  }
  
}

extension ArticlePresenter: InteractorToPresenterProtocol {
  func articleFetchSuccess(articles: [Article]) {
    DispatchQueue.main.async {
      self.view?.showArticle(articles: articles)
    }
  }
  
  func articleFetchFailed() {
    self.view?.showError()
  }
}
