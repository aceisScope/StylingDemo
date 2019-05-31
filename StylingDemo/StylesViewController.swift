//
//  StylesViewController.swift
//  StylingDemo
//
//  Created by Binghui Liu on 29/05/2019.
//  Copyright © 2019 Binghui Liu. All rights reserved.
//

import UIKit
import BonMot

class SingleLabelCell: UITableViewCell {
    @IBOutlet var stylesLabel: UILabel?
}

class DoubleLabelCell: UITableViewCell {
    @IBOutlet var leftLabel: UILabel?
    @IBOutlet var rightLabel: UILabel?
}

class StylesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section < tableView.numberOfSections - 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SingleLabelCell", for: indexPath) as! SingleLabelCell
            switch indexPath.section {
            case 0:
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.lineHeightMultiple = 0.8
                paragraphStyle.headIndent = 18
                
                let attributes: [NSAttributedString.Key : Any] = [
                    .font: UIFont(name: "ZillaSlab-Medium", size: 20)!,
                    .foregroundColor: UIColor.brown,
                    .paragraphStyle: paragraphStyle,
                ]
                cell.stylesLabel?.attributedText = NSAttributedString(string: "→ Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", attributes: attributes)
            case 1:
                cell.stylesLabel?.bonMotStyle = Styles.brownBody
                cell.stylesLabel?.styledText = "→ Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
            case 2:
                cell.stylesLabel?.styledText = "→ Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
            case 3:
                cell.stylesLabel?.bonMotStyle = Styles.xmlStyle
                cell.stylesLabel?.styledText = "Lorem ipsum dolor sit amet, <large>consectetur adipiscing</large> elit, sed do eiusmod tempor incididunt ut <kern>labore et dolore magna aliqua.</kern>"
            default:
                break
            }
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DoubleLabelCell", for: indexPath) as! DoubleLabelCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "NSAtrributedString"
        case 1:
            return "brownBody"
        case 2:
            return "Registered style: magentaTracking"
        case 3:
            return "XML styles"
        case 4:
            return "Vertical Text Alignment"
        default:
            return nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
    }


}

