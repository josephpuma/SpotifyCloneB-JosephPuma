//
//  HomeViewController.swift
//  SpotifyCloneB-JosephPuma
//
//  Created by Joseph Puma on 12/06/2022.
//

import UIKit
import SDWebImage

class HomeViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var uiSearchBar: UISearchBar!
    
    var saveTextSearch: String = ""
    
    let searchViewModel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSearch()
        setUpTable()
        Task{
            await setUpData()
        }
    }
    
    func setUpSearch(){
        uiSearchBar.delegate = self
        
    }
    
    func setUpTable(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setUpData() async{
        let _ = await searchViewModel.getMusicsByName(name: "Duumu")
        tableView.reloadData()
    }
    
}

extension HomeViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        saveTextSearch = searchText
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(saveTextSearch)
        self.view.endEditing(true)
        Task{
            let _ = await searchViewModel.getMusicsByName(name: saveTextSearch)
            tableView.reloadData()
        }
                
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchViewModel.searchResult?.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let uiView = UIView()
        uiView.backgroundColor = UIColor(named: "darkColor")
        return uiView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ItemSearchTableViewCell
        let row = searchViewModel.searchResult?.items[indexPath.row].album
        cell.lblTitle.text = row?.name
        cell.lblDescription.text = row?.artists[0].name
        cell.coverImage.sd_setImage(with: URL(string: row?.images[0].url ?? ""))
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(named: "darkColor")
        cell.selectedBackgroundView = backgroundView
        return cell
    }

}
