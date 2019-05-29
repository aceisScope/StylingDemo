//
//  StylesViewController.swift
//  StylingDemo
//
//  Created by Binghui Liu on 29/05/2019.
//  Copyright © 2019 Binghui Liu. All rights reserved.
//

import UIKit
import BonMot

class StylesCell: UITableViewCell {
    @IBOutlet var stylesLabel: UILabel?
}

class StylesViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StylesCell", for: indexPath) as! StylesCell
        if indexPath.row == 0 {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 0.8
            paragraphStyle.headIndent = 18
            
            let attributes: [NSAttributedString.Key : Any] = [
                .font: UIFont(name: "ZillaSlab-Medium", size: 20)!,
                .foregroundColor: UIColor.brown,
                .paragraphStyle: paragraphStyle,
            ]
            cell.stylesLabel?.attributedText = NSAttributedString(string: "→ Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", attributes: attributes)
        } else if indexPath.row == 1 {
            cell.stylesLabel?.bonMotStyle = Styles.brownBody
            cell.stylesLabel?.styledText = "→ Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        }
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
    }


}

