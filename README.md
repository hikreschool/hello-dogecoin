
# App Challenge Week 11 - Hello Dogecoin
**Deadline: Friday**

Download the starter project files as .zip and extract to your desktop or your folder of preference.Or you can go your Terminal or Commandline and copy paste: git clone.. PLACEHOLDER

**Important: Aside from the previous App Challenges, you will also be using what you've learned from hands-on activities**

# What You Will Be Learning

1. Networking - https://www.youtube.com/watch?v=Rqr3w8scm2E
2. JSON - https://www.youtube.com/watch?v=_TrPJQWD8qs
3. APIS - https://www.youtube.com/watch?v=s7wmiS2mSXY


# Important keywords
1. Networking
2. JSON
3. APIs
4. Alamofire
5. SwiftJSON
6. Http request

# Notes
1. Some boilerplate code is already implemented for you 
2. Storyboard VCs are already implemented for you
3. Assets folder already has the pictures you need

# How To Start
1. Open the project and get familiar with it
2. Write Pseudocode for your approach on a piece of paper or iPad (human-readable language)
3. Start writing code (start small and divide and conquer)
4. Start on simple tasks like UI-related code
5. THen, proceed with the logic of the app
6. Be mindful on doing one particular task at a time

# Submission
-Once finished, submit it through Git & Github by creating a Git branch of yours and pushing it to this repository.

# Steps

**Part 1**

Step 1: Start your Xcode Project and name it _Hello-Dogecoin_.xcodeproj

Step 2: Fill up the Storyboard with all the necessary UI elements (check App screenshot) 
You need 3 UILabels and 1 UIButton. Start configuring your desired look for User Interface Design.

Step 3: Organize the project files according to MVC pattern (Model, View, and Controller). Then, put the files in respective folders

Step 4: Quit your Xcode project, go to Terminal, navigate to your project directory/folder, and initialize pod using pod init command in the terminal

Step 5: Open the Pod file and put these two pods respectively in the file, Alamofire and SwiftyJSON. 

<img width="283" alt="Screen Shot 2021-08-24 at 6 44 09 PM" src="https://user-images.githubusercontent.com/87120195/130603399-042482bb-14ce-4ad7-acbc-f25bef97c767.png">
Note: Make sure you uncomment the use_frameworks and target platform :ios, '9.0'

Step 6: Go back to terminal again and now do pod install. Wait until it's done. Then open your project using .xcworkspace

**Part 2**

Step 7: Import both libraries Alamofire and SwiftyJSON on the top of your ViewController file. 
<img width="361" alt="Screen Shot 2021-08-24 at 6 45 49 PM" src="https://user-images.githubusercontent.com/87120195/130603726-e55837a9-f081-4bf7-ba94-7d9bc7880731.png">

Step 8: Put this line of code inside your ViewController file
let apiURL = "https://sochain.com//api/v2/get_price/DOGE/USD"

Step 9: Start connecting the 3 IBOutlets and 1 IBAction on the Storyboard
<img width="526" alt="Screen Shot 2021-08-24 at 6 46 01 PM" src="https://user-images.githubusercontent.com/87120195/130603838-efdd174d-171e-46d9-941a-1cf73bc6e797.png">


**Part 3**

Step 10: Networking - Insert this block of code inside your ViewController file
  //MARK: - Networking
    func getBitcoinData(url: String) {
        
        Alamofire.request(url, method: .get)
            .responseJSON { response in
                if response.result.isSuccess {
                    
                    print("Sucess! Got the Bitcoin data")
                    
                    let dogecoinJSON : JSON = JSON(response.result.value!)
                    print(dogecoinJSON)
                    
                    self.updateBitcoinData(json: dogecoinJSON)
                    
                } else {
                    print("Error: \(String(describing: response.result.error))")
                    self.dogecoinPriceLabel.text = "Connection Issues"
                }
            }
        
        
    }

Step 11: JSON Parsing - And this one too just under the block of code from Networking
    func updateBitcoinData(json : JSON) {
        
        
        let jsonData = json["data"]["prices"]
        print(jsonData)
        
        
        // Start recognizing this block of code
        DispatchQueue.main.async {
            if let currencyResult = jsonData[0]["price"].string {
                self.dogecoinPriceLabel.text = "$\(String(currencyResult))"
                
            } else {
                self.dogecoinPriceLabel.text = "Data unavailable"
            }
            
            
        }
        
        
    }
    
Step 12: Call or invoke getDogecoinData() method inside your viewDidLoad()
Step 13: Call or invoke getDogecoinData() method inside your IBAction method for the button

Final step: Run the app and make sure it displays real-time data of Dogecoin's price

# App
 





Copyright 2021 Hikre, Inc. Hikre School
