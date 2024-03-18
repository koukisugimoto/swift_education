//
//  QuizViewController.swift
//  Quiz
//
//  Created by 椙本洸希 on 2022/11/19.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var problemText: UITextView!
    
    var problemSet = NSMutableArray()
    var totalProblems = Int()
    var currentProblem = Int()
    var correctAnswers = Int()

    func loadProblemSet() {
        let path = Bundle.main.path(forResource: "quiz", ofType: "csv")

        let enc = String.Encoding.utf8

        let data = NSData(contentsOfFile: path!)
        
        let text = String(NSString(data: data! as Data, encoding: enc.rawValue)!)

        let lines = text.components(separatedBy: "\n")

        for i in 0..<lines.count {

            let items = lines[i].components(separatedBy: ",")


            let p = Problem()
            let q = items[0]
            let a = Int(items[1])
            p.setQ(q: q, a: a!)

            problemSet.add(p)
        }
     }
    
    func shuffleProblemSet() {
        let totalQuestions = problemSet.count
        var i = totalQuestions
        
        while i > 0 {
            let j = arc4random() % UInt32(i)
            problemSet.exchangeObject(at: i-1, withObjectAt: Int(j))
            i -= 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadProblemSet()
        self.shuffleProblemSet()
        
        totalProblems = 10
    }
    
    @IBAction func answerIsTrue(_ sender: Any) {
    }
    
    @IBAction func answerIsFalse(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
