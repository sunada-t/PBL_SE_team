//
//  ViewController.swift
//  apitest
//
//  Created by hiromu-m on 2019/12/17.
//  Copyright © 2019 hiromu-m. All rights reserved.
//
//Article(title: "GKE中のGolangアプリケーションからCloud Pub/Subを使ってデータ連携を行う", user: apitest.Article.User(id: "devs_hd"))

import UIKit


struct Article: Codable {
    var title: String
    var user: User
    struct User: Codable {
        var id: String
    }
}

struct Qiita {

//情報取得
    static func fetchArticle(completion: @escaping ([Article]) -> Swift.Void) {
//get ur
        let url = "https://qiita.com/api/v2/items"
        print(url)
        //クエリストリング
        guard var urlComponents = URLComponents(string: url) else {
            return
        }
//構造体
//表示数５０perpageデフォルト
        urlComponents.queryItems = [
            URLQueryItem(name: "per_page", value: "50"),
        ]
      
        let task = URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in

            guard let jsonData = data else {
                return
            }

            do {
                let articles = try JSONDecoder().decode([Article].self, from: jsonData)
                completion(articles)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}


class ViewController: UIViewController {

    private var tableView = UITableView()
    fileprivate var articles: [Article] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "最新記事"

        setUpTableView: do {
            tableView.frame = view.frame
            tableView.dataSource = self
            view.addSubview(tableView)
        }

        Qiita.fetchArticle(completion: { (articles) in
            self.articles = articles
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//cellを作っている
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let article = articles[indexPath.row]
        cell.textLabel?.text = article.title
        cell.detailTextLabel?.text = article.user.id
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
}
