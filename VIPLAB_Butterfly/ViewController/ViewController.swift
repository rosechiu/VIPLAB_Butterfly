//
//  ViewController.swift
//  VIPLAB_Butterfly
//
//  Created by viplab on 2021/3/1.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var login_background: UIImageView!
    @IBOutlet var button_login: UIButton!
    @IBOutlet var button_signup: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //取得螢幕的高度與寬度
        let screen_height = self.view.frame.height
        let screen_width = self.view.frame.width
        
        //計算高度和寬度單元
        let h = screen_height/14
        let w = screen_width/5
        
        self.login_background.frame = CGRect(x: 0, y: 0, width: screen_width, height: h*10)
        self.button_login.frame = CGRect(x: w, y: h*10.5, width: w*3, height: h)
        self.button_signup.frame = CGRect(x: w, y: h*12, width: w*3, height: h)
        
        //使按鈕有圓角效果
        self.button_login.layer.cornerRadius = h/2
        self.button_signup.layer.cornerRadius = h/2
        
        //隱藏navigation bar
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.backgroundColor = .clear
    }


}

