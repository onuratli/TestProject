//
//  ConditionsViewController.swift
//  TestProject
//
//  Created by Onur Atlı on 22/02/16.
//  Copyright © 2016 Onur Atlı. All rights reserved.
//

import UIKit

class ConditionsViewController: UIViewController , UITextFieldDelegate{
    
    var sampleTextField = UITextField()
    
    let scrollView = UIScrollView(frame: UIScreen.mainScreen().bounds)
    
    var textView:UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = self.scrollView

        let menuImage = UIImage(named: "hamburger")
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: menuImage, style: UIBarButtonItemStyle.Plain, target: slideMenuController(), action: "openLeft")
        self.navigationItem.title = "Katılım Koşulları"
        

        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "background")?.drawInRect(self.view.bounds)
        
        var image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        self.view.backgroundColor = UIColor(patternImage: image)
        
        let navigationBgColor = UIColor(red: 59, green: 175, blue: 218)
        navigationController!.navigationBar.barTintColor = navigationBgColor
        
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]

        textField()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addTextView()
    {
        
        var content = ""
        
        sampleTextField = UITextField(frame: CGRectMake(10, 110, self.view.frame.width-20, self.view.frame.height-50))
        sampleTextField.placeholder = "Enter text here"
        sampleTextField.font = UIFont.systemFontOfSize(15)
        sampleTextField.borderStyle = UITextBorderStyle.RoundedRect
        sampleTextField.autocorrectionType = UITextAutocorrectionType.No
        sampleTextField.keyboardType = UIKeyboardType.Default
        sampleTextField.returnKeyType = UIReturnKeyType.Done
        sampleTextField.clearButtonMode = UITextFieldViewMode.WhileEditing;
        sampleTextField.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
        sampleTextField.delegate = self
        self.view.addSubview(sampleTextField)
        read()
        
        
        if let aStreamReader = StreamReader(path: "/Users/vvtech/Documents/TestProject/TestProject/icerik.txt") {
            defer {
                aStreamReader.close()
            }
            while let line = aStreamReader.nextLine() {
            }
        }
        
        sampleTextField.text = "onur" + "\n" + "atlı"
    }
    
    
    
    func AddTxt()
    {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width;
        let screenHeight = screenSize.height;
        
        //Create textview
        let textView : UITextField = UITextField(frame : CGRect(x:10, y:(screenHeight/2), width:        (screenWidth-20), height: (screenHeight/3) ))
        textView.backgroundColor = UIColor( red: 0.9, green: 0.9, blue:0.9, alpha: 1.0 )
        textView.placeholder = NSLocalizedString("Start typing...", comment: "")
        textView.borderStyle = UITextBorderStyle.Line;
        textView.autocorrectionType = .Yes
        self.view.addSubview(textView)
    }
    
    
    
    
    func oku() -> String
    {
        let myFileURL = NSBundle.mainBundle().URLForResource("icerik", withExtension: "txt")!
        let myText = try! String(contentsOfURL: myFileURL, encoding: NSUTF8StringEncoding)
        return myText
    }
    
    
    func textField() {
            let textView = UITextView(frame: CGRectMake(10, 17, self.view.frame.width-20, self.view.frame.height-100))
            textView.textAlignment = NSTextAlignment.Center
            textView.textColor = UIColor.blackColor()
            textView.backgroundColor = UIColor.clearColor()
            textView.text = oku()
            textView.font = UIFont(name: "KannadaSangamMN", size: 15)
            self.view.addSubview(textView)
    }
    
    
    func read()
    {
        oku()

    }
    
    func arrayFromContentsOfFileWithName(fileName: String) -> [String]? {
    guard let path = NSBundle.mainBundle().pathForResource(fileName, ofType: "rtf") else {
    return nil
        }
    
    do{
    let content = try String(contentsOfFile:path, encoding: NSUTF8StringEncoding)
    return content.componentsSeparatedByString("\n")
    } catch _ as NSError {
    return nil
    }
}

    
    func textFieldDidBeginEditing(textField: UITextField) {
        print("TextField did begin editing method called")
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        print("TextField did end editing method called")
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        print("TextField should begin editing method called")
        return true;
    }
    
    func textFieldShouldClear(textField: UITextField) -> Bool {
        print("TextField should clear method called")
        return true;
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        print("TextField should snd editing method called")
        return true;
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        print("While entering the characters this method gets called")
        return true;
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        print("TextField should return method called")
        textField.resignFirstResponder();
        return true;
    }

}


class StreamReader  {
    
    let encoding : UInt
    let chunkSize : Int
    
    var fileHandle : NSFileHandle!
    let buffer : NSMutableData!
    let delimData : NSData!
    var atEof : Bool = false
    
    init?(path: String, delimiter: String = "\n", encoding : UInt = NSUTF8StringEncoding, chunkSize : Int = 4096) {
        self.chunkSize = chunkSize
        self.encoding = encoding
        
        if let fileHandle = NSFileHandle(forReadingAtPath: path),
            delimData = delimiter.dataUsingEncoding(encoding),
            buffer = NSMutableData(capacity: chunkSize)
        {
            self.fileHandle = fileHandle
            self.delimData = delimData
            self.buffer = buffer
        } else {
            self.fileHandle = nil
            self.delimData = nil
            self.buffer = nil
            return nil
        }
    }
    
    deinit {
        self.close()
    }
    
    /// Return next line, or nil on EOF.
    func nextLine() -> String? {
        precondition(fileHandle != nil, "Attempt to read from closed file")
        
        if atEof {
            return nil
        }
        
        // Read data chunks from file until a line delimiter is found:
        var range = buffer.rangeOfData(delimData, options: [], range: NSMakeRange(0, buffer.length))
        while range.location == NSNotFound {
            let tmpData = fileHandle.readDataOfLength(chunkSize)
            if tmpData.length == 0 {
                // EOF or read error.
                atEof = true
                if buffer.length > 0 {
                    // Buffer contains last line in file (not terminated by delimiter).
                    let line = NSString(data: buffer, encoding: encoding)
                    
                    buffer.length = 0
                    return line as String?
                }
                // No more lines.
                return nil
            }
            buffer.appendData(tmpData)
            range = buffer.rangeOfData(delimData, options: [], range: NSMakeRange(0, buffer.length))
        }
        
        // Convert complete line (excluding the delimiter) to a string:
        let line = NSString(data: buffer.subdataWithRange(NSMakeRange(0, range.location)),
            encoding: encoding)
        // Remove line (and the delimiter) from the buffer:
        buffer.replaceBytesInRange(NSMakeRange(0, range.location + range.length), withBytes: nil, length: 0)
        
        return line as String?
    }
    
    /// Start reading from the beginning of file.
    func rewind() -> Void {
        fileHandle.seekToFileOffset(0)
        buffer.length = 0
        atEof = false
    }
    
    /// Close the underlying file. No reading must be done after calling this method.
    func close() -> Void {
        fileHandle?.closeFile()
        fileHandle = nil
    }
}
