//
//  HomeViewController.swift
//  BullionAssignment
//
//  Created by Zakki Mudhoffar on 13/07/24.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var bodyScrollView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var logout: UILabel!
    @IBOutlet weak var coureselIndicator: UIPageControl!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var containnerView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        regisTableView()
        registerCollectionView()
    }
    
    /// Untuk hidden navigation ketika masuk dan ketika akan keluar dari home view
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func setupView() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(red: 252/255, green: 104/255, blue: 58/255, alpha: 1).cgColor,
            UIColor(red: 240/255, green: 90/255, blue: 42/255, alpha: 1).cgColor,
            UIColor(red: 241/255, green: 186/255, blue: 168/255, alpha: 1).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.frame = view.bounds
        
        // Tambahkan gradient layer ke view
        containnerView.layer.insertSublayer(gradientLayer, at: 0)
        tableView.layer.cornerRadius = 25
        
        logout.text = "Logout"
        logout.textColor = .white
        
    }
    
    func registerCollectionView() {
        let nibBannerCell = UINib(nibName: "HomeCollectionViewCell", bundle: nil)
        bannerCollectionView.register(nibBannerCell, forCellWithReuseIdentifier: "HomeCollectionViewCell")
        self.bannerCollectionView.dataSource = self
        self.bannerCollectionView.delegate = self
    }
    
    func regisTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        let nibListUser = UINib(nibName: "HomeTableViewCell", bundle: nil)
        self.tableView.register(nibListUser, forCellReuseIdentifier: "HomeTableViewCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueCell(with: HomeCollectionViewCell.self, for: indexPath) else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return CGSize(width: 390, height: 200) // Set the size you need
       }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueCell(with: HomeTableViewCell.self) else {
            return UITableViewCell()
        }
        return cell
    }
    
    
}
