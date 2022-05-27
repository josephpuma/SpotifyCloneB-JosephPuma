//
//  PlaylistDetailViewController.swift
//  SpotifyCloneB-JosephPuma
//
//  Created by Joseph Cconislla Puma on 26/05/22.
//

import UIKit
import SDWebImage

class PlaylistDetailViewController: UIViewController {
    
    let playlistDetailViewModel = PlayListDetailViewModel()
    
    var id: String? = nil
    
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblFollowers: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Task{
            await setUpData()
        }
        setUpTable()
    }
    
    func setUpData() async {
        print(id!)
        await playlistDetailViewModel.getPlaylistDetail(id: id!)
        let detail = playlistDetailViewModel.playlistDetail
        lblTitle.text = detail?.name
        lblDescription.text = detail?.description
        lblFollowers.text = "\((detail?.followers.total)!) Follower(s)"
        tableView.reloadData()
        
    }
    
    func setUpTable(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func onTappedBack(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
}

extension PlaylistDetailViewController:  UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlistDetailViewModel.playlistDetail?.tracks.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ItemPlaylistDetailTableViewCell
        
        let playlist = playlistDetailViewModel.playlistDetail?.tracks.items[indexPath.row].track.album
        
        cell.lblName.text = playlist?.name
        cell.lblAuthor.text = playlist?.artists[0].name
        cell.coverImage.sd_setImage(with: URL(string: (playlist?.images[0].url)!))
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(named: "darkColor")
        cell.selectedBackgroundView = backgroundView
        
        return cell
    }
}
