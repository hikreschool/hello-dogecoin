
# App Challenge Week 11 - Hello Dogecoin
**Deadline: Friday**

This is a step-by-step challenge that guides you through the entire process of the App Challenge.

**Important: Aside from the previous App Challenges, you will also be using what you've learned from hands-on activities**

# What You Will Be Making - An app that displays the real-time price of Dogecoin
<img width="378" alt="Screen Shot 2021-08-24 at 6 38 19 PM" src="https://user-images.githubusercontent.com/87120195/130604846-2f481d23-c918-4501-9159-7d7b40a8ef21.png">


# What You Will Be Learning

1. Networking - https://www.youtube.com/watch?v=Rqr3w8scm2E
2. JSON - https://www.youtube.com/watch?v=_TrPJQWD8qs
3. APIS - https://www.youtube.com/watch?v=s7wmiS2mSXY


# Important keywords
1. Networking
2. JSON
3. APIs
4. Alamofire
5. SwiftyJSON
6. Http request


# Coding advice

1. If you can, use a piece of paper to sketch your pseudocode (human-readable language)
2. Start writing code (start small and divide and conquer)
3. Start on simple tasks like UI-related code
4. THen, proceed with the logic of the app
5. Be mindful on doing one particular task at a time
6. Use Stackoverflow or complementary resources when stuck or in case of an error


# Steps

**Part 1**

Step 1: Start your Xcode Project and name it _Hello-Dogecoin_.xcodeproj

Step 2: Fill up the Storyboard with all the necessary UI elements (check App screenshot) 
You need _3 UILabels and 1 UIButton_. Start configuring your desired look for User Interface Design.

Step 3: Organize the project files according to MVC pattern (_Model, View, and Controller)_. Then, put the files in respective folders

Step 4: Quit your Xcode project, go to Terminal, navigate to your project directory/folder, and initialize pod using _pod init_ command in the terminal

<img width="893" alt="Screen Shot 2021-08-24 at 7 00 06 PM" src="https://user-images.githubusercontent.com/87120195/130605325-83d7d864-f40d-430f-b0fa-5b191bc7af38.png">


Step 5: Open the Pod file and put these two pods respectively in the file, _Alamofire and SwiftyJSON_. 

<img width="283" alt="Screen Shot 2021-08-24 at 6 44 09 PM" src="https://user-images.githubusercontent.com/87120195/130603399-042482bb-14ce-4ad7-acbc-f25bef97c767.png">
Note: Make sure you uncomment the _use_frameworks and target platform :ios, '9.0'_

Step 6: Go back to terminal again and now do _pod install_. Wait until it's done. Then open your project using .xcworkspace

**Part 2**

Step 7: Import both libraries Alamofire and SwiftyJSON on the top of your ViewController file. 
<img width="361" alt="Screen Shot 2021-08-24 at 6 45 49 PM" src="https://user-images.githubusercontent.com/87120195/130603726-e55837a9-f081-4bf7-ba94-7d9bc7880731.png">

Step 8: Put this line of code inside your ViewController file

_let apiURL = "https://sochain.com//api/v2/get_price/DOGE/USD"_

Step 9: Start connecting the 3 IBOutlets and 1 IBAction on the Storyboard
<img width="526" alt="Screen Shot 2021-08-24 at 6 46 01 PM" src="https://user-images.githubusercontent.com/87120195/130603838-efdd174d-171e-46d9-941a-1cf73bc6e797.png">


**Part 3**

Step 10: Networking - Insert this block of code inside your ViewController file


    func getDogecoinData(url: String) {
        
        Alamofire.request(url, method: .get)
            .responseJSON { response in
                if response.result.isSuccess {
                    
                    print("Sucess! Got the Bitcoin data")
                    
                    let dogecoinJSON : JSON = JSON(response.result.value!)
                    print(dogecoinJSON)
                    
                    self.updateDogecoinData(json: dogecoinJSON)
                    
                } else {
                    print("Error: \(String(describing: response.result.error))")
                    self.dogecoinPriceLabel.text = "Connection Issues"
                }
            }
        
        
    }

Step 11: JSON Parsing - And this one too just under the block of code from Networking

    func updateDogecoinData(json : JSON) {
        
        
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



Copyright 2021 Hikre, Inc. Hikre School
