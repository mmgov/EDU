library("DT")
library("tidyverse")


alc<-read_csv("./england_ks5final.csv", na = c('*','','na')) %>% 
  select('REGION','ESTAB','SCHNAME','TALLPPE_ALEV_1618','TALLPUP_ALEV_1618','NFTYPE/FESITYPE','TOWN','PCON_NAME')%>%
  rename(SCHOOLTYPE = 'NFTYPE/FESITYPE')%>% 
  filter (
    !TALLPPE_ALEV_1618 %in% c('NE','SUPP',NA)
    ,ESTAB != 'NA'
    ,!SCHOOLTYPE %in% c('SS','3066905','3104027','AC1619','Agriculture and Horticulture College'
                        ,'Art, Design and Performing Arts College','CTC','MODFC',NA))%>%
  mutate_at(c('TALLPPE_ALEV_1618', 'TALLPUP_ALEV_1618'), as.numeric)

SCHOOLTYPE<- c('Academy Converter','Independent School','Academy Sponsor Led','Community School','Voluntary Aided School','Foundation School','University Technical College','Free School – Mainstream', 'Academy 16-19 Converter','Voluntary Controlled School','Free School - 16-19')
ACRONYM<-c('ACC','IND','AC','CY','VA','FD','UTC','F','ACC1619','VC','F1619')
super_sleepers <- data.frame(ACRONYM, SCHOOLTYPE)


