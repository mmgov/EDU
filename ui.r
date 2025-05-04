library("DT")
library("tidyverse")
library("shinycustomloader")
library("shinythemes")

shinythemes::themeSelector()

navbarPage(
  
"A level Attainment: Differences in Mean Attainment Across Different School Types in England 2018/19",
tabPanel(
  "App Info",
  fluidPage(
    #theme = shinythemes::shinytheme("united"),
    #theme = shinythemes::shinytheme("yeti"),
    #theme = shinythemes::shinytheme("cerulean"),
    #theme = shinythemes::shinytheme("readable"),
    #theme = shinythemes::shinytheme("paper"),
    theme = shinythemes::shinytheme("flatly"),
    
    
    mainPanel(
      # Display your text here
      
      
     ## h1("A level Attainment: Differences Across Different School Types"),
      h1("A level Attainment: Differences in Mean Attainment Across Different School Types in England 2018/19"),
      
      br(),
      p("This app presents the highlights, of an analysis more fully explored within this notebook:" ),

      a("A level attainment differences by school type", href = "https://www.kaggle.com/code/mmcgovern/a-level-attainment-differences-by-school-types"),
      br(),
      br(),
      #p("Both the notebook and app examine attainment at A level in England, from the 2018/19 examination diet(as this was the last year before the covid 19 pandemic) and how it differs between"), strong( "different school types."),
      p(
        "which examines attainment at A level in England, from the 2018/19 examination diet (as this was the last year before the Covid 19 pandemic) and how it differs between",
        HTML(paste("<strong>different school types.</strong>"))
      ),
      
      
      br(),  # Line break
      p("The data analysed is from the Department for Education (DfE) England, and is available to download from its website dedicated to exploring attainment data 
        
        (https://www.compare-school-performance.service.gov.uk/)" ),
        strong("Download data for all of England or a local authority (1991-2023)"),
      a("Link", href = "https://www.compare-school-performance.service.gov.uk/"),
      br(),
      br(),
      
        p(" There you can select an academic year and download data on A level performance, for all the schools/colleges/ educational institutions in England."),
br(),
        p("The key question available to explore in this app is whether there are differences in mean performance at A level across pupils attending different school types (independent, comprehensive, further education college) 
          and if so, how big or small are those differences?"),
      br(),
      
      p("The specific attainment measure used is TALLPPE_ALEV_1618, which is the average point score per A level entry, which I understand to be a score
      which represents the attainment for each person/pupil who sat A level examinations that academic year. The analysis presented here uses the mean (or average) TALLPPE_ALEV_1618 for
        each indvidual school/college, which is then grouped up and averaged for each of the different school types. 
        In other words, the DfE publishes the mean TALLPPE_ALEV_1618 of all the pupils attending a particular school. I then have taken that average
        and grouped up all the individual mean school scores by their category/type and made a new average based on that school type. The end result is actually an average of an average."),
br(),

strong("App Guide"),
      br(),
br(),

em("Proportion of Pupils at Different School Types"),
      p("To set the wider context, the first panel in the app displays a table showing the number and proportion of the pupils who were attending different types of schools/colleges and who sat A levels duirng the 18/19 examination diet. This data is presented to give a sense of how common or rare attending the different types of school/college was and what propotion of the entire A level cohort they made up."),
      br(),
em("Mean A level Performance"),
br(),
      p("The next panel in the app displays a bar chart, which shows the overall mean TALLPUP_ALEV_1618, for the entire school population, regardless of type, and its distribution across the entire population of schools."),
p("As well as the mean, the chart also shows the  the upper and lower standard deviation, represented by three vertical, dotted lines. The panel also contains a slider which allows the user to set the number of bins that the bar chart uses."),
br(),     

em("Mean A level Performance by Different School Types"),
br(),
p("The next panel in the app displays a bar chart, which shows the mean TALLPUP_ALEV_1618, of each school type."),
p(" The school types are displayed in order of mean TALLPUP_ALEV_1618 allowing easy contrast between types."),
br(),  

em("Distribution of A level Performance by School Type"),

p("The next panel again displays a bar chart showing the mean and distribution of TALLPUP_ALEV_1618 by schools, but this version is filtered by school type. 
  A drop down allows the user to select the school type they'd like to view in the chart and another drop down allows the number of bins that the chart uses, to be adjusted."),

em("DfE Data Download"),

p("The final panel contains a table displaying the TALLPUP_ALEV_1618 school of each individual school. The table can be searched by school name
  , school type, parliamentary constituency, town and raw TALLPUP_ALEV_1618 score. By default the table is ordered alphabetically by school name
  , but can be ordered by any of the colums by clicking on the arrow up & down icon next to the coloum header.
  The whole dataset/table can be downloaded for your own exploration by clicking on the Download data button."),


      
      strong("Strong text makes it bold."),
      em("Emphasized text is italicized."),
      br(),  # Line break
      code("Code displays your text similar to computer code."),
      div("Div creates segments of text with a similar style.", style = "color: blue"),
      br(),
      p("Span does the same thing as div, but it works with",
        span("groups of words", style = "color: blue"),
        "that appear inside a paragraph."
      )
    )
  
    
    
  )
),

# tabPanel(
# "Proportion of Different School Types",
# fluidPage(
# DTOutput("School_Proportion")
# )
# ),

tabPanel(
  "Proportion of Pupils at Different School Types",
  mainPanel(
    # Display your text here
    strong("Proportion of Pupils at Different School Types", style = "font-size: 30px;"),
    br(),
    br(),
    p("The below table displays the number of pupils who sat A level examinations, within each of the different school types, during the 18/19 examination diet.
      The proportion that each of these made up of the total pupils who entered A level examinations, is also shown."),
    br(),
    strong("Number and Proportion of Pupils at Different School Types"),
    br(),
    br(),
  ),
  fluidPage(
    tableOutput("School_Proportion"),
    
  ),
  mainPanel(
    # Display your text here
 
    p("The school type with the biggest number/proportion of pupils was ACC, with 111,324 pupils, making up almost 40% of those entering A level examinations that year."),
    p("There are a wide range of different school types, many of which are not familiar to me. This DfE webpage linked below describes the different types in detail."),
    a("Types of School", href = "https://www.gov.uk/types-of-school"),
    br(),
    br(),
    p("For the types listed as acronyms, the DfE provides the metadata file 'Explanation of terminology used in the data files', alongside the attainment data download. 
      The below displays the full name of each acronym as explained in the metadata file."),
    br(),
    strong("Full Name of Different School Types"),
    br(),
    br(),
    fluidPage(
      tableOutput("schtyp"),
  
    )

    
  ),
),


  
  


tabPanel(
  "Mean A level Performance",
  mainPanel(
    strong("Mean A level Performance", style = "font-size: 30px;"),
    br(),
    br(),
    # Display your text here
    p("The below charts the TALLPPE_ALEV_1618 of each individual school, including  all school types. The TALLPPE_ALEV_1618 score that each individual 
    school attained is shown on the horizontal axis, and the number of schools scoring that is displayed on the vertical axis."),  
    
    p("The mean TALLPPE_ALEV_1618 of all schools, during this exam diet, was 31.8. 
      The upper standard deviation was 35.9 and the lower was 27.4. The chart shows that the distribution of TALLPPE_ALEV_1618 was
      roughly normally distributed. There was bunching around the mean and relatively few schools 
      had a TALLPPE_ALEV_1618 score of over 50 or below 10."),
    
  
    br(),
  ),
  fluidPage(
    
    
    sliderInput(inputId = "n_breaks",
                label = "Number of bins in histogram (approximate):",
                min = 5, max = 100, value = 35),

    
    plotOutput("bell") 
  )
  
),


tabPanel(
  "Mean A level Performance by Different School Types",
  mainPanel(
    strong("Mean A level Performance by Different School Types", style = "font-size: 30px;"),
    br(),
    br(),
    p(" The below chart displays the mean TALLPPE_ALEV_1618 for each school type, as recorded during the during the 18/19 examination diet.
    As shown on the previous panel, the mean TALLPPE_ALEV_1618 for all schools, during this exam diet, was 31.8.
    "),
    br(),
    strong("Mean A level Performance by Different School Types"),
  ),
  fluidPage(
    plotOutput("chart"),
  ),
  br(),
  br(),
  br(),
  br(),
  br(),
  br(),
  br(),
  br(),

    mainPanel(
      # Display your text here
      p("The IND (Independent) school group has the highest mean attainment, with F1619 (Free School - 16-19) being second (38.1, 36.5). 
      However, it should be kept in mind that the F1619 group contains relatively few pupils, as shown on the Proportion of Pupils at Different School Types tab."),
      
p("Behind these two school/college types there are five types with a similar mean TALLPPE_ALEV_1618 score of around 32 or 31. 
These are ACC (Academy Converter) and Sixth Form College (32.2, 32.1), and then VC (Voluntary Controlled School),ACC16-19 (Academy 16-19 Converter) and VA (Voluntary Aided School) (31.3, 31.1, 31.0)."),

p("The ACC school type actually contains more puplils than any other, and the Sixth Form College group comes in second in terms of pupil size. All the other school types in this group are relatively small. Once again, these sizes should be kept in mind when interpreting their mean A level attainment."),

p("Then there is another group of 3 types, FD (Foundation School),CY (Community School) and F (Free School - Mainstream), who all have a mean TALLPPE_ALEV_1618 of 29 (29.4, 29.3, 29.1). Again these vary significantly in terms of the number of pupils attending."),

p("Following that, AC (Academy Sponsor Led), General Further Education College and UTC (University Technical College) make up the lowest three mean TALLPPE_ALEV_1618 scores (26.4, 25.7, 22.5). AC and General Further Education College are relatively large in terms of pupils size but UTC is one of the smaller school types, which should cautiion us in interpreting its mean."),
  ),
),


tabPanel(
  "Distribution of A level Performance by School Type",
  mainPanel(
    strong("Distribution of A level Performance by School Type", style = "font-size: 30px;"),
    br(),
    br(),
    p("The below charts the TALLPPE_ALEV_1618 of each individual school within the different school types, which you can select from the drop down. 
    Just as with the previous chart on the Mean A level Performance tab, there is also a drop down allowing you to select the number of bins the chart uses.
    The distribution of TALLPPE_ALEV_1618 score varies significantly across different school types. As with the other tabs, keep in mind that the number of pupils attending within
    each school type varies, as you can confirm from the Proportion of Pupils at Different School Types panel"),  
    
    br(),
    strong("Distribution of A level Performance by School Type"),
    br(),
    br(),
  ),
  
  
  fluidPage(
    
     selectInput(inputId="selected_category",
                label = "School Type",
                 choices = c("ACC","IND","UTC", "AC","CY","VA","General Further Education College","FD","Sixth Form College","F","ACC1619","VC","F1619") ,
                selected = "IND"),
     
     selectInput(inputId = "n_breaksST",
                 label = "Number of bins in histogram:",
                 choices = c(10, 20, 35, 50,100),
                 selected = 100),
    
    plotOutput("bellST") 
  )
  
),










tabPanel(
  "DfE Data Download",
  mainPanel(
    strong("DfE Data Download", style = "font-size: 30px;"),
    br(),
    br(),
    p("The below allows you to search for the mean TALLPPE_ALEV_1618 of any individual school, from the 18/19 exam diet. 
    You can also download the entire DfE dataset used in this app from the Download Data button."),  
    p("Please read the notebook exploring the data and this topic in more detail at the below link"),
    a("A level attainment differences by school type", href = "https://www.kaggle.com/code/mmcgovern/a-level-attainment-differences-by-school-types"),
    br(),
    br(),
    br(),
    strong("TALLPPE_ALEV_1618 Score by Individual School"),
    br(),
    br(),
    br(),
  ),
  fluidPage(
    downloadButton("download_scores",
                   label= "Download data"),
    ##withLoader(
      DTOutput("Search")
      ##)
  )
),


tabPanel(
  "Boxplot of Scores",
  mainPanel(
    strong("Distribution of TALLPPE_ALEV_1618 by School Type", style = "font-size: 30px;"),
    br(),
    plotOutput("boxplot_scores")
  ),
  fluidPage(
    plotOutput("boxplot_scores2")
  ),
),
collapsible = TRUE
)


