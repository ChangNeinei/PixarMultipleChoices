//
//  ResultViewController.swift
//  PixarMultipleChoices
//
//  Created by Weiling Chang on 07/09/2017.
//  Copyright © 2017 Lynne. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var totalgrade = 0
    @IBOutlet weak var gradeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        gradeLabel.text = "\(totalgrade)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
