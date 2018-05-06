// update: 29.07.2016, 15:00

// UIView

// In den folgenden Listings werden programmtische Umsetzungen von UIView-Objekten besprochen,
// die prinzipiell alle mit dem Interface-Builder ebenfalls umgesetzt werden können.

import UIKit
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

// Simulate User Interaction, not available in Xcode 7.2
func delay(delay:Double, closure:()->()) {
    dispatch_after(
        dispatch_time(
            DISPATCH_TIME_NOW,
            Int64(delay * Double(NSEC_PER_SEC))
        ),
        dispatch_get_main_queue(), closure)
}

let color = UIColor(red: 1, green: 1, blue: 0, alpha: 1)
let leftMargin = 20

// Programmatisch werden UIViews folgendermaßen erstellt und in die Hierarchie eingefügt:
let view = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 667)) // iPhone 6 proportions
view.backgroundColor = UIColor.grayColor()
let innerview = UIView(frame: CGRect(x:20, y:80, width: 340, height: 100))
innerview.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
view.addSubview(innerview)


// Einem View können weitere Views hinzugefügt werden, bspw. UILabel und UIButton
let label = UILabel(frame: CGRect(x: leftMargin, y: 5, width: 300, height: 44))
label.text = "Hello, playground"
label.textColor = UIColor.whiteColor()
view.addSubview(label)

let button = UIButton(type: .System)
button.frame = CGRect(x:20, y:200, width: 340, height: 40)
button.backgroundColor = UIColor.orangeColor()
button.setTitle("Button", forState: UIControlState.Normal)
view.addSubview(button)


// TEXTFIELD
let textField = UITextField(frame: CGRect(x: leftMargin, y: 60, width: 300, height: 44))
textField.placeholder = "Edit me…"
textField.backgroundColor = UIColor(white: 1, alpha: 0.5)
textField.textColor = UIColor.whiteColor()
textField.userInteractionEnabled = true
view.addSubview(textField)

XCPlaygroundPage.currentPage.liveView = view

delay(1.0) { () -> () in
    textField.text = "New text!"
}

// Alle Steuerelemente erben von UIView allgemeine Methoden wie z.B. "addSubview" oder "removeFromSuperview" für 
// die Verwaltung der View-Hierarchie und allgemeine Eigenschaften wie z.B. "frame" für die Positionierung.


// Regular View:
let view2 = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
view2.backgroundColor = UIColor.yellowColor()

// View with shadows and rounded corners:
let shadowView = UIView(frame: CGRect(x: 10, y: 10, width: 50, height: 50))
shadowView.layer.masksToBounds = false
shadowView.layer.shadowOffset = CGSize(width:1, height:1)
shadowView.layer.shadowColor = UIColor.blackColor().CGColor
shadowView.layer.shadowRadius = 4
shadowView.layer.shadowOpacity = 0.8
shadowView.layer.cornerRadius = 5
shadowView.backgroundColor = UIColor.redColor()
view2.addSubview(shadowView)
view2

// UIScrollView:
let contentView = UIView(frame: CGRectMake(0, 0, 1000, 1000))
contentView.backgroundColor = UIColor.greenColor()
let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
scrollView.contentSize = CGSize(width: 1000, height: 1000)
scrollView.addSubview(contentView)

// UILabel:
let label2 = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
label2.text = "Hello world!"
label2.backgroundColor = UIColor.yellowColor()
label2.sizeToFit()

// UIButton:
let buttonView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
let button2 = UIButton(type: .System)
button2.setTitle("Button", forState: .Normal)
button2.sizeToFit()
button2.center = CGPoint(x: 100, y: 25)
button2.tintColor = UIColor.redColor()
buttonView.addSubview(button2)

// UITextField
let textField2 = UITextField(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
textField2.borderStyle = .RoundedRect
textField2.text = "UITextField"
textField2.sizeToFit()

// UISegmentedControl:
let segmentedControl = UISegmentedControl(items: ["A", "B", "C"])

// UISlider:
let slider = UISlider()

// UISwitch:
let uiswitch = UISwitch()
uiswitch.on = true

// UIActivityIndicatorView:
let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .White)
activityIndicator.startAnimating()

// UIProgressView:
let progressView = UIProgressView(progressViewStyle: UIProgressViewStyle.Default)
progressView.progress = 25 / Float(100)

//  Colored UIProgressView:
let coloredProgressView = UIProgressView(progressViewStyle: .Default)
coloredProgressView.progressTintColor = .redColor()
coloredProgressView.trackTintColor = .yellowColor()
coloredProgressView.progress = 0.25

// UIPageControl:
let pageControl = UIPageControl(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
pageControl.backgroundColor = UIColor.grayColor()
pageControl.numberOfPages = 3

// UIStepper:
let stepper = UIStepper()

// UITableView:
class PlayTableViewController : UITableViewController {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        cell.textLabel?.text = "Cell \(indexPath.section).\(indexPath.row)"
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }
    
}

