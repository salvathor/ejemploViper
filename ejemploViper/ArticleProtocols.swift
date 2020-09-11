//
//  ArticleProtocols.swift
//  ejemploViper
//
//  Created by Salvador Lopez on 11/09/20.
//  Copyright © 2020 Salvador Lopez. All rights reserved.
//

import Foundation

// Este protocolo sera implementado en ArticlePresenter.swift
protocol ViewToPresenterProtocol: class{
  var view: PresenterToViewProtocol? {get set}
  var interactor: PresenterToInteractorProtocol? {get set}
  var router: PresenterToRouterProtocol? {get set}
  func startFetchingArticle()
}

// Este protocolo sera implementado en ViewController.swift
protocol PresenterToViewProtocol: class{
  func showArticle(articles:[Article])
  func showError()
}

// Este protocolo sera implmentado en ArticleRouter.swift
protocol PresenterToRouterProtocol: class {
  func createModule() -> ViewController
  func pushToAnotherScreen()
}

// Este protocolo sera implementado en ArticleInteractor.swift
protocol PresenterToInteractorProtocol: class{
  var presenter: InteractorToPresenterProtocol? {get set}
  func fecthArticle()
}

// Este protocolo sera implementado en ArticlePresenter.swift
protocol InteractorToPresenterProtocol: class {
  func articleFetchSuccess(articles:[Article])
  func articleFetchFailed()
}
