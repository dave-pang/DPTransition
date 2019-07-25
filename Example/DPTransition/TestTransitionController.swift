//
//  TestTransitionController.swift
//  DPTemplate_Example
//
//  Created by Dave on 23/07/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class TestTransitionController: UITableViewController { }

extension TestTransitionController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch Item(rawValue: indexPath.row)! {
        case .cell:
            ()
        case .image:
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TestImageTransitionController") as! TestImageTransitionController
            vc.transition = self
            self.present(vc, animated: true, completion: nil)
        }
    }
}

extension TestTransitionController: DPTransition {
    var transitionDuration: TimeInterval {
        return 0.3
    }
}

extension TestTransitionController {
    enum Item: Int {
        case cell
        case image
    }
}
