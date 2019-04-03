# 0: Load the data in RStudio
titanic_data<-read.csv("C:/Users/Alex/Documents/SPRINGBOARD/Capstone project/Exercise 2/titanic_original.csv")
View(titanic_data)
#1: Port of embarkation
titanic_1<-titanic_data %>% mutate(embarked = gsub("^$|^$", "S", embarked)) 
View(titanic_1)
#2: Age
titanic_2 <- titanic_1 %>% mutate(age =ifelse(is.na(age), mean(age, na.rm = TRUE) , age))
View(titanic_2)
#3: Lifeboat
titanic_3 <- titanic_2 %>% mutate(boat = gsub("^$|^ $", "NA", boat))
View(titanic_3)
# 4: Cabin - The missing values could indicate that these passengers were CREW members.
titanic_4 <- titanic_3 %>% mutate(cabin = gsub("^$|^ $", "Crew", cabin))
View(titanic_4)
#New Colomn - has_cabin_number : 0 -> Crew , 1 -> Any other
titanic_5 <- titanic_4 %>% mutate(has_cabin_number = ifelse( cabin == "Crew", 0 , 1))
View(titanic_5)
write.csv(titanic_5, "C:/Users/Alex/Documents/SPRINGBOARD/Capstone project/Exercise 2/titanic_clean.csv")
