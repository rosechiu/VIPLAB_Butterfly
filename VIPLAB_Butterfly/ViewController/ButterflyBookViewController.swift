//
//  ButterflyBookViewController.swift
//  VIPLAB_Butterfly
//
//  Created by viplab on 2021/3/3.
//

import UIKit

class ButterflyBookViewController: UIViewController, UITextFieldDelegate {

    // 1:弄蝶科, 2:粉蝶科, 3:鳳蝶科, 4:灰蝶科, 5:蛺蝶科
    @IBOutlet var button_butterfly1: UIButton!
    @IBOutlet var button_butterfly2: UIButton!
    @IBOutlet var button_butterfly3: UIButton!
    @IBOutlet var button_butterfly4: UIButton!
    @IBOutlet var button_butterfly5: UIButton!
    
    // 1:弄蝶科, 2:粉蝶科, 3:鳳蝶科, 4:灰蝶科, 5:蛺蝶科
    @IBOutlet var label_butterfly1: UILabel!
    @IBOutlet var label_butterfly2: UILabel!
    @IBOutlet var label_butterfly3: UILabel!
    @IBOutlet var label_butterfly4: UILabel!
    @IBOutlet var label_butterfly5: UILabel!
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var checkButton: UIButton!
    
    var butterfly: Array<String> = []
    let name1 = ["橙翅傘弄蝶","鐵色絨弄蝶","尖翅絨弄蝶","無尾絨弄蝶","圓翅絨弄蝶","長翅弄蝶","綠弄蝶","褐翅綠弄蝶","尖赤星弄蝶","黑澤星弄蝶","小星弄蝶","埔里星弄蝶","台灣流星弄蝶","大流星弄蝶","台灣窗弄蝶","小紋颯弄蝶","台灣颯弄蝶","台灣瑟弄蝶","白裙弄蝶","玉帶弄蝶","白弄蝶","小黃星弄蝶","黃星弄蝶","弧弄蝶","黃點弄蝶","台灣脈弄蝶","昏列弄蝶","白斑弄蝶","袖弄蝶","連紋袖弄蝶","薑弄蝶","黑星弄蝶","蕉弄蝶","台灣赭弄蝶","黃斑弄蝶","淡黃斑弄蝶","墨子黃斑弄蝶","蓬萊黃斑弄蝶","寬邊橙斑弄蝶","竹燈斑弄蝶","熱帶橙斑弄蝶","稻弄蝶","小姬弄蝶","禾弄蝶","假禾弄蝶","褐弄蝶","尖翅褐弄蝶","中華褐弄蝶","巨褐弄蝶","黃紋孔弄蝶","碎紋孔弄蝶","短紋孔弄蝶","長紋孔弄蝶","奇萊孔弄蝶","黯弄蝶","變紋黯弄蝶"]
    let name2 = ["豔粉蝶","白豔粉蝶","條斑艷粉蝶","黃裙艷粉蝶","流星絹粉蝶","白絹粉蝶","截脈絹粉蝶","白粉蝶","緣點白粉蝶","飛龍白粉蝶","淡褐脈粉蝶","黑脈粉蝶","鑲邊尖粉蝶","尖粉蝶","異色尖粉蝶","雲紋尖粉蝶","鋸粉蝶","纖粉蝶","異粉蝶","橙端粉蝶","細波遷粉蝶","遷粉蝶","黃裙遷粉蝶","紋黃蝶","圓翅鉤粉蝶","台灣鉤粉蝶","星黃蝶","角翅黃蝶","淡色黃蝶","黃蝶","北黃蝶","島嶼黃蝶","亮色黃蝶"]
    let name3 = ["黃裳鳳蝶","珠光裳鳳蝶","曙鳳蝶","多姿麝鳳蝶","長尾麝鳳蝶","麝鳳蝶","紅珠鳳蝶","劍鳳蝶","黑尾劍鳳蝶","青鳳蝶","寬帶青鳳蝶","木蘭青鳳蝶","翠斑青鳳蝶","斑鳳蝶","黃星斑鳳蝶","大斑鳳蝶","台灣寬尾鳳蝶","花鳳蝶","黃鳳蝶","柑橘鳳蝶","玉帶鳳蝶","黑鳳蝶","白紋鳳蝶","大白紋鳳蝶","無尾白紋鳳蝶","台灣鳳蝶","大鳳蝶","翠鳳蝶","穹翠鳳蝶","雙環翠鳳蝶","台灣琉璃翠鳳蝶","琉璃翠鳳蝶","烏鴉鳳蝶(亞種)"]
    let name4 = ["蚜灰蝶","熙灰蝶","銀灰蝶","台灣銀灰蝶","紫日灰蝶","蔚青紫灰蝶","小紫灰蝶","日本紫灰蝶","暗色紫灰蝶","燕尾紫灰蝶","凹翅紫灰蝶","台灣焰灰蝶","赭灰蝶","墨點灰蝶","線灰蝶","瓏灰蝶","朗灰蝶","珠灰蝶","鋩灰蝶","伏氏鋩灰蝶","阿里山鐵灰蝶","台灣鐵灰蝶","台灣榿翠灰蝶","碧翠灰蝶","黃閃翠灰蝶","小翠灰蝶","拉拉山翠灰蝶","霧社翠灰蝶","清金翠灰蝶","單線翠灰蝶","白芒翠灰蝶","夸父璀灰蝶","尖灰蝶","褐翅青灰蝶","白腹青灰蝶","漣紋青灰蝶","鈿灰蝶","蘭灰蝶","玳灰蝶","淡黑店玳灰蝶","緣灰蝶","閃灰蝶","菫彩燕灰蝶","燕灰蝶","霓彩燕灰蝶","高砂燕灰蝶","台灣酒灰蝶","秀酒灰蝶","田中酒灰蝶","江崎酒灰蝶","井上酒灰蝶","南方酒灰蝶","渡氏烏灰蝶","鑽灰蝶","小鑽灰蝶","拉拉山鑽灰蝶","三尾灰蝶","虎灰蝶","三斑虎灰蝶","蓬萊虎灰蝶","巒大鋸灰蝶","大娜波灰蝶","南方娜波灰蝶","熱帶娜波灰蝶","暗色娜波灰蝶","波灰蝶","密紋波灰蝶","雅波灰蝶","淡青雅波灰蝶","青珈波灰蝶","奇波灰蝶","豆波灰蝶","細灰蝶","藍灰蝶","莧藍灰蝶","折列藍灰蝶","單點藍灰蝶","迷你藍灰蝶","燕藍灰蝶","南方燕藍灰蝶","台灣玄灰蝶","密點玄灰蝶","森灰蝶","藍丸灰蝶","黑丸灰蝶","黑星灰蝶","嫵琉灰蝶","白斑嫵琉灰蝶","靛色琉灰蝶","白紋琉灰蝶","琉灰蝶","杉谷琉灰蝶","大紫琉灰蝶","細邊琉灰蝶","寬邊琉灰蝶","白雀斑灰蝶","青雀斑灰蝶","綺灰蝶","蘇鐵綺灰蝶","東方晶灰蝶","白點褐蜆蝶","銀紋尾蜆蝶"]
    let name5 = ["東方喙蝶","虎斑蝶","金斑蝶","淡紋青斑蝶","小紋青斑蝶","絹斑蝶","斯氏絹斑蝶","大絹斑蝶","斑蝶","雙標紫斑蝶","異紋紫斑蝶","大紫斑蝶","圓翅紫斑蝶","小紫斑蝶","大白斑蝶","寧麻珍蝶","綠豹蛺蝶","熱帶豹蛺蝶","斐豹蛺蝶","琺蛺蝶","黃襟蛺蝶","眼蛺蝶","鱗紋眼蛺蝶","青眼蛺蝶","黯眼蛺蝶","南洋眼蛺蝶","波紋眼蛺蝶","枯葉蝶","黃帶隱蛺蝶","囊葉蝶","大紅蛺蝶","小紅蛺蝶","突尾鉤蛺蝶","黃鉤蛺蝶","琉璃蛺蝶","緋蛺蝶","散紋盛蛺蝶","花豹盛蛺蝶","雌擬幻蛺蝶","幻蛺蝶","端紫幻蛺蝶","波蛺蝶","豆環蛺蝶","小環蛺蝶","斷線環蛺蝶","細帶環蛺蝶","無邊環蛺蝶","蓬萊環蛺蝶","流紋環蛺蝶","眉紋環蛺蝶","深山環蛺蝶","蓮花環蛺蝶","槭環蛺蝶","鑲紋環蛺蝶","奇環蛺蝶","黑星環蛺蝶","單環蛺蝶","金環蛺蝶","殘眉線蛺蝶","玄珠帶蛺蝶","流帶蛺蝶","白圈帶蛺蝶","寬帶蛺蝶","幻紫帶蛺蝶","異紋帶蛺蝶","雙色帶蛺蝶","紫俳蛺蝶","瑙蛺蝶","紅玉翠蛺蝶","連珠翠蛺蝶","馬拉巴翠蛺蝶","台灣翠蛺蝶","窄帶翠蛺蝶","網絲蛺蝶","流星蛺蝶","絹蛺蝶","白裳貓蛺蝶","金鍇蛺蝶","普氏白蛺蝶","白蛺蝶","燦蛺蝶","台灣燦蛺蝶","紅斑脈蛺蝶","大紫蛺蝶","雙尾蛺蝶","小雙尾蛺蝶","箭環蝶","串珠環蝶","方環蝶","小波眼蝶","大藏波眼蝶","達邦波眼蝶","寶島波眼蝶","白漪波眼蝶","狹翅波眼蝶","密紋波眼蝶","江崎波眼蝶","白帶波眼蝶","王氏波眼蝶","巨波眼蝶","罕波眼蝶","文龍波眼蝶","古眼蝶","大幽眼蝶","圓翅幽眼蝶","玉山幽眼蝶","長紋黛眼蝶","波紋黛眼蝶","玉帶黛眼蝶","深山黛眼蝶","大深山黛眼蝶","曲紋黛眼蝶","台灣黛眼蝶","柯氏黛眼蝶","月神黛眼蝶","巴氏黛眼蝶","孿斑黛眼蝶","黃斑蔭眼蝶","布氏蔭眼蝶","白斑蔭眼蝶","褐翅蔭眼蝶","眉眼蝶","淺色眉眼蝶","稻眉眼蝶","罕眉眼蝶","曲斑眉眼蝶","切翅眉眼蝶","小眉眼蝶","永澤蛇眼蝶","暮眼蝶","森林暮眼蝶","台灣斑眼蝶","藍紋鋸眼蝶","玉帶斑蝶"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //取得螢幕的高度與寬度
        let screen_height = self.view.frame.height
        let screen_width = self.view.frame.width
        
        //計算高度和寬度單元
        let h = screen_height/14
        let w = screen_width/9
        
        button_butterfly1.frame = CGRect(x: w, y: h*2, width: w*3, height: h*2)
        label_butterfly1.frame = CGRect(x: w, y: button_butterfly1.frame.maxY, width: w*3, height: h)
        
        button_butterfly2.frame = CGRect(x: w*5, y: h*2, width: w*3, height: h*2)
        label_butterfly2.frame = CGRect(x: w*5, y: button_butterfly2.frame.maxY, width: w*3, height: h)
        
        button_butterfly3.frame = CGRect(x: w, y: label_butterfly1.frame.maxY, width: w*3, height: h*2)
        label_butterfly3.frame = CGRect(x: w, y: button_butterfly3.frame.maxY, width: w*3, height: h)
        
        button_butterfly4.frame = CGRect(x: w*5, y: label_butterfly2.frame.maxY, width: w*3, height: h*2)
        label_butterfly4.frame = CGRect(x: w*5, y: button_butterfly4.frame.maxY, width: w*3, height: h)
        
        button_butterfly5.frame = CGRect(x: w, y: label_butterfly3.frame.maxY, width: w*3, height: h*2)
        label_butterfly5.frame = CGRect(x: w, y: button_butterfly5.frame.maxY, width: w*3, height: h)
        
        textField.frame = CGRect(x: w, y: h*12, width: w*6, height: h)
        checkButton.frame = CGRect(x: w*7, y: h*12, width: w, height: h)
        
        textField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func Click_Button(_ sender: Any) {
        performSegue(withIdentifier: "gotoTableView", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as? ButterflyTableViewController
        if let button = sender as? UIButton {
            if button.tag == 0 {
                controller?.text = "弄蝶"
            }
            else if button.tag == 1 {
                controller?.text = "粉蝶"
            }
            else if button.tag == 2 {
                controller?.text = "鳳蝶"
            }
            else if button.tag == 3 {
                controller?.text = "灰蝶"
            }
            else if button.tag == 4 {
                controller?.text = "蛺蝶"
            }
            else {
                controller?.text = "搜尋"
                controller?.searchText = textField.text!
                
                for i in [name1, name2, name3, name4, name5] {
                    var c = 0
                    for j in i {
                        if j.contains(textField.text!) == true {
                            butterfly.append(j)
                        }
                        c = c + 1
                    }
                }
                
                if butterfly.count == 0 {
                    let alertController = UIAlertController(title: "查無此關鍵字", message: "請輸入其他關鍵字", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(okAction)
                    present(alertController, animated: true, completion: nil)
                }
                
            }
        }
    }
    

    
    

}
