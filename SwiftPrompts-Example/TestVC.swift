//
//  TestVC.swift
//  SwiftPrompts
//
//  Created by admin on 16/4/13.
//
//

import UIKit

class TestVC: UIViewController {
    let testStr = "testStr"
    @IBAction func galiveButtonClicked(sender: AnyObject) {
        func mainClicked() {
            print("GALive:mainButtonAction:\(self.testStr)")
        }
        
        func secondClicked() {
            print("GALive:secondButtonAction:\(self.testStr)")
        }
        
        func cancle() {
            print("GALive:cancelAction:\(self.testStr)")
        }
        
        let promptBox = SwiftPromptBox(title: "包装SwiftPrompts", message: "修改为UIAlert定义方式\ndfadsfadfadsfadsfadsfasfasdfasfasdfadsfasdf\ndsfdasfafddfad", moveCancel:true, onView: self.view)
        promptBox.selectStyle(SwiftPromptViewStyle.GALive)
        
        promptBox.addButtonAction(SwiftPromptsActionType.Cancel, title: "", buttonTextColor: nil) {
            cancle()
        }
        
        promptBox.addButtonAction(SwiftPromptsActionType.MainButtonClicked, title: "main", buttonTextColor: UIColor(red: 151.0/255.0, green: 214.0/255.0, blue: 68.0/255.0, alpha: 1.0)) {
            mainClicked()
        }
        
        promptBox.addButtonAction(SwiftPromptsActionType.SecondButtonClicked, title: "second", buttonTextColor: nil) {
            secondClicked()
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
            print("delete:mainButtonAction:\(self.testStr)")
        }
        
        func cancle() {
            print("delete:cancelAction:\(self.testStr)")
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
