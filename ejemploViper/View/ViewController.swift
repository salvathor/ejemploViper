//
//  ViewController.swift
//  ejemploViper
//
//  Created by Salvador Lopez on 11/09/20.
//  Copyright © 2020 Salvador Lopez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var presenter: ViewToPresenterProtocol?
  var articles = [Article]()
  
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    //ToDo - Decirle al presenter que necesita informacion.
    tableView.rowHeight = 170
    tableView.delegate = self
    tableView.dataSource = self
    presenter?.startFetchingArticle()
  }


}

extension ViewController: PresenterToViewProtocol{
  
  func showArticle(articles: [Article]) {
    dump(articles)
    self.articles = articles
    self.tableView.reloadData()
  }
  
  func showError() {
    print("Error al recuperar articulos")
  }
  
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.articles.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
    cell.titulo.text = articles[indexPath.row].title
    cell.contenido.text = articles[indexPath.row].description
    //Colocar informacion
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("celda: \(indexPath.row)")
  }
  
}