function(input, output) {

  




# output$School_Proportion <- renderDT({
#   alc %>%
#       group_by(SCHOOLTYPE) %>%
#       summarise(Count=sum(TALLPUP_ALEV_1618))%>%
#       mutate(Frequency = formattable::percent(Count / sum(alc$TALLPUP_ALEV_1618),1))%>%
#       arrange(desc(Frequency))
# 
# })

 # summarise(Count=(formattable::number(sum(TALLPUP_ALEV_1618),0)))%>%
  
# output$School_Proportion <- renderTable({
#   alc %>%
#     group_by(SCHOOLTYPE) %>%
#     summarise(Count=(sum(TALLPUP_ALEV_1618)))%>%
#     mutate(Frequency = paste0(formattable::percent(Count / sum(alc$TALLPUP_ALEV_1618), 1), ""))%>%
#     arrange(desc(Count))
# 
# }
# , width = "75%"
# ,striped = TRUE,
# hover = TRUE
# )


  output$School_Proportion <- renderTable({
    alc %>%
      group_by(SCHOOLTYPE) %>%
      summarise(Count = sum(TALLPUP_ALEV_1618)) %>%
      mutate(
        Count = as.integer(Count), # Convert Count to integers
        Proportion = paste0(formattable::percent(Count / sum(alc$TALLPUP_ALEV_1618), 1), "")
      ) %>%
      arrange(desc(Count))
  }, 
  width = "75%", 
  striped = TRUE, 
  hover = TRUE)
  
  output$schtyp <- renderTable({
    super_sleepers  
  })





output$bell<-renderPlot({ 
  options(repr.plot.width = 10, repr.plot.height = 10)
  ggplot(alc, aes(x = TALLPPE_ALEV_1618)) +
    geom_histogram(fill = "white", colour = "black", bins=as.numeric(input$n_breaks)) +
    ggtitle("Mean and Standard Deviation of TALLPPE_ALEV_1618") +
    
    theme (axis.text=element_text(size=15)) +
    ylab("Count of Schools")+  xlab("TALLPPE_ALEV_1618") +
    theme(plot.title = element_text(hjust = 0.5)) +
    theme (plot.title = element_text(size = 100)) +
    theme_grey(base_size = 15)+
    theme(axis.text.x= element_text(size = 15),axis.text.y= element_text(size = 15))+
    geom_vline(xintercept = mean(alc$'TALLPPE_ALEV_1618'), linetype="dashed", color = "blue")+
    annotate("text", x= mean(alc$'TALLPPE_ALEV_1618'), y=325, label="Mean 31.8", angle=0)+
    geom_vline(xintercept = (mean(alc$'TALLPPE_ALEV_1618')-sd(alc$'TALLPPE_ALEV_1618')), linetype="dashed", color = "red")+
    annotate("text", x =(mean(alc$'TALLPPE_ALEV_1618')-sd(alc$'TALLPPE_ALEV_1618')), y=325, label="Lower SD 27.4", angle=0)+
    geom_vline(xintercept = (mean(alc$'TALLPPE_ALEV_1618')+sd(alc$'TALLPPE_ALEV_1618')), linetype="dashed", color = "red")+
    annotate("text", x =(mean(alc$'TALLPPE_ALEV_1618')+sd(alc$'TALLPPE_ALEV_1618')), y=325, label="Upper SD 35.9", angle=0)
})

                                                                                   

output$"bellST"<-renderPlot({ 
  options(repr.plot.width = 10, repr.plot.height = 10)
  fil_alc <- alc %>% 
    filter(SCHOOLTYPE == input$selected_category)
  ggplot(fil_alc, aes(x = TALLPPE_ALEV_1618)) +
    geom_histogram(fill = "white", colour = "black", bins=as.numeric(input$n_breaksST)) +
    ggtitle("Distribution of TALLPPE_ALEV_1618") +
    labs(y="Count of Schools",size = 100)+
    theme(axis.text.x= element_text(size = 25),axis.text.y= element_text(size = 25))+
  theme_grey(base_size = 15)
  # +
  #   labs(y="Count")+ 
  #   theme(plot.title = element_text(hjust = 0.5)) +
  #   theme (plot.title = element_text(size = 17)) +
  #   geom_vline(xintercept = mean(alc$'TALLPPE_ALEV_1618'), linetype="dashed", color = "blue")+
  #   annotate("text", x= mean(alc$'TALLPPE_ALEV_1618'), y=325, label="Mean", angle=0)+
  #   geom_vline(xintercept = (mean(alc$'TALLPPE_ALEV_1618')-sd(alc$'TALLPPE_ALEV_1618')), linetype="dashed", color = "red")+
  #   annotate("text", x =(mean(alc$'TALLPPE_ALEV_1618')-sd(alc$'TALLPPE_ALEV_1618')), y=325, label="Lower SD", angle=0)+
  #   geom_vline(xintercept = (mean(alc$'TALLPPE_ALEV_1618')+sd(alc$'TALLPPE_ALEV_1618')), linetype="dashed", color = "red")+
  #   annotate("text", x =(mean(alc$'TALLPPE_ALEV_1618')+sd(alc$'TALLPPE_ALEV_1618')), y=325, label="Upper SD", angle=0)
})










output$chart<-renderPlot({ 
alc %>% 
    group_by(SCHOOLTYPE)%>%
    summarise(Average = round(mean(TALLPPE_ALEV_1618),1))%>%
    ggplot(aes(
      x = fct_reorder(SCHOOLTYPE, Average, .desc = TRUE),
      y= Average
      ,fill = SCHOOLTYPE))+ 
    geom_bar(position="dodge",stat="identity")+
  ##  scale_fill_discrete() + 
    coord_flip() + theme(axis.text.x = element_text(angle = 0, size = 15),legend.position = "none", axis.title = element_text(size = 14)) + geom_text(aes(label=Average), position=position_dodge(width=0.96) ## was 0.96
    , vjust=+0.5,hjust=-0.1,size=7)+ ## was 
    scale_y_continuous(limits = c(0,40)) +
    ggtitle("Mean TALLPPE_ALEV_1618 by School Type") +
    theme(plot.title = element_text(hjust = 0.5)) +
    theme (plot.title = element_text(size = 17)) +
    theme (axis.text=element_text(size=15)) +
    ylab("Mean TALLPPE_ALEV_1618") + xlab("School Type")
})

# alcd<-alc %>%
#   mutate(MEAN = 31.8) %>% 
#   select('SCHNAME','TALLPPE_ALEV_1618','MEAN','SCHOOLTYPE')


output$Search <- renderDT({
  alc %>%
    rename(SCHOOLNAME = 'SCHNAME')%>% 
    rename('PARLIAMENTARY CONTITUENCY' = 'PCON_NAME')%>% 
    select('SCHOOLNAME','SCHOOLTYPE','PARLIAMENTARY CONTITUENCY','TOWN','TALLPPE_ALEV_1618') %>% 
    arrange(SCHOOLNAME)
})






output$download_scores <- downloadHandler(
  
  filename = "score.csv",
  content = function(file){
    file.copy("RawData/england_ks5final.csv",
              file)
  }
)

output$boxplot_scores <- renderPlot({
  alc %>%
    mutate(SCHOOLTYPE = fct_reorder(SCHOOLTYPE, TALLPPE_ALEV_1618, .fun = median, .desc = FALSE)) %>%
    ggplot(aes(x = SCHOOLTYPE, y = TALLPPE_ALEV_1618, fill = SCHOOLTYPE)) +
    geom_boxplot(outlier.color = "red", outlier.shape = 1) +
    coord_flip() +
    labs(
      title = "Distribution of TALLPPE_ALEV_1618 by School Type",
      x = "School Type",
      y = "TALLPPE_ALEV_1618"
    ) +
    theme_minimal() +
    theme(legend.position = "none")
})

output$region_bar_chart <- renderPlot({
  alc %>%
    group_by(TOWN) %>%
    summarise(Mean_Score = mean(TALLPPE_ALEV_1618, na.rm = TRUE)) %>%
    ggplot(aes(x = reorder(TOWN, Mean_Score), y = Mean_Score, fill = TOWN)) +
    geom_bar(stat = "identity") +
    coord_flip() +
    labs(
      title = "Mean TALLPPE_ALEV_1618 by Region",
      x = "TOWN",
      y = "Mean TALLPPE_ALEV_1618"
    ) +
    theme_minimal() +
    theme(legend.position = "none")
})



}






