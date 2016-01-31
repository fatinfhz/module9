#Calorie Counter For Swimming by Fatin F.

ui<-pageWithSidebar(
  # Application title
  headerPanel("Calorie Counter For Swimming"),
  sidebarPanel(
    numericInput('Duration', 'Minutes (min)', 45, min = 10, max = 400, step = 1),
    numericInput('Weight', 'Pounds (lbs)', 163, min = 80, max = 400, step = 1),
    submitButton('Enter'),
    
    h3('Calories Counter'),
    h4('You entered Duration (min)'),
    verbatimTextOutput("inputValueDuration"),
    h4('You entered Weight (lbs)'),
    verbatimTextOutput("inputValueWeight"),
    h4('You have burned :'),
    verbatimTextOutput("CalorieCalculation")
    
  ),
  mainPanel(
    
    
    h3("Calories Burned Swimming Definition "),
    h5("Part of having a healthy lifestyle is balancing calories in and calories out. Part of determining the calories used is to try using calories burned calculators, like this one for swimming. By finding out how many calories your swimming workout burns, you can make adjustments to your diet to lose weight, gain weight, or remain at the same weight."),
    
    h3("Calories Burned Swimming Formula"),
    h5("Total Calories Burned = Duration (in minutes) x (MET x 3.5 x weight in kg) / 200"),
    
    h3("What Is A MET?"),
    h5("A MET is the ratio of the work metabolic rate to the resting metabolic rate. One MET is defined as 1 kcal/kg/hour and is roughly equivalent to the energy cost of sitting quietly. For example: the energy cost of playing rugby is 8.3 METS, which means you use 8.3 times more energy than if you were to sit quietly and rest. A MET can also defined as oxygen uptake in ml/kg/min with one MET equal to the oxygen cost of sitting quietly, equivalent to 3.5 ml/kg/min."),
   
    h3("MET values for various activities"),
    h5("The table (Walker 1991) provides the MET values for a number of activities, including swimming with a MET of 6."),
    
    h3("How the Formula Works"),
    h5("The information you put into this calculator is put into the following formula to determine how many calories you burned: Total Calories Burned = Duration (in minutes) x (MET x 3.5 x weight in kg) / 200
MET is the metabolic equivalent, and it is based upon the pace you used while swimming. The faster you swam, the more force you exerted, and the higher the MET, which means that you burned more calories compared to a more leisurely pace. The MET is a standard number based on your pace that has already been calculated by physiologists.
       Look closely at the formula and it requires the MET to be multiplied by 3.5 and your weight in kilograms, but you put your weight into the calculator in pounds. That is because before it uses your weight in the calories burned formula, our calculator converts your weight to kilograms. This saves you a step in the process.
       Our swimming calories burned calculator is just the beginning of having a healthy lifestyle. You need to take the information and make proper use of it for it to influence your life."),
    
    h4("To Lose Weight"),
    h5("Some people want to gain weight. If the calories burned and the BMR together is less than the total intake of calories, you will gain weight."),
    
    h4("To Maintain Weight"),
    h5("Maintaining weight is simply balancing the calories taken in with the calories that go out. Your body works on an average, so if you overindudge one day, just have an extra long swim the next to compensate.
Our calories burned while swimming calculator is just one of the tools you can add to your fitness and healthy living lifestyle. "),
    
    h4("How to Calculate Calories Burned Swimming "),
    h5("Let's be honest - sometimes the best calories burned swimming calculator is the one that is easy to use and doesn't require us to even know what the calories burned swimming formula is in the first place! But if you want to know the exact formula for calculating calories burned swimming then please check out the Formula box. ")
  )
)

CalCount <- function(Duration, Weight) Duration*((Weight/2.2046)*6*3.5)/200

server<- function(input, output) {
  output$inputValueDuration <- renderPrint({input$Duration})
  output$inputValueWeight <- renderPrint({input$Weight})
  output$CalorieCalculation <- renderPrint({CalCount(input$Duration,input$Weight)})
}

shinyApp(ui = ui, server = server)