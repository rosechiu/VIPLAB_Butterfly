//
//  HomePageViewController.swift
//  VIPLAB_Butterfly
//
//  Created by viplab on 2021/3/1.
//

import UIKit

class HomePageViewController: UIViewController {

    @IBOutlet var image: UIImageView!
    
    @IBOutlet var button_identify: UIButton!
    @IBOutlet var button_book: UIButton!
    @IBOutlet var button_partner: UIButton!
    
    @IBOutlet var label_identify: UILabel!
    @IBOutlet var label_book: UILabel!
    @IBOutlet var label_partner: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //取得螢幕的高度與寬度
        let screen_height = self.view.frame.height
        let screen_width = self.view.frame.width
        
        //計算高度和寬度單元
        let h = screen_height/14
        let w = screen_width/3
        
        //設置button的大小
        button_identify.frame = CGRect(x: 0, y: h*12.5, width: w, height: h*1.5/3*2)
        button_book.frame = CGRect(x: w, y: h*12.5, width: w, height: h*1.5/3*2)
        button_partner.frame = CGRect(x: w*2, y: h*12.5, width: w, height: h*1.5/3*2)
        
        //設置label的大小
        label_identify.frame = CGRect(x: 0, y: h*13.5, width: w, height: h*0.5)
        label_book.frame = CGRect(x: w, y: h*13.5, width: w, height: h*0.5)
        label_partner.frame = CGRect(x: w*2, y: h*13.5, width: w, height: h*0.5)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
