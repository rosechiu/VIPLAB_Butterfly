//
//  IdentifyViewController.swift
//  VIPLAB_Butterfly
//
//  Created by viplab on 2021/3/1.
//

import UIKit

class IdentifyViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var butterfly_imageview: UIImageView!
    @IBOutlet var label_identify: UILabel!
    @IBOutlet var label_selectImage: UILabel!
    @IBOutlet var label_explain: UILabel!
    
    @IBOutlet var button_identify: UIButton!
    @IBOutlet var button_selectImage: UIButton!
    @IBOutlet var button_explain: UIButton!
    
    @IBOutlet var label_red: UILabel!
    @IBOutlet var label_blue: UILabel!
    @IBOutlet var label_yellow: UILabel!
    
    @IBOutlet var red_point: UIImageView!
    @IBOutlet var blue_point: UIImageView!
    @IBOutlet var yellow_point: UIImageView!
    
    //取得螢幕的高度與寬度
    var screen_height = 0.0
    var screen_width = 0.0
    //計算高度和寬度單元
    var h = 0.0
    var w = 0.0
    
    var original_image: UIImage!
    var image_pixel_w: Double!
    var image_pixel_h: Double!
    var scale: Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //取得螢幕的高度與寬度
        screen_height = Double(self.view.frame.height)
        screen_width = Double(self.view.frame.width)
        
        //計算高度和寬度單元
        h = screen_height/14
        w = screen_width/3
        
        //設置button的大小
        button_selectImage.frame = CGRect(x: 0, y: h*12, width: w, height: h*1.5)
        button_identify.frame = CGRect(x: w, y: h*12, width: w, height: h*1.5)
        button_explain.frame = CGRect(x: w*2, y: h*12, width: w, height: h*1.5)
        
        //讓button中的image比例不失真
        button_selectImage.imageView?.contentMode = .scaleAspectFit
        button_identify.imageView?.contentMode = .scaleAspectFit
        button_explain.imageView?.contentMode = .scaleAspectFit
        
        //設置label的大小
        label_selectImage.frame = CGRect(x: 0, y: h*13.5, width: w, height: h*0.5)
        label_identify.frame = CGRect(x: w, y: h*13.5, width: w, height: h*0.5)
        label_explain.frame = CGRect(x: w*2, y: h*13.5, width: w, height: h*0.5)
        
        label_red.frame = CGRect(x: 0, y: h*1.5, width: w*3, height: h*0.5)
        label_red.text = "紅色請標在後翅最末端"
        label_blue.frame = CGRect(x: 0, y: h*2, width: w*3, height: h*0.5)
        label_blue.text = "藍色請標在蝴蝶的複眼"
        label_yellow.frame = CGRect(x: 0, y: h*2.5, width: w*3, height: h*0.5)
        label_yellow.text = "黃色請標前翅頂部末端"
        
        init_ImageView()
        init_Point(point: red_point, X: screen_width/2, Y: screen_height/2)
        init_Point(point: blue_point, X: screen_width/2-h, Y: screen_height/2+h)
        init_Point(point: yellow_point, X: screen_width/2+h, Y: screen_height/2+h)
        
        resizeImageView()
    }
    
    //初始化三點
    func init_Point(point: UIImageView, X: Double, Y: Double) {
        point.frame.size = CGSize(width: h*0.7, height: h*0.7)
        point.center = CGPoint(x: X, y: Y)
        point.layer.cornerRadius = CGFloat(h*0.35)
    }
    
    //初始化欲辨識圖片
    func init_ImageView() {
        if (h*9>=self.screen_width*7/9) {
            butterfly_imageview.frame.size = CGSize(width: screen_width*7/9, height: screen_width*7/9)
        }
        else {
            butterfly_imageview.frame.size = CGSize(width: h*9, height: h*9)
        }
        butterfly_imageview.backgroundColor = UIColor.clear
        butterfly_imageview.center = CGPoint(x: screen_width/2, y: screen_height/2)
    }
    
    //使用者觸擊事件
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let t: UITouch = touch as! UITouch
            let loc = t.location(in: self.view)
            if red_point.frame.contains(loc) {
                red_point.center = loc
                print("RED_X:\(Double(loc.x-butterfly_imageview.frame.minX)/scale)")
                print("RED_Y:\(Double(loc.y-butterfly_imageview.frame.minY)/scale)")
            }
            else if blue_point.frame.contains(loc) {
                blue_point.center = loc
                print("BLUE_X:\(Double(loc.x-butterfly_imageview.frame.minX)/scale)")
                print("BLUE_Y:\(Double(loc.y-butterfly_imageview.frame.minY)/scale)")
            }
            else if yellow_point.frame.contains(loc) {
                yellow_point.center = loc
                print("YELLOW_X:\(Double(loc.x-butterfly_imageview.frame.minX)/scale)")
                print("YELLOW_Y:\(Double(loc.y-butterfly_imageview.frame.minY)/scale)")
            }
        }
    }
    
    //選擇圖片function
    @IBAction func selectImage(_ sender: UIButton!) {
        let picker: UIImagePickerController = UIImagePickerController()
        let alertController = UIAlertController(title: "選擇圖片", message: "開啟相簿或相機", preferredStyle: .actionSheet)
        let alertAction1 = UIAlertAction(title: "相簿", style: .default) { (_) in
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary) {
                picker.sourceType = UIImagePickerController.SourceType.photoLibrary
                picker.allowsEditing = true
                picker.delegate = self
                self.present(picker, animated: true, completion: nil)
            }
        }
        let alertAction2 = UIAlertAction(title: "相機", style: .default) { (_) in
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
                picker.sourceType = UIImagePickerController.SourceType.camera
                picker.allowsEditing = true
                picker.delegate = self
                self.present(picker, animated: true, completion: nil)
            }
        }
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        
        alertController.addAction(alertAction1)
        alertController.addAction(alertAction2)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        butterfly_imageview.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        resizeImageView()
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    //圖片大小依照原始畫素調整
    func resizeImageView() {
        original_image = butterfly_imageview.image
        image_pixel_w = Double(original_image.size.width)
        image_pixel_h = Double(original_image.size.height)
        if (image_pixel_w >= image_pixel_h) {
            scale = Double(butterfly_imageview.frame.width) / image_pixel_w
        }
        else if (image_pixel_w < image_pixel_h) {
            scale = Double(butterfly_imageview.frame.width) / image_pixel_h
        }
        butterfly_imageview.frame.size = CGSize(width: image_pixel_w*scale, height: image_pixel_h*scale)
        butterfly_imageview.center = CGPoint(x: screen_width/2, y: screen_height/2)
    }
    
    
}
