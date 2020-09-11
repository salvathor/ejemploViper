//
//  ArticleRouter.swift
//  ejemploViper
//
//  Created by Salvador Lopez on 11/09/20.
//  Copyright © 2020 Salvador Lopez. All rights reserved.
//

import Foundation
import UIKit

class ArticleRouter: PresenterToRouterProtocol {
  
  let mainStoryboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
  
  func createModule() -> ViewController {
  
    // Elementos VIPER
    let view = mainStoryboard.instantiateViewController(identifier: "mainVC") as! ViewController
  
    let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = ArticlePresenter()
    
    let interactor: PresenterToInteractorProtocol = ArticleInteractor()
    
    let router: PresenterToRouterProtocol = ArticleRouter()
    
    // Comunicacion VIPER
    view.presenter = presenter
    presenter.view = view
    presenter.interactor = interactor
    presenter.router = router
    interactor.presenter = presenter
    
    return view
  }
  
  func pushToAnotherScreen() {
    // Utilizar en caso de crear algun otro modulo de viper
    // Es decir otra pantalla en nuestro storyboard
    print("Yendo al detalle")
  }
}
