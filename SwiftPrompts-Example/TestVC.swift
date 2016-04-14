//
//  TestVC.swift
//  SwiftPrompts
//
//  Created by admin on 16/4/13.
//
//

import UIKit

class TestVC: UIViewController {

    @IBAction func galiveButtonClicked(sender: AnyObject) {
        func mainButtonAction() {
            print("mainButtonAction")
        }
        
        func secondButtonAction() {
            print("secondButtonAction")
        }
        
        func cancleAction() {
            print("cancelAction")
        }
        
        
        let promptBox = SwiftPromptBox(title: "title", message: "就像使用UIAlertController一样", moveCancel:true, onView: self.view)
        promptBox.selectStyle(SwiftPromptViewStyle.GALive)
        
        promptBox.addButtonAction(SwiftPromptsActionType.Cancel, title: "", buttonTextColor: nil) {
            cancleAction()
        }
        
        promptBox.addButtonAction(SwiftPromptsActionType.MainButtonClicked, title: "main", buttonTextColor: UIColor(red: 151.0/255.0, green: 214.0/255.0, blue: 68.0/255.0, alpha: 1.0)) {
            mainButtonAction()
        }
        
        promptBox.addButtonAction(SwiftPromptsActionType.SecondButtonClicked, title: "second", buttonTextColor: nil) {
            secondButtonAction()
        }
        

        promptBox.showMessageBox()
    }
    
    @IBAction func successButtonClicked(sender: AnyObject) {
        let promptBox = SwiftPromptBox(title: "success", message: "successMsg", moveCancel:false, onView: self.view)
        promptBox.selectStyle(SwiftPromptViewStyle.Success)
        
        promptBox.showMessageBox()
        
        
    }
    
    @IBAction func deleteButtonClicked(sender: AnyObject) {
        func mainClicked() {
            print("delete:mainButtonAction")
        }
        
        func cancle() {
            print("delete:cancelAction")
        }
        
        let promptBox = SwiftPromptBox(title: "delete", message: "deleteMsg", moveCancel:false, onView: self.view)
        promptBox.selectStyle(SwiftPromptViewStyle.Success)
        
        promptBox.addButtonAction(SwiftPromptsActionType.Cancel, title: "", buttonTextColor: nil) {
            cancle()
        }
        
        promptBox.addButtonAction(SwiftPromptsActionType.MainButtonClicked, title: "delete", buttonTextColor: UIColor(red: 151.0/255.0, green: 214.0/255.0, blue: 68.0/255.0, alpha: 1.0)) {
            mainClicked()
        }
        
        promptBox.showMessageBox()
    }
}
