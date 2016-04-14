在**SwiftPrompts**基础上修改，方便同时需要定义多个不同功能提示框的场景，与 **UIAlertController** 使用方法类似

## 示例代码 
```

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

```

