//
//  PixarQuestionsViewController.swift
//  PixarMultipleChoices
//
//  Created by Weiling Chang on 06/09/2017.
//  Copyright © 2017 Lynne. All rights reserved.
//

import UIKit
import GameKit

class PixarQuestionsViewController: UIViewController {
    var number = 0
    var grade = 0
    var distribution: GKShuffledDistribution?
    var total = 10
    var count = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet var choiceButtons: [UIButton]!
    @IBAction func unwindToPixarQuestionsPage(segue: UIStoryboardSegue){
        distribution = GKShuffledDistribution(lowestValue: 0, highestValue: questions.count - 1)
        number = distribution!.nextInt()
        count = 1
        grade = 0
        updateUI()
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        let question = questions[number]
        let buttonIndex = choiceButtons.index(of: sender)
        if question.answer == question.choices[buttonIndex!]{
            grade += 10
        }
        nextQuestion()
    }
    
    let questions = [Question(description: "Buzz Lightyear巴斯光年出自哪一部pixar卡通？", answer: "玩具總動員", choices: ["怪獸電力公司", "玩具總動員", "彼得潘"]), Question(description: "以下何者不是Inside Out角色？", answer: "彼得潘", choices: ["彼得潘", "樂樂", "憂憂"]), Question(description: "Marlin的兒子是？", answer: "Nemo", choices: ["彼得潘", "Nemo", "Dory"]), Question(description: "巴小倩與巴小飛的關係是？", answer: "姐弟", choices: ["姐弟", "母子", "夫妻"]), Question(description: "Carl與Ellie一直夢想要去的地方是？", answer: "南美洲仙境瀑布", choices: ["北極", "夢幻島", "南美洲仙境瀑布"]), Question(description: "巨鳥凱文的性別是？", answer: "女生", choices: ["男生", "沒有性別", "女生"]), Question(description: "毛怪最好的朋友是？", answer: "大眼仔", choices: ["大眼仔", "彼得潘", "胡迪警長"]), Question(description: "Remy小米想成為？", answer: "廚師", choices: ["軍人", "彼得潘", "廚師"]), Question(description: "料理鼠王的故事發生在哪裡？", answer: "法國巴黎", choices: ["夢幻島", "法國巴黎", "美國加州"]), Question(description: "Princess Atta雅婷公主是什麼生物？", answer: "螞蟻", choices: ["人", "螞蟻", "蟑螂"])]
    
    func updateUI() {
        let question = questions[number]
        questionLabel.text = question.description
        var i = 0
        for choice in choiceButtons{
            choice.setTitle(question.choices[i], for: UIControlState.normal)
            i += 1
        }
        numberLabel.text = "\(count)"
    }
    
    func nextQuestion(){
        number = distribution!.nextInt()
        count += 1
        if count <= total{
            updateUI()
        }else {
            performSegue(withIdentifier: "showResult", sender: nil)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        distribution = GKShuffledDistribution(lowestValue: 0, highestValue: questions.count - 1)
        number = distribution!.nextInt()
        count += 1
        updateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let controller = segue.destination as! ResultViewController
        controller.totalgrade = grade
    }
    

}
