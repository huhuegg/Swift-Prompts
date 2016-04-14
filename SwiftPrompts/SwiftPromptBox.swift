//
//  SwiftPromptsController.swift
//  SwiftPrompts
//
//  Created by admin on 16/4/13.
//
//

import UIKit


enum SwiftPromptsActionType {
    case Cancel
    case MainButtonClicked
    case SecondButtonClicked
}

enum SwiftPromptViewStyle {
    case Custom
    case Success
    case Delete
    case GALive
}

typealias SwiftPromptCallback=()->Void

class SwiftPromptBox: NSObject,SwiftPromptsProtocol {
    
    var cancelAction:SwiftPromptCallback?
    var mainButtonAction:SwiftPromptCallback?
    var secondButtonAction:SwiftPromptCallback?
    
    var title:String
    var message:String
    
    let parentView:UIView?
    let prompt:SwiftPromptsView!
    
    init(title: String, message: String, moveCancel:Bool, onView:UIView) {
        
        self.title = title
        self.message = message
        self.parentView = onView
        
        prompt = SwiftPromptsView(frame: parentView!.bounds)
        prompt.enableGesturesOnPrompt(moveCancel)
    }
    
    
    func addButtonAction(type:SwiftPromptsActionType,title: String?,buttonTextColor:UIColor? , callback: SwiftPromptCallback?) {
        switch type {
        case .Cancel:
            cancelAction = callback
            break
        case .MainButtonClicked:
            if let _ = title {
                prompt.setMainButtonText(title!)
            }
            if let _ = buttonTextColor {
                prompt.setMainButtonColor(buttonTextColor!)
            }
            mainButtonAction = callback
            break
        case .SecondButtonClicked:
            if mainButtonAction != nil {
                if let _ = title {
                    prompt.setSecondButtonText(title!)
                }
                if let _ = buttonTextColor {
                    prompt.setSecondButtonColor(buttonTextColor!)
                }
                secondButtonAction = callback
            } else {
                print("mainButton is nil, can't defined secondButtonAction")
            }
            break
        default:
            break
        }
        
        if mainButtonAction != nil && secondButtonAction != nil {
            prompt.enableDoubleButtonsOnPrompt()
        }
    }
    
    func promptsBoxAlreadyExisted() -> Bool {
        if let parent = parentView {
            for subview in parent.subviews {
                if let _ = subview as? SwiftPromptsView {
                    return true
                }
            }
        }
        return false
    }
    
    func showMessageBox() {
        if let parent = parentView {
            if promptsBoxAlreadyExisted() {
                print("promptsBoxAlreadyExisted, skip showMessageBox")
                return
            }
            
            prompt.delegate = self
            
            //Set the properties for the background
            prompt.setColorWithTransparency(UIColor.clearColor())
            
            //Set the properties of the prompt
            prompt.setPromptHeader(self.title)
            prompt.setPromptContentText(self.message)
            
            
            parent.addSubview(prompt)
        }
    }
    
    //MARK:- SwiftPromptViewStyle
    func selectStyle(style:SwiftPromptViewStyle) {
        switch style {
        case .Success:
            successStyle()
            break
        case .Delete:
            deleteStyle()
            break
        case .GALive:
            galiveStyle()
            break
        default:
            break
        }
    }
    
    func successStyle() {
        //Set the properties for the background
        prompt.enableLightEffectView()
        
        //Set the properties of the prompt
        prompt.setPromptHeader("Success")
        prompt.setPromptContentText("操作成功")
        prompt.setPromptTopLineVisibility(true)
        prompt.setPromptBottomLineVisibility(false)
        prompt.setPromptBottomBarVisibility(true)
        prompt.setPromptTopLineColor(UIColor(red: 151.0/255.0, green: 151.0/255.0, blue: 151.0/255.0, alpha: 1.0))
        prompt.setPromptBackgroundColor(UIColor(red: 255.0/255.0, green: 253.0/255.0, blue: 195.0/255.0, alpha: 1.0))
        prompt.setPromptBottomBarColor(UIColor(red: 34.0/255.0, green: 139.0/255.0, blue: 34.0/255.0, alpha: 0.67))
        prompt.setMainButtonColor(UIColor.whiteColor())
        prompt.setMainButtonText("OK")
        
        prompt.setPromptContentTxtSize(13.0)
    }
    
