//
//  NewsFeedVC.swift
//  Nutee
//
//  Created by Hee Jae Kim on 2020/01/14.
//  Copyright © 2020 Junhyeon. All rights reserved.
//

import UIKit

class NewsFeedVC: UIViewController {
    
    // MARK: - UI components
        
    @IBOutlet var newsTV: UITableView!
    
    // MARK: - Variables and Properties

    
    // MARK: - Dummy data
    
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsTV.delegate = self
        newsTV.dataSource = self

        initColor()
        
        // Register the custom header view which Nib 'PostingTableHeaderSection'
        let nib = UINib(nibName: "PostingTableHeaderSection", bundle: nil)
        self.newsTV.register(nib, forHeaderFooterViewReuseIdentifier: "PostingTableHeaderSection")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
//        checkLogin()
    }
    
    // MARK: -Helper
    
    // 로그인이 되어있는지 체크
    func checkLogin() {
        if UserDefaults.standard.data(forKey: "Cookies") == nil {
            
            let storyboard = UIStoryboard(name: "Login", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "LoginVC") as! LoginVC
            vc.modalPresentationStyle = .overCurrentContext
            vc.modalTransitionStyle = .crossDissolve
            
            self.present(vc, animated: true, completion: nil)
        }
    }
    
}

extension NewsFeedVC : UITextViewDelegate { }

// MARK: - UITableView
extension NewsFeedVC : UITableViewDelegate { }

extension NewsFeedVC : UITableViewDataSource {
    
    func initColor() {
        self.tabBarController?.tabBar.barTintColor = UIColor.nuteeGreen
        self.tabBarController?.tabBar.tintColor = UIColor.white
    }
    
    /*func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "여기는 해더 뷰 제목"
    }*/
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    
        // Dequeue with the reuse identifier
        let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "PostingTableHeaderSection")

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let row : [NewsFeedVO] = newsList
        
        //Custom셀인 'NewsFeedCell' 형식으로 변환
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsFeedCell", for: indexPath) as! NewsFeedCell
        
        if indexPath.row % 2 == 1 {
            cell.backgroundColor = .lightGray
        }
        //데이터 소스에 저장된 값을 커스텀 한 NewsFeedCell의 아울렛 변수들에게 전달
//        cell.lblUserId.text = row[indexPath.row].userId
//        cell.lblContents.text = row[indexPath.row].contents
//        cell.imgUserImg.image = UIImage(named: row[indexPath.row].userImg!)
//        cell.lblPostTime.text = row[indexPath.row].postTime
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("선택된 뉴스피드는 \(indexPath.row) 번쨰 뉴스피드입니다")
        
        let detailNewsFeedSB = UIStoryboard(name: "DetailNewsFeed", bundle: nil)
        let showDetailNewsFeedVC = detailNewsFeedSB.instantiateViewController(withIdentifier: "DetailNewsFeed") as! DetailNewsFeedVC
//        self.present(showDetailNewsFeedVC, animated: true, completion: nil)
        self.navigationController?.pushViewController(showDetailNewsFeedVC, animated: true)
    }
    
}

// MARK: -
