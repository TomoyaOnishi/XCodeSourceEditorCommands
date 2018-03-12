import Foundation
import XcodeKit

class SourceEditorCommand: NSObject, XCSourceEditorCommand {
    
    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void ) -> Void {
        let textBuffer = invocation.buffer
        textBuffer.lines.removeAllObjects()
        
        let template = """
import UIKit

final class MyViewController: UIViewController {
    required init?(coder aDecoder: NSCoder) { fatalError("Initialization error") }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
}
"""
        
        textBuffer.lines.insert(template, at: 0)
        completionHandler(nil)
    }
    
}