    func deleteStyle() {
        //Set the properties for the background
        
        prompt.enableDarkEffectView()
        
        //Set the properties of the prompt
        prompt.setPromptHeader("Delete")
        prompt.setPromptTopLineVisibility(true)
        prompt.setPromptBottomLineVisibility(false)
        prompt.setPromptBottomBarVisibility(true)
        prompt.setPromptDismissIconVisibility(true)
        prompt.setPromptOutlineVisibility(true)
        prompt.setPromptHeaderTxtColor(UIColor(red: 255.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0))
        prompt.setPromptOutlineColor(UIColor(red: 133.0/255.0, green: 133.0/255.0, blue: 133.0/255.0, alpha: 1.0))
        prompt.setPromptDismissIconColor(UIColor(red: 133.0/255.0, green: 133.0/255.0, blue: 133.0/255.0, alpha: 1.0))
        prompt.setPromptTopLineColor(UIColor(red: 151.0/255.0, green: 151.0/255.0, blue: 151.0/255.0, alpha: 1.0))
        prompt.setPromptBackgroundColor(UIColor(red: 255.0/255.0, green: 253.0/255.0, blue: 195.0/255.0, alpha: 1.0))
        prompt.setPromptBottomBarColor(UIColor(red: 255.0/255.0, green: 214.0/255.0, blue: 68.0/255.0, alpha: 1.0))
        prompt.setMainButtonColor(UIColor.whiteColor())
        prompt.setMainButtonText("Delete")
        
        prompt.setPromptContentTxtSize(13.0)
    }
    
    func galiveStyle() {
        
        let topBar = true
        let bottomBar = false
        let topLine = false
        let bottomLine = true
        let backgroundColor = UIColor(red: 255.0/255.0, green: 253.0/255.0, blue: 195.0/255.0, alpha: 1.0)
        let headBarColor:UIColor = UIColor(red: 100.0/255.0, green: 212.0/255.0, blue: 72.0/255.0, alpha: 1.0)
        let headTextColor:UIColor = UIColor.whiteColor()
        let bottomLineColor:UIColor = UIColor(red: 151.0/255.0, green: 151.0/255.0, blue: 151.0/255.0, alpha: 1.0)
        let dividerColor:UIColor = UIColor(red: 151.0/255.0, green: 151.0/255.0, blue: 151.0/255.0, alpha: 1.0)
        
        
        
        prompt.setPromptTopBarVisibility(topBar)
        prompt.setPromptBottomBarVisibility(bottomBar)
        prompt.setPromptTopLineVisibility(topLine)
        prompt.setPromptBottomLineVisibility(bottomLine)
        prompt.setPromptBottomLineVisibility(bottomLine)
        
        prompt.setPromptBackgroundColor(backgroundColor)
        prompt.setPromptHeaderBarColor(headBarColor)
        prompt.setPromptHeaderTxtColor(headTextColor)
        prompt.setPromptBottomLineColor(bottomLineColor)
        prompt.setPromptButtonDividerColor(dividerColor)
        
        prompt.setPromptContentTxtSize(13.0)
    }
    
    //MARK:- SwiftPromptsProtocol
    func onCancel() {
        if let action = cancelAction {
            action()
        }
    }
    
    func clickedOnTheMainButton() {
        print("Clicked on the main button")
        if let action = mainButtonAction {
            action()
        }
        prompt.dismissPrompt()
    }
    
    func clickedOnTheSecondButton() {
        print("Clicked on the second button")
        if let action = secondButtonAction {
            action()
        }
        prompt.dismissPrompt()
        
    }
    
    func promptWasDismissed() {
        print("Dismissed the prompt")
    }
}