let tableViewController = PlayTableViewController(style: UITableViewStyle.Plain)
tableViewController.tableView.frame = CGRect(x: 0, y: 0, width: 300, height: 100)

// UICollectionView:
class PlayCollectionViewController : UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "PlayCell")
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PlayCell", forIndexPath: indexPath)
        cell.backgroundColor = UIColor.yellowColor()
        return cell
    }
    
}

let collectionViewController = PlayCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
collectionViewController.collectionView!.frame = CGRect(x: 0, y: 0, width: 300, height: 100)
collectionViewController.collectionView!.backgroundColor = UIColor.whiteColor()

// UIImageView:
let image = UIImage(named: "pic.png")
let imageView = UIImageView(image: image)

// UITextView:
let textView = UITextView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
textView.text = "UITextView"
textView.sizeToFit()

//  Color constants:
UIColor.blackColor()
UIColor.darkGrayColor()
UIColor.lightGrayColor()
UIColor.whiteColor()
UIColor.grayColor()
UIColor.redColor()
UIColor.greenColor()
UIColor.blueColor()
UIColor.cyanColor()
UIColor.yellowColor()
UIColor.magentaColor()
UIColor.orangeColor()
UIColor.purpleColor()
UIColor.brownColor()
UIColor.clearColor()

// Color by component value:
UIColor(white: 0.5, alpha: 1.0)
UIColor(hue: 0.5, saturation: 0.4, brightness: 1.0, alpha: 1.0)
UIColor(red: 0.6, green: 1.0, blue: 1.0, alpha: 1.0)






// KOORDINATENANGABEN, FRAME und BOUNDS:
// Für Koordinatenangaben werden die CoreGraphics-Typen CGFloat, CGPoint, CGSize und CGRect verwendet:

let x = CGFloat(0)
let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
let rectZero = CGRectZero

let point = CGPoint(x: 0, y: 0)
let size = CGSize(width: 100, height: 100)

let upperCenter = CGPoint(x: rect.minX, y:rect.midY)
let smallerRect = rect.insetBy(dx: 1, dy: 1)

NSLog("%@", "\(rect)")

// In dem Koordinatensystem eines Views ist CGPoint(x: 0, y: 0) die linke, obere Ecke. 
// Die Positionierung erfolgt über die "frame"-Eigenschaft relativ zu dem übergeordneten superview.


// UIColor:
UIColor.redColor()
UIColor(white: 0.5, alpha: 1.0)
UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
UIColor(red: 130/255.0, green: 10/255.0, blue: 90/255.0, alpha: 1)

// Für das Berechnen von Farbwerten bietet sich der HSV-Farbraum an, da hier sehr einfach Farbvarianten gebildet werden können:
let        Color = UIColor(hue: 0.2, saturation: 0.7, brightness: 0.6, alpha: 1.0)
let lighterColor = UIColor(hue: 0.2, saturation: 0.7, brightness: 0.8, alpha: 1.0)

// Typischerweise ist ein UIViewController für die Verwaltung eines Screens einer iOS-Anwendung zuständig. 
// Er managt eine Hierarchie von UIViews, koordiniert die Zusammenarbeit mit Modellobjekten und anderen Controllern, 
// passt ggf. Größen und Inhalte der Views an und behandelt UI-Ereignisse.

// Das UIView für einen UIViewController kann graWsch mit dem Interface Builder erstellt und zur Laufzeit 
// aus einem Storyboard oder einer XIB-Datei geladen werden oder programmatisch in der loadView-Methode 
// der UIViewController-Implementierung erzeugt werden:

class ExampleViewController: UIViewController {
    
    override func loadView() {
        self.view = UIView()
    }
}

// Darüber hinaus implementiert eine UIViewController-Klasse meist Lebenszyklus-Methoden 
// wie viewDidLoad oder viewWillAppear:, um auf den Controller betreffende Ereignisse zu reagieren 
// und das Verhalten des Controllers zu implementieren.



// CodingTutor: Instanzen von UIView-Objekten erstellen:

let myView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
myView.backgroundColor = UIColor.blueColor()
let mySubView = UIView(frame: CGRect(x: 150, y: 100, width: 100, height: 100))
mySubView.backgroundColor = UIColor.redColor()

myView.addSubview(mySubView)


let meinLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
meinLabel.backgroundColor = UIColor.whiteColor()
meinLabel.text = "sanexio.de"
meinLabel.sizeToFit()
myView.addSubview(meinLabel)

let myButtonView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 70))
let myButton = UIButton(type: .System)
myButton.backgroundColor = UIColor.whiteColor()
myButtonView.backgroundColor = UIColor.cyanColor()
myButton.setTitle("TEST", forState: .Normal)
myButton.sizeToFit()
myButtonView.addSubview(myButton)       // Verschachtelung - Subview hinzufügen


