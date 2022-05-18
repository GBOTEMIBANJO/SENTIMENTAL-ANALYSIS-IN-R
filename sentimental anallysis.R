getwd()

 #read dataset
 t.hotel <- read.csv("tourist_accommodation_reviewss.csv", header = T,encoding = "UTF-8")
 View(t.hotel)
 
 
 #install.packages("arules")
 library(arules)
 
 install.packages("tm")
 library(tm)
 
 install.packages("wordcloud")
 library(wordcloud)
 
 #select the hotel names using simple random sampling
 
  set.seed(1237)
 s <- sample(t.hotel$Hotel.Restaurant.name,30,replace = FALSE)
 s
 #filter the hotels from the data set
 Soul_Curry_Restaurant_and_Bar <-subset(t.hotel,Hotel.Restaurant.name=="Soul Curry Restaurant and Bar",)
  Phuket_La_CaS_a <-subset(t.hotel,Hotel.Restaurant.name=="Phuket La Ca Sa" ,)
  Butterfly_Bistro <- subset(t.hotel,Hotel.Restaurant.name=="Butterfly Bistro" ,) 
  YoGreen_Restaurant <-subset(t.hotel,Hotel.Restaurant.name=="Yo Green Restaurant" ,)
  BeachBar<-subset(t.hotel,Hotel.Restaurant.name=="Beach Bar" ,)
  NapoliRistorantePizzeria <-subset(t.hotel,Hotel.Restaurant.name=="Napoli Ristorante Pizzeria" ,)
  Mom_Tris_Kitchen_at_Villa_royale <- subset(t.hotel,Hotel.Restaurant.name=="Mom Tri's Kitchen at Villa Royale" ,)
  Wine_Connection_Deli_Bistro_Chalong_Phuket <-subset(t.hotel,Hotel.Restaurant.name=="Wine Connection Deli & Bistro - Chalong, Phuket",)
  En_Vogue_Restaurant <- subset(t.hotel,Hotel.Restaurant.name=="En Vogue Restaurant",)
  Subparod_Restaurant <- subset(t.hotel,Hotel.Restaurant.name=="Subparod Restaurant",) 
  Sunset_Bar <-subset(t.hotel,Hotel.Restaurant.name=="Sunset Bar",) 
  Red_Chopsticks <-subset(t.hotel,Hotel.Restaurant.name=="Red Chopsticks",) 
  Cashew_Nuts_Food <-subset(t.hotel,Hotel.Restaurant.name=="Cashew Nuts Food",)
  The_Palm_Cuisine <-subset(t.hotel,Hotel.Restaurant.name=="The Palm Cuisine" ,)
  BonIslandRestaurant <-subset(t.hotel,Hotel.Restaurant.name=="Bon Island Restaurant",)
  Mali_Seafood_Restaurant_Bar <- subset(t.hotel,Hotel.Restaurant.name=="Mali Seafood Restaurant & Bar",)
  Baia_Del_Sole <- subset(t.hotel,Hotel.Restaurant.name=="Baia Del Sole",)
  Autogrill_Risto_Bar_Pizza <-subset(t.hotel,Hotel.Restaurant.name=="Autogrill Risto Bar Pizza",)
  Louis_Kitchen <-subset(t.hotel,Hotel.Restaurant.name=="Louis' Kitchen",)
  Baia_Del_Sole <-subset(t.hotel,Hotel.Restaurant.name=="Baia Del Sole",)
  Autogrill_Risto_Bar_Pizza <-subset(t.hotel,Hotel.Restaurant.name=="Autogrill Risto Bar Pizza",)
  LouisKitchen <-subset(t.hotel,Hotel.Restaurant.name=="Louis' Kitchen",)
  MalilaRestaurant <-subset(t.hotel,Hotel.Restaurant.name=="Malila Restaurant",)
  Thong_Dee_The_Kathu_Brasserie <-subset(t.hotel,Hotel.Restaurant.name=="Thong Dee The Kathu Brasserie" ,)
  BaiToey <-subset(t.hotel,Hotel.Restaurant.name=="Bai Toey", )
  Siam_Smile_Wine_Restaurant <-subset(t.hotel,Hotel.Restaurant.name=="Siam Smile Wine & Restaurant",)
  The_Coffee_Club <-subset(t.hotel,Hotel.Restaurant.name=="The Coffee Club - The Turtle Village",)
  A_Spoonful_of_Sugar <- subset(t.hotel,Hotel.Restaurant.name=="A Spoonful of Sugar",)
  Sala_Mexicali <-subset(t.hotel,Hotel.Restaurant.name=="Sala Mexicali",)
 Da_Mario_Karon <-subset(t.hotel,Hotel.Restaurant.name=="Da Mario Karon",)
 Laem_Hin_Seafood <-subset(t.hotel,Hotel.Restaurant.name== "Laem Hin Seafood",)
 Elephant_No9_Restaurant <-subset(t.hotel,Hotel.Restaurant.name=="Elephant No.9 Restaurant",) 
 Outdoor_Restaurant <-subset(t.hotel,Hotel.Restaurant.name=="Outdoor Restaurant",) 
  
  
 #create text vectors
 Soul_Curry_Restaurant_and_Bar_review <- Soul_Curry_Restaurant_and_Bar$Review
 Phuket_La_CaS_a_review <-Soul_Curry_Restaurant_and_Bar$Review
 Butterfly_Bistro_review <- Butterfly_Bistro$Review
 YoGreen_Restaurant_review <-YoGreen_Restaurant$Review
 BeachBar<-subset_review <- BeachBar$Review
 NapoliRistorantePizzeria_review  <-NapoliRistorantePizzeria$Review
 Mom_Tris_Kitchen_at_Villa_royale_review  <- Mom_Tris_Kitchen_at_Villa_royale$Review
 Wine_Connection_Deli_Bistro_Chalong_Phuket_review <-Wine_Connection_Deli_Bistro_Chalong_Phuket$Review
 En_Vogue_Restaurant_review  <- En_Vogue_Restaurant$Review
 Subparod_Restaurant_review <-  Subparod_Restaurant$Review
 Sunset_Bar_review  <- Sunset_Bar$Review
 Red_Chopsticks_review  <-Red_Chopsticks$Review
 Cashew_Nuts_Food_review  <- Cashew_Nuts_Food$Review
 The_Palm_Cuisine_review  <- The_Palm_Cuisine$Review
 BonIslandRestaurant_review  <- BonIslandRestaurant$Review
 Mali_Seafood_Restaurant_Bar_review  <- Mali_Seafood_Restaurant_Bar$Review
 Baia_Del_Sole_review  <- Baia_Del_Sole$Review
 Autogrill_Risto_Bar_Pizza_review  <- Autogrill_Risto_Bar_Pizza$Review
 Louis_Kitchen_review  <- Louis_Kitchen$Review
 Baia_Del_Sole_review  <- Baia_Del_Sole$Review
 Autogrill_Risto_Bar_Pizza_review  <- Autogrill_Risto_Bar_Pizza$Review
 LouisKitchen_review  <- LouisKitchen$Review
 MalilaRestaurant_review  <- MalilaRestaurant$Review
 Thong_Dee_The_Kathu_Brasserie_review  <- Thong_Dee_The_Kathu_Brasserie$Review
 BaiToey_review  <-BaiToey$Review
 Siam_Smile_Wine_Restaurant_review  <- Siam_Smile_Wine_Restaurant$Review
 The_Coffee_Club_review  <- The_Coffee_Club$Review
 A_Spoonful_of_Sugar_review  <- A_Spoonful_of_Sugar$Review
 Sala_Mexicali_review  <- Sala_Mexicali$Review
 Da_Mario_Karon_review  <- Da_Mario_Karon$Review
 Laem_Hin_Seafood_review  <- Laem_Hin_Seafood$Review
 Elephant_No9_Restaurant_review  <- Elephant_No9_Restaurant$Review
 Outdoor_Restaurant_review  <- Outdoor_Restaurant$Review 
 
 #Convert to lower case
 Soul_Curry_Restaurant_and_Bar_review <- tolower(Soul_Curry_Restaurant_and_Bar)
 Phuket_La_CaS_a_review <- tolower(Phuket_La_CaS_a)
 Butterfly_Bistro_review <- tolower(Butterfly_Bistro)
 YoGreen_Restaurant_review <-tolower(YoGreen_Restaurant)
 BeachBar_review <- tolower(BeachBar)
 NapoliRistorantePizzeria_review  <-tolower(NapoliRistorantePizzeria)
 Mom_Tris_Kitchen_at_Villa_royale_review  <- tolower(Mom_Tris_Kitchen_at_Villa_royale)
 Wine_Connection_Deli_Bistro_Chalong_Phuket_review <-tolower(Wine_Connection_Deli_Bistro_Chalong_Phuket)
 En_Vogue_Restaurant_review  <- tolower(En_Vogue_Restaurant)
 Subparod_Restaurant_review <-  tolower(Subparod_Restaurant)
 Sunset_Bar_review  <- tolower(Sunset_Bar)
 Red_Chopsticks_review  <- tolower(Red_Chopsticks)
 Cashew_Nuts_Food_review  <- tolower(Cashew_Nuts_Food)
 The_Palm_Cuisine_review  <- tolower(The_Palm_Cuisine)
 BonIslandRestaurant_review  <- tolower(BonIslandRestaurant)
 Mali_Seafood_Restaurant_Bar_review  <- tolower(Mali_Seafood_Restaurant_Bar)
 Baia_Del_Sole_review  <- tolower(Baia_Del_Sole)
 Autogrill_Risto_Bar_Pizza_review  <- tolower(Autogrill_Risto_Bar_Pizza)
 Louis_Kitchen_review  <- tolower(Louis_Kitchen)
 Baia_Del_Sole_review  <- tolower(Baia_Del_Sole)
 Autogrill_Risto_Bar_Pizza_review  <- tolower(Autogrill_Risto_Bar_Pizza)
 LouisKitchen_review  <- tolower(LouisKitchen)
 MalilaRestaurant_review  <- tolower(MalilaRestaurant)
 Thong_Dee_The_Kathu_Brasserie_review  <- tolower(Thong_Dee_The_Kathu_Brasserie)
 BaiToey_review  <- tolower(BaiToey)
 Siam_Smile_Wine_Restaurant_review  <- tolower(Siam_Smile_Wine_Restaurant)
 The_Coffee_Club_review  <- tolower(The_Coffee_Club)
 A_Spoonful_of_Sugar_review  <- tolower(A_Spoonful_of_Sugar)
 Sala_Mexicali_review  <- tolower(Sala_Mexicali)
 Da_Mario_Karon_review  <- tolower(Da_Mario_Karon)
 Laem_Hin_Seafood_review  <- tolower(Laem_Hin_Seafood)
 Elephant_No9_Restaurant_review  <- tolower(Elephant_No9_Restaurant)
 Outdoor_Restaurant_review  <- tolower(Outdoor_Restaurant) 
 
 
 
#Remove links from the reviews
Soul_Curry_Restaurant_and_Bar <- gsub("http\\S+\\s*", "",Soul_Curry_Restaurant_and_Bar)
Phuket_La_CaS_a <- gsub("http\\S+\\s*", "",Phuket_La_CaS_a )
Butterfly_Bistro<-gsub("http\\S+\\s*", "",Butterfly_Bistro)
YoGreen_Restaurant<-gsub("http\\S+\\s*", "",YoGreen_Restaurant) 
BeachBar<-gsub("http\\S+\\s*", "",BeachBar)
NapoliRistorantePizzeria<-gsub("http\\S+\\s*", "", NapoliRistorantePizzeria)
Mom_Tris_Kitchen_at_Villa_royale<-gsub("http\\S+\\s*", "",Mom_Tris_Kitchen_at_Villa_royale)
Wine_Connection_Deli_Bistro_Chalong_Phuket <-gsub("http\\S+\\s*", "",Wine_Connection_Deli_Bistro_Chalong_Phuket)
En_Vogue_Restaurant<-gsub("http\\S+\\s*", "",En_Vogue_Restaurant)
Subparod_Restaurant<-gsub("http\\S+\\s*", "",Subparod_Restaurant)
Sunset_Bar<-gsub("http\\S+\\s*", "",Sunset_Bar)  
Red_Chopsticks<-gsub("http\\S+\\s*", "",Red_Chopsticks) 
Cashew_Nuts_Food<-gsub("http\\S+\\s*", "",Cashew_Nuts_Food)
The_Palm_Cuisine<-gsub("http\\S+\\s*", "" ,The_Palm_Cuisine)
BonIslandRestaurant<-gsub("http\\S+\\s*", "" ,BonIslandRestaurant) 
Mali_Seafood_Restaurant_Bar<-gsub("http\\S+\\s*", "" ,Mali_Seafood_Restaurant_Bar) 
Baia_Del_Sole<-gsub("http\\S+\\s*", "" ,Baia_Del_Sole) 
Autogrill_Risto_Bar_Pizza<-gsub("http\\S+\\s*", "" ,Autogrill_Risto_Bar_Pizza)
Louis_Kitchen<-gsub("http\\S+\\s*", "" ,Louis_Kitchen) 
Baia_Del_Sole<-gsub("http\\S+\\s*", "" ,Baia_Del_Sole)
Autogrill_Risto_Bar_Pizza<-gsub("http\\S+\\s*", "" ,Autogrill_Risto_Bar_Pizza) 
LouisKitchen<-gsub("http\\S+\\s*", "" ,LouisKitchen) 
MalilaRestaurant<-gsub("http\\S+\\s*", "" ,MalilaRestaurant) 
Thong_Dee_The_Kathu_Brasserie<-gsub("http\\S+\\s*", "" ,Thong_Dee_The_Kathu_Brasserie) 
BaiToey<-gsub("http\\S+\\s*", "" ,BaiToey) 
Siam_Smile_Wine_Restaurant<-gsub("http\\S+\\s*", "" ,Siam_Smile_Wine_Restaurant) 
The_Coffee_Club<-gsub("http\\S+\\s*", "" ,The_Coffee_Club) 
A_Spoonful_of_Sugar<-gsub("http\\S+\\s*", "" ,A_Spoonful_of_Sugar) 
Sala_Mexicali<-gsub("http\\S+\\s*", "" ,Sala_Mexicali) 
Da_Mario_Karon<-gsub("http\\S+\\s*", "" ,Da_Mario_Karon)
Laem_Hin_Seafood<-gsub("http\\S+\\s*", "" ,Laem_Hin_Seafood) 
Elephant_No9_Restaurant<-gsub("http\\S+\\s*", "" ,Elephant_No9_Restaurant) 
Outdoor_Restaurant<-gsub("http\\S+\\s*", "" ,Outdoor_Restaurant) 



 
#Remove punctuation from the reviews
Phuket_La_CaS_a  <- gsub("[[:punct:]]", "",Phuket_La_CaS_a) 
Butterfly_Bistro <- gsub("[[:punct:]]", "",Butterfly_Bistro)
YoGreen_Restaurant<- gsub("[[:punct:]]", "",YoGreen_Restaurant)
BeachBar<- gsub("[[:punct:]]", "",BeachBar)
NapoliRistorantePizzeria<- gsub("[[:punct:]]", "",NapoliRistorantePizzeria) 
Mom_Tris_Kitchen_at_Villa_royale<- gsub("[[:punct:]]", "",Mom_Tris_Kitchen_at_Villa_royale)
Wine_Connection_Deli_Bistro_Chalong_Phuket<- gsub("[[:punct:]]", "",Wine_Connection_Deli_Bistro_Chalong_Phuket)
En_Vogue_Restaurant<- gsub("[[:punct:]]", "",En_Vogue_Restaurant) 
Subparod_Restaurant<- gsub("[[:punct:]]", "",Subparod_Restaurant) 
Sunset_Bar <- gsub("[[:punct:]]", "",Sunset_Bar) 
Red_Chopsticks <- gsub("[[:punct:]]", "",Red_Chopsticks) 
Cashew_Nuts_Food <- gsub("[[:punct:]]", "",Cashew_Nuts_Food)
The_Palm_Cuisine <- gsub("[[:punct:]]", "",The_Palm_Cuisine)
BonIslandRestaurant <- gsub("[[:punct:]]", "",BonIslandRestaurant)
Mali_Seafood_Restaurant_Bar <- gsub("[[:punct:]]", "",Mali_Seafood_Restaurant_Bar)
Baia_Del_Sole <- gsub("[[:punct:]]", "",Baia_Del_Sole )
Autogrill_Risto_Bar_Pizza<- gsub("[[:punct:]]", "",Autogrill_Risto_Bar_Pizza) 
Louis_Kitchen<- gsub("[[:punct:]]", "",Louis_Kitchen) 
Baia_Del_Sole <- gsub("[[:punct:]]", "",Baia_Del_Sole)
Autogrill_Risto_Bar_Pizza <- gsub("[[:punct:]]", "",Autogrill_Risto_Bar_Pizza)
LouisKitchen<- gsub("[[:punct:]]", "",LouisKitchen) 
MalilaRestaurant <- gsub("[[:punct:]]", "",MalilaRestaurant)
Thong_Dee_The_Kathu_Brasserie <- gsub("[[:punct:]]", "",Thong_Dee_The_Kathu_Brasserie)
BaiToey <- gsub("[[:punct:]]", "",BaiToey)
Siam_Smile_Wine_Restaurant <- gsub("[[:punct:]]", "",Siam_Smile_Wine_Restaurant)
The_Coffee_Club<- gsub("[[:punct:]]", "",The_Coffee_Club) 
A_Spoonful_of_Sugar <- gsub("[[:punct:]]", "",A_Spoonful_of_Sugar)
Sala_Mexicali<- gsub("[[:punct:]]", "",Sala_Mexicali) 
Da_Mario_Karon <- gsub("[[:punct:]]", "",Da_Mario_Karon)
Laem_Hin_Seafood <- gsub("[[:punct:]]", "",Laem_Hin_Seafood)
Elephant_No9_Restaurant <- gsub("[[:punct:]]", "",Elephant_No9_Restaurant)
Outdoor_Restaurant <- gsub("[[:punct:]]", "",Outdoor_Restaurant)
 
 
#Remove digits from the reviews
Phuket_La_CaS_a <- gsub("[[:digit:]]", "", Phuket_La_CaS_a)
Butterfly_Bistro <- gsub("[[:digit:]]", "",Butterfly_Bistro)
YoGreen_Restaurant<- gsub("[[:digit:]]", "", YoGreen_Restaurant)
BeachBar<- gsub("[[:digit:]]", "",BeachBar)
NapoliRistorantePizzeria <- gsub("[[:digit:]]", "",NapoliRistorantePizzeria)
Mom_Tris_Kitchen_at_Villa_royale<- gsub("[[:digit:]]", "",Mom_Tris_Kitchen_at_Villa_royale)
Wine_Connection_Deli_Bistro_Chalong_Phuket <- gsub("[[:digit:]]", "",Wine_Connection_Deli_Bistro_Chalong_Phuket)
En_Vogue_Restaurant<- gsub("[[:digit:]]", "",En_Vogue_Restaurant) 
Subparod_Restaurant<- gsub("[[:digit:]]", "",Subparod_Restaurant) 
Sunset_Bar<- gsub("[[:digit:]]", "",Sunset_Bar)  
Red_Chopsticks<- gsub("[[:digit:]]", "",Red_Chopsticks)  
Cashew_Nuts_Food<- gsub("[[:digit:]]", "",Cashew_Nuts_Food) 
The_Palm_Cuisine<- gsub("[[:digit:]]", "",The_Palm_Cuisine) 
BonIslandRestaurant<- gsub("[[:digit:]]", "",BonIslandRestaurant) 
Mali_Seafood_Restaurant_Bar<- gsub("[[:digit:]]", "",Mali_Seafood_Restaurant_Bar) 
Baia_Del_Sole<- gsub("[[:digit:]]", "", Baia_Del_Sole)
Autogrill_Risto_Bar_Pizza  <- gsub("[[:digit:]]", "",Autogrill_Risto_Bar_Pizza)
Louis_Kitchen<- gsub("[[:digit:]]", "",Louis_Kitchen) 
Baia_Del_Sole<- gsub("[[:digit:]]", "",Baia_Del_Sole) 
Autogrill_Risto_Bar_Pizza<- gsub("[[:digit:]]", "",Autogrill_Risto_Bar_Pizza) 
LouisKitchen <- gsub("[[:digit:]]", "", LouisKitchen) 
MalilaRestaurant <- gsub("[[:digit:]]", "",MalilaRestaurant)
Thong_Dee_The_Kathu_Brasserie <- gsub("[[:digit:]]", "",Thong_Dee_The_Kathu_Brasserie)
BaiToey<- gsub("[[:digit:]]", "",BaiToey) 
Siam_Smile_Wine_Restaurant<- gsub("[[:digit:]]", "",Siam_Smile_Wine_Restaurant) 
The_Coffee_Club<- gsub("[[:digit:]]", "",The_Coffee_Club) 
A_Spoonful_of_Sugar<- gsub("[[:digit:]]", "",A_Spoonful_of_Sugar) 
Sala_Mexicali<- gsub("[[:digit:]]", "",Sala_Mexicali) 
Da_Mario_Karon<- gsub("[[:digit:]]", "",Da_Mario_Karon) 
Laem_Hin_Seafood <- gsub("[[:digit:]]", "",Laem_Hin_Seafood)
Elephant_No9_Restaurant <- gsub("[[:digit:]]", "",Elephant_No9_Restaurant)
Outdoor_Restaurant<- gsub("[[:digit:]]", "",Outdoor_Restaurant) 
 
 
#Remove leading blank spaces at the beginning from the reviews
Phuket_La_CaS_a <- gsub("^ ", "",Phuket_La_CaS_a) 
Butterfly_Bistro <- gsub("^ ", "",Butterfly_Bistro)
YoGreen_Restaurant<- gsub("^ ", "",YoGreen_Restaurant) 
BeachBar<- gsub("^ ", "",BeachBar)
NapoliRistorantePizzeria <- gsub("^ ", "",NapoliRistorantePizzeria)
Mom_Tris_Kitchen_at_Villa_royale<- gsub("^ ", "",Mom_Tris_Kitchen_at_Villa_royale)
Wine_Connection_Deli_Bistro_Chalong_Phuket <- gsub("^ ", "",Wine_Connection_Deli_Bistro_Chalong_Phuket)
En_Vogue_Restaurant <- gsub("^ ", "",En_Vogue_Restaurant)
Subparod_Restaurant <- gsub("^ ", "",Subparod_Restaurant)
Sunset_Bar <- gsub("^ ", "",Sunset_Bar) 
Red_Chopsticks  <- gsub("^ ", "",Red_Chopsticks )
Cashew_Nuts_Food <- gsub("^ ", "",Cashew_Nuts_Food)
The_Palm_Cuisine <- gsub("^ ", "",The_Palm_Cuisine)
BonIslandRestaurant <- gsub("^ ", "",BonIslandRestaurant)
Mali_Seafood_Restaurant_Bar <- gsub("^ ", "",Mali_Seafood_Restaurant_Bar)
Baia_Del_Sole <- gsub("^ ", "",Baia_Del_Sole)
Autogrill_Risto_Bar_Pizza <- gsub("^ ", "",Autogrill_Risto_Bar_Pizza)
Louis_Kitchen <- gsub("^ ", "",Louis_Kitchen)
Baia_Del_Sole <- gsub("^ ", "",Baia_Del_Sole)
Autogrill_Risto_Bar_Pizza <- gsub("^ ", "",Autogrill_Risto_Bar_Pizza)
LouisKitchen<- gsub("^ ", "",LouisKitchen) 
MalilaRestaurant<- gsub("^ ", "",MalilaRestaurant) 
Thong_Dee_The_Kathu_Brasserie<- gsub("^ ", "",Thong_Dee_The_Kathu_Brasserie) 
BaiToey<- gsub("^ ", "",BaiToey) 
Siam_Smile_Wine_Restaurant<- gsub("^ ", "",Siam_Smile_Wine_Restaurant) 
The_Coffee_Club <- gsub("^ ", "",The_Coffee_Club)
A_Spoonful_of_Sugar <- gsub("^ ", "",A_Spoonful_of_Sugar)
Sala_Mexicali <- gsub("^ ", "",A_Spoonful_of_Sugar)
Da_Mario_Karon <- gsub("^ ", "",Da_Mario_Karon)
Laem_Hin_Seafood <- gsub("^ ", "",Laem_Hin_Seafood)
Elephant_No9_Restaurant<- gsub("^ ", "",Elephant_No9_Restaurant) 
Outdoor_Restaurant <- gsub("^ ", "",Outdoor_Restaurant)



#Remove blank spaces at the end from the reviews
Phuket_La_CaS_a <- gsub(" $", "",Phuket_La_CaS_a) 
Butterfly_Bistro<- gsub(" $", "",Butterfly_Bistro)
YoGreen_Restaurant <- gsub(" $", "",YoGreen_Restaurant)
BeachBar<- gsub(" $", "",BeachBar)
NapoliRistorantePizzeria <- gsub(" $", "",NapoliRistorantePizzeria)
Mom_Tris_Kitchen_at_Villa_royale<- gsub(" $", "",Mom_Tris_Kitchen_at_Villa_royale)
Wine_Connection_Deli_Bistro_Chalong_Phuket<- gsub(" $", "",Wine_Connection_Deli_Bistro_Chalong_Phuket) 
En_Vogue_Restaurant<- gsub(" $", "",En_Vogue_Restaurant) 
Subparod_Restaurant <- gsub(" $", "",Subparod_Restaurant)
Sunset_Bar<- gsub(" $", "",Sunset_Bar)  
Red_Chopsticks<- gsub(" $", "",Red_Chopsticks)  
Cashew_Nuts_Food<- gsub(" $", "",Cashew_Nuts_Food) 
The_Palm_Cuisine<- gsub(" $", "",The_Palm_Cuisine) 
BonIslandRestaurant <- gsub(" $", "",BonIslandRestaurant)
Mali_Seafood_Restaurant_Bar <- gsub(" $", "",Mali_Seafood_Restaurant_Bar)
Baia_Del_Sole<- gsub(" $", "",Baia_Del_Sole) 
Autogrill_Risto_Bar_Pizza<- gsub(" $", "",Autogrill_Risto_Bar_Pizza) 
Louis_Kitchen<- gsub(" $", "",Louis_Kitchen) 
Baia_Del_Sole<- gsub(" $", "",Baia_Del_Sole) 
Autogrill_Risto_Bar_Pizza<- gsub(" $", "",Autogrill_Risto_Bar_Pizza) 
LouisKitchen<- gsub(" $", "",LouisKitchen) 
MalilaRestaurant<- gsub(" $", "",MalilaRestaurant) 
Thong_Dee_The_Kathu_Brasserie<- gsub(" $", "",Thong_Dee_The_Kathu_Brasserie) 
BaiToey <- gsub(" $", "",BaiToey )
Siam_Smile_Wine_Restaurant<- gsub(" $", "",Siam_Smile_Wine_Restaurant) 
The_Coffee_Club<- gsub(" $", "",The_Coffee_Club) 
A_Spoonful_of_Sugar <- gsub(" $", "",A_Spoonful_of_Sugar)
Sala_Mexicali<- gsub(" $", "",Sala_Mexicali) 
Da_Mario_Karon <- gsub(" $", "",Da_Mario_Karon)
Laem_Hin_Seafood <- gsub(" $", "",Laem_Hin_Seafood)
Elephant_No9_Restaurant<- gsub(" $", "",Elephant_No9_Restaurant) 
Outdoor_Restaurant<- gsub(" $", "",Outdoor_Restaurant)


#Remove "food" word from the reviews
Phuket_La_CaS_a <- gsub("food", "",Phuket_La_CaS_a)
Butterfly_Bistro <- gsub("food", "",Butterfly_Bistro)
YoGreen_Restaurant <- gsub("food", "",YoGreen_Restaurant)
BeachBar<- gsub("food", "",BeachBar)
NapoliRistorantePizzeria <- gsub("food", "",NapoliRistorantePizzeria)
Mom_Tris_Kitchen_at_Villa_royale<- gsub("food", "",Mom_Tris_Kitchen_at_Villa_royale)
Wine_Connection_Deli_Bistro_Chalong_Phuket <- gsub("food", "",Wine_Connection_Deli_Bistro_Chalong_Phuket)
En_Vogue_Restaurant <- gsub("food", "",En_Vogue_Restaurant)
Subparod_Restaurant <- gsub("food", "",Subparod_Restaurant)
Sunset_Bar  <- gsub("food", "",Sunset_Bar  )
Red_Chopsticks  <- gsub("food", "",Red_Chopsticks)
Cashew_Nuts_Food <- gsub("food", "",Cashew_Nuts_Food)
The_Palm_Cuisine <- gsub("food", "",The_Palm_Cuisine)
BonIslandRestaurant <- gsub("food", "",BonIslandRestaurant)
Mali_Seafood_Restaurant_Bar <- gsub("food", "",Mali_Seafood_Restaurant_Bar)
Baia_Del_Sole <- gsub("food", "",Baia_Del_Sole)
Autogrill_Risto_Bar_Pizza<- gsub("food", "",Autogrill_Risto_Bar_Pizza) 
Louis_Kitchen <- gsub("food", "",Louis_Kitchen )
Baia_Del_Sole <- gsub("food", "",Baia_Del_Sole)
Autogrill_Risto_Bar_Pizza <- gsub("food", "",Autogrill_Risto_Bar_Pizza )
LouisKitchen <- gsub("food", "",LouisKitchen)
MalilaRestaurant <- gsub("food", "",MalilaRestaurant)
Thong_Dee_The_Kathu_Brasserie <- gsub("food", "",Thong_Dee_The_Kathu_Brasserie)
BaiToey <- gsub("food", "",BaiToey)
Siam_Smile_Wine_Restaurant <- gsub("food", "",Siam_Smile_Wine_Restaurant)
The_Coffee_Club <- gsub("food", "",The_Coffee_Club)
A_Spoonful_of_Sugar <- gsub("food", "",A_Spoonful_of_Sugar)
Sala_Mexicali <- gsub("food", "",Sala_Mexicali)
Da_Mario_Karon <- gsub("food", "",Da_Mario_Karon)
Laem_Hin_Seafood <- gsub("food", "",Laem_Hin_Seafood)
Elephant_No9_Restaurant <- gsub("food", "",Elephant_No9_Restaurant)
Outdoor_Restaurant<- gsub("food", "", Outdoor_Restaurant)




#Remove "restaurant" word from the reviews
Phuket_La_CaS_a <- gsub("restaurant", "",Phuket_La_CaS_a)
Butterfly_Bistro <- gsub("restaurant", "",Butterfly_Bistro)
YoGreen_Restaurant <- gsub("restaurant", "",YoGreen_Restaurant)
BeachBar<- gsub("restaurant", "",BeachBar)
NapoliRistorantePizzeria <- gsub("restaurant", "",NapoliRistorantePizzeria)
Mom_Tris_Kitchen_at_Villa_royale<- gsub("restaurant", "",Mom_Tris_Kitchen_at_Villa_royale)
Wine_Connection_Deli_Bistro_Chalong_Phuket <- gsub("restaurant", "",Wine_Connection_Deli_Bistro_Chalong_Phuket)
En_Vogue_Restaurant <- gsub("restaurant", "",En_Vogue_Restaurant)
Subparod_Restaurant <- gsub("restaurant", "",Subparod_Restaurant)
Sunset_Bar  <- gsub("restaurant", "",Sunset_Bar  )
Red_Chopsticks  <- gsub("restaurant", "",Red_Chopsticks)
Cashew_Nuts_Food <- gsub("restaurant", "",Cashew_Nuts_Food)
The_Palm_Cuisine <- gsub("restaurant", "",The_Palm_Cuisine)
BonIslandRestaurant <- gsub("restaurant", "",BonIslandRestaurant)
Mali_Seafood_Restaurant_Bar <- gsub("restaurant", "",Mali_Seafood_Restaurant_Bar)
Baia_Del_Sole <- gsub("restaurant", "",Baia_Del_Sole)
Autogrill_Risto_Bar_Pizza<- gsub("restaurant", "",Autogrill_Risto_Bar_Pizza) 
Louis_Kitchen <- gsub("restaurant", "",Louis_Kitchen )
Baia_Del_Sole <- gsub("restaurant", "",Baia_Del_Sole)
Autogrill_Risto_Bar_Pizza <- gsub("restaurant", "",Autogrill_Risto_Bar_Pizza )
LouisKitchen <- gsub("restaurant", "",LouisKitchen)
MalilaRestaurant <- gsub("restaurant", "",MalilaRestaurant)
Thong_Dee_The_Kathu_Brasserie <- gsub("restaurant", "",Thong_Dee_The_Kathu_Brasserie)
BaiToey <- gsub("restaurant", "",BaiToey)
Siam_Smile_Wine_Restaurant <- gsub("restaurant", "",Siam_Smile_Wine_Restaurant)
The_Coffee_Club <- gsub("restaurant", "",The_Coffee_Club)
A_Spoonful_of_Sugar <- gsub("restaurant", "",A_Spoonful_of_Sugar)
Sala_Mexicali <- gsub("restaurant", "",Sala_Mexicali)
Da_Mario_Karon <- gsub("restaurant", "",Da_Mario_Karon)
Laem_Hin_Seafood <- gsub("restaurant", "",Laem_Hin_Seafood)
Elephant_No9_Restaurant <- gsub("restaurant", "",Elephant_No9_Restaurant)
Outdoor_Restaurant<- gsub("restaurant", "", Outdoor_Restaurant)
 
  
#Inspect the vectors after cleaning
head(Phuket_La_CaS_a)
head(Butterfly_Bistro )
head(YoGreen_Restaurant )
head(BeachBar)
head(NapoliRistorantePizzeria) 
head(Mom_Tris_Kitchen_at_Villa_royale)
head(Wine_Connection_Deli_Bistro_Chalong_Phuket)
head(En_Vogue_Restaurant) 
head(Subparod_Restaurant )
head(Sunset_Bar)  
head(Red_Chopsticks)  
head(Cashew_Nuts_Food) 
head(The_Palm_Cuisine) 
head(BonIslandRestaurant) 
head(Mali_Seafood_Restaurant_Bar )
head(Baia_Del_Sole) 
head(Autogrill_Risto_Bar_Pizza) 
head(Louis_Kitchen) 
head(Baia_Del_Sole )
head(Autogrill_Risto_Bar_Pizza) 
head(LouisKitchen) 
head(MalilaRestaurant) 
head(Thong_Dee_The_Kathu_Brasserie) 
head(BaiToey) 
head(Siam_Smile_Wine_Restaurant) 
head(The_Coffee_Club) 
head(A_Spoonful_of_Sugar) 
head(Sala_Mexicali) 
head(Da_Mario_Karon) 
head(Laem_Hin_Seafood )
head(Elephant_No9_Restaurant) 
head(Outdoor_Restaurant) 


#Converting the text vectors to corpus 
corpus_Phuket_La_CaS_a<- Corpus(VectorSource(Phuket_La_CaS_a))
corpus_Butterfly_Bistro <- Corpus(VectorSource(Butterfly_Bistro))
corpus_YoGreen_Restaurant <- Corpus(VectorSource(YoGreen_Restaurant))
corpus_BeachBar<- Corpus(VectorSource(BeachBar))
corpus_NapoliRistorantePizzeria<- Corpus(VectorSource (NapoliRistorantePizzeria))
corpus_Mom_Tris_Kitchen_at_Villa_royale<- Corpus(VectorSource (Mom_Tris_Kitchen_at_Villa_royale))
corpus_Wine_Connection_Deli_Bistro_Chalong_Phuket <- Corpus(VectorSource(Connection_Deli_Bistro_Chalong_Phuket))
corpus_En_Vogue_Restaurant<- Corpus(VectorSource (En_Vogue_Restaurant))
corpus_Subparod_Restaurant <- Corpus(VectorSource(Subparod_Restaurant))
corpus_Sunset_Bar  <- Corpus(VectorSource(Sunset_Bar))
corpus_Red_Chopsticks  <- Corpus(VectorSource(Red_Chopsticks ))
corpus_Cashew_Nuts_Food <- Corpus(VectorSource(Cashew_Nuts_Food))
corpus_The_Palm_Cuisine <- Corpus(VectorSource(The_Palm_Cuisine))
corpus_BonIslandRestaurant <- Corpus(VectorSource(BonIslandRestaurant))
corpus_Mali_Seafood_Restaurant_Bar <- Corpus(VectorSource(Mali_Seafood_Restaurant_Bar))
corpus_Baia_Del_Sole <- Corpus(VectorSource(Baia_Del_Sole))
corpus_Autogrill_Risto_Bar_Pizza <- Corpus(VectorSource(Autogrill_Risto_Bar_Pizza))
corpus_Louis_Kitchen <- Corpus(VectorSource(Louis_Kitchen ))
corpus_Baia_Del_Sole <- Corpus(VectorSource(Baia_Del_Sole))
corpus_Autogrill_Risto_Bar_Pizza <- Corpus(VectorSource(Autogrill_Risto_Bar_Pizza))
corpus_LouisKitchen <- Corpus(VectorSource(LouisKitchen))
corpus_MalilaRestaurant <- Corpus(VectorSource(MalilaRestaurant))
corpus_Thong_Dee_The_Kathu_Brasserie <- Corpus(VectorSource(Thong_Dee_The_Kathu_Brasserie))
corpus_BaiToey<- Corpus(VectorSource (BaiToey))
corpus_Siam_Smile_Wine_Restaurant <- Corpus(VectorSource(Siam_Smile_Wine_Restaurant))
corpus_The_Coffee_Club <- Corpus(VectorSource(The_Coffee_Club))
corpus_A_Spoonful_of_Sugar <- Corpus(VectorSource(A_Spoonful_of_Sugar))
corpus_Sala_Mexicali <- Corpus(VectorSource(Sala_Mexicali))
corpus_Da_Mario_Karon <- Corpus(VectorSource(Da_Mario_Karon))
corpus_Laem_Hin_Seafood <- Corpus(VectorSource(Laem_Hin_Seafood))
corpus_Elephant_No9_Restaurant<- Corpus(VectorSource(Elephant_No9_Restaurant))
corpus_Outdoor_Restaurant<- Corpus(VectorSource(Outdoor_Restaurant ))
  


#inspect the corpus
corpus_Phuket_La_CaS_a
corpus_Butterfly_Bistro 
corpus_YoGreen_Restaurant 
corpus_BeachBar
corpus_Mom_Tris_Kitchen_at_Villa_royale
corpus_En_Vogue_Restaurant
corpus_Subparod_Restaurant 
corpus_Sunset_Bar  
corpus_Cashew_Nuts_Food 
corpus_The_Palm_Cuisine 
corpus_BonIslandRestaurant 
corpus_Mali_Seafood_Restaurant_Bar 
corpus_Baia_Del_Sole 
corpus_Autogrill_Risto_Bar_Pizza 
corpus_Louis_Kitchen 
corpus_Baia_Del_Sole 
corpus_Autogrill_Risto_Bar_Pizza 
corpus_LouisKitchen 
corpus_MalilaRestaurant 
corpus_Thong_Dee_The_Kathu_Brasserie 
corpus_BaiToey
corpus_Siam_Smile_Wine_Restaurant 
corpus_The_Coffee_Club 
corpus_A_Spoonful_of_Sugar 
corpus_Sala_Mexicali 
corpus_Da_Mario_Karon 
corpus_Laem_Hin_Seafood 
corpus_Elephant_No9_Restaurant
corpus_Outdoor_Restaurant


#Clean up corpus by removing stop words and Whitespace
stem_corpus_Phuket_La_CaS_a<- tm_map(corpus_Phuket_La_CaS_a, removeWords,stopwords("english"))
corpus_Phuket_La_CaS_a<- tm_map(corpus_Phuket_La_CaS_a, stripWhitespace)
inspect(corpus_Phuket_La_CaS_a)

stem_corpus_Butterfly_Bistro <- tm_map(corpus_Butterfly_Bistro, removeWords,stopwords("english"))
corpus_Butterfly_Bistro<- tm_map(corpus_Butterfly_Bistro, stripWhitespace)
inspect(corpus_Butterfly_Bistro)

stem_corpus_YoGreen_Restaurant <- tm_map(corpus_YoGreen_Restaurant, removeWords,stopwords("english"))
corpus_YoGreen_Restaurant<- tm_map(corpus_YoGreen_Restaurant, stripWhitespace)
inspect(corpus_YoGreen_Restaurant)


stem_corpus_BeachBar<- tm_map(corpus_BeachBar, removeWords,stopwords("english"))
corpus_BeachBar<- tm_map(corpus_BeachBar, stripWhitespace)
inspect(corpus_BeachBar)




stem_corpus_Mom_Tris_Kitchen_at_Villa_royale<- tm_map(corpus_Mom_Tris_Kitchen_at_Villa_royale, removeWords,stopwords("english"))
corpus_Mom_Tris_Kitchen_at_Villa_royale<- tm_map(corpus_Mom_Tris_Kitchen_at_Villa_royale, stripWhitespace)
inspect(corpus_Mom_Tris_Kitchen_at_Villa_royale)




stem_corpus_Wine_Connection_Deli_Bistro_Chalong_Phuket<- tm_map(corpus_Wine_Connection_Deli_Bistro_Chalong_Phuke, removeWords,stopwords("english"))
corpus_Wine_Connection_Deli_Bistro_Chalong_Phuke<- tm_map(corpus_Wine_Connection_Deli_Bistro_Chalong_Phuke, stripWhitespace)
inspect(corpus_Wine_Connection_Deli_Bistro_Chalong_Phuke)



stem_corpus_En_Vogue_Restaurant<- tm_map(corpus_En_Vogue_Restaurant, removeWords,stopwords("english"))
corpus_En_Vogue_Restaurant<- tm_map(corpus_En_Vogue_Restaurant, stripWhitespace)
inspect(corpus_En_Vogue_Restaurant)


stem_corpus_Subparod_Restaurant <- tm_map(corpus_Subparod_Restaurant, removeWords,stopwords("english"))
corpus_Subparod_Restaurant<- tm_map(corpus_Subparod_Restaurant, stripWhitespace)
inspect(corpus_Subparod_Restaurant)


stem_corpus_Sunset_Bar<- tm_map(corpus_Sunset_Bar, removeWords,stopwords("english"))
corpus_Sunset_Bar<- tm_map(corpus_Sunset_Bar, stripWhitespace)
inspect(corpus_Sunset_Bar)



stem_corpus_Red_Chopsticks <- tm_map(corpus_Red_Chopsticks, removeWords,stopwords("english"))
corpus_Red_Chopsticks<- tm_map(corpus_Red_Chopsticks, stripWhitespace)
inspect(corpus_Red_Chopsticks)


stem_corpus_Cashew_Nuts_Food <- tm_map(corpus_Cashew_Nuts_Food, removeWords,stopwords("english"))
corpus_Cashew_Nuts_Food<- tm_map(corpus_Cashew_Nuts_Food, stripWhitespace)
inspect(corpus_Cashew_Nuts_Food)




stem_corpus_The_Palm_Cuisine <- tm_map(corpus_The_Palm_Cuisine, removeWords,stopwords("english"))
corpus_The_Palm_Cuisine<- tm_map(corpus_The_Palm_Cuisine, stripWhitespace)
inspect(corpus_The_Palm_Cuisine)





stem_corpus_BonIslandRestaurant<- tm_map(corpus_BonIslandRestaurant, removeWords,stopwords("english"))
corpus_BonIslandRestaurant<- tm_map(corpus_BonIslandRestaurant, stripWhitespace)
inspect(corpus_BonIslandRestaurant)



stem_corpus_Mali_Seafood_Restaurant_Bar<- tm_map(corpus_Mali_Seafood_Restaurant_Bar, removeWords,stopwords("english"))
corpus_Mali_Seafood_Restaurant_Bar<- tm_map(corpus_Mali_Seafood_Restaurant_Bar, stripWhitespace)
inspect(corpus_Mali_Seafood_Restaurant_Bar)



stem_corpus_Baia_Del_Sole<- tm_map(corpus_Baia_Del_Sole, removeWords,stopwords("english"))
corpus_Baia_Del_Sole<- tm_map(corpus_Baia_Del_Sole, stripWhitespace)
inspect(corpus_Baia_Del_Sole)





stem_corpus_Autogrill_Risto_Bar_Pizza<- tm_map(corpus_Autogrill_Risto_Bar_Pizza, removeWords,stopwords("english"))
corpus_Autogrill_Risto_Bar_Pizza<- tm_map(corpus_Autogrill_Risto_Bar_Pizza, stripWhitespace)
inspect(corpus_Autogrill_Risto_Bar_Pizza) 



stem_corpus_Louis_Kitchen<- tm_map(corpus_Louis_Kitchen, removeWords,stopwords("english"))
corpus_Louis_Kitchen<- tm_map(corpus_Louis_Kitchen, stripWhitespace)
inspect(corpus_Louis_Kitchen)



stem_corpus_Baia_Del_Sole<- tm_map(corpus_Baia_Del_Sole, removeWords,stopwords("english"))
corpus_Baia_Del_Sole<- tm_map(corpus_Baia_Del_Sole, stripWhitespace)
inspect(corpus_Baia_Del_Sole)





stem_corpus_Autogrill_Risto_Bar_Pizza <- tm_map(corpus_Autogrill_Risto_Bar_Pizza, removeWords,stopwords("english"))
corpus_Autogrill_Risto_Bar_Pizza<- tm_map(corpus_Baia_Del_Sole, stripWhitespace)
inspect(corpus_Autogrill_Risto_Bar_Pizza)





stem_corpus_LouisKitchen<- tm_map(corpus_LouisKitchen, removeWords,stopwords("english"))
corpus_LouisKitchen<- tm_map(corpus_LouisKitchene, stripWhitespace)
inspect(corpus_LouisKitchen) 



stem_corpus_MalilaRestaurant <- tm_map(corpus_MalilaRestaurant, removeWords,stopwords("english"))
corpus_MalilaRestaurant<- tm_map(corpus_MalilaRestaurant, stripWhitespace)
inspect(corpus_MalilaRestaurant)



stem_corpus_Thong_Dee_The_Kathu_Brasserie <- tm_map(corpus_Thong_Dee_The_Kathu_Brasserie, removeWords,stopwords("english"))
corpus_Thong_Dee_The_Kathu_Brasserie<- tm_map(corpus_Thong_Dee_The_Kathu_Brasserie, stripWhitespace)
inspect(corpus_Thong_Dee_The_Kathu_Brasserie)




stem_corpus_BaiToey<- tm_map(corpus_BaiToey, removeWords,stopwords("english"))
corpus_BaiToey<- tm_map(corpus_BaiToey, stripWhitespace)
inspect(corpus_BaiToey)


stem_corpus_Siam_Smile_Wine_Restaurant <- tm_map(corpus_Siam_Smile_Wine_Restaurant, removeWords,stopwords("english"))
corpus_Siam_Smile_Wine_Restaurant<- tm_map(corpus_Siam_Smile_Wine_Restaurant, stripWhitespace)
inspect(corpus_Siam_Smile_Wine_Restaurant)


stem_corpus_The_Coffee_Club<- tm_map(corpus_The_Coffee_Club, removeWords,stopwords("english"))
corpus_The_Coffee_Club<- tm_map(corpus_The_Coffee_Club, stripWhitespace)
inspect(corpus_The_Coffee_Clubcorpus_The_Coffee_Club) 





stem_corpus_A_Spoonful_of_Sugar <- tm_map(corpus_The_Coffee_Club, removeWords,stopwords("english"))
corpus_The_Coffee_Club<- tm_map(corpus_The_Coffee_Club, stripWhitespace)
inspect(corpus_A_Spoonful_of_Sugar )




stem_corpus_Sala_Mexicali <- tm_map(corpus_Sala_Mexicali, removeWords,stopwords("english"))
corpus_Sala_Mexicali<- tm_map(corpus_Sala_Mexicali, stripWhitespace)
inspect(corpus_Sala_Mexicali)



stem_corpus_Da_Mario_Karon<- tm_map(corpus_Da_Mario_Karon, removeWords,stopwords("english"))
corpus_Da_Mario_Karon<- tm_map(corpus_Da_Mario_Karon, stripWhitespace)
inspect(corpus_Da_Mario_Karon)



stem_corpus_Laem_Hin_Seafood <- tm_map(corpus_Laem_Hin_Seafood, removeWords,stopwords("english"))
corpus_Laem_Hin_Seafood<- tm_map(corpus_Laem_Hin_Seafood, stripWhitespace)
inspect(corpus_Laem_Hin_Seafood)




stem_corpus_Elephant_No9_Restaurant<- tm_map(corpus_Elephant_No9_Restaurant, removeWords,stopwords("english"))
corpus_Elephant_No9_Restaurant<- tm_map(corpus_Elephant_No9_Restaurant, stripWhitespace)
inspect(corpus_Elephant_No9_Restaurant)


corpus_Outdoor_Restaurant<- tm_map(corpus_Outdoor_Restaurant, removeWords,stopwords("english"))
corpus_Outdoor_Restaurant<- tm_map(corpus_Outdoor_Restaurant, stripWhitespace)
inspect(corpus_Outdoor_Restaurant)





#Stem the words to their root of all reviews present in the corpus

stem_corpus_Phuket_La_CaS_a<- tm_map(corpus_Phuket_La_CaS_a, removeWords,stopwords("english"))
corpus_Phuket_La_CaS_a<- tm_map(corpus_Phuket_La_CaS_a, stripWhitespace)
inspect(corpus_Phuket_La_CaS_a)

stem_corpus_Butterfly_Bistro <- tm_map(corpus_Butterfly_Bistro, removeWords,stopwords("english"))
corpus_Butterfly_Bistro<- tm_map(corpus_Butterfly_Bistro, stripWhitespace)
inspect(corpus_Butterfly_Bistro)

stem_corpus_YoGreen_Restaurant <- tm_map(corpus_YoGreen_Restaurant, removeWords,stopwords("english"))
corpus_YoGreen_Restaurant<- tm_map(corpus_YoGreen_Restaurant, stripWhitespace)
inspect(corpus_YoGreen_Restaurant)


stem_corpus_BeachBar<- tm_map(corpus_BeachBar, removeWords,stopwords("english"))
corpus_BeachBar<- tm_map(corpus_BeachBar, stripWhitespace)
inspect(corpus_BeachBar)




stem_corpus_Mom_Tris_Kitchen_at_Villa_royale<- tm_map(corpus_Mom_Tris_Kitchen_at_Villa_royale, removeWords,stopwords("english"))
corpus_Mom_Tris_Kitchen_at_Villa_royale<- tm_map(corpus_Mom_Tris_Kitchen_at_Villa_royale, stripWhitespace)
inspect(corpus_Mom_Tris_Kitchen_at_Villa_royale)




stem_corpus_Wine_Connection_Deli_Bistro_Chalong_Phuket<- tm_map(corpus_Wine_Connection_Deli_Bistro_Chalong_Phuke, removeWords,stopwords("english"))
corpus_Wine_Connection_Deli_Bistro_Chalong_Phuke<- tm_map(corpus_Wine_Connection_Deli_Bistro_Chalong_Phuke, stripWhitespace)
inspect(corpus_Wine_Connection_Deli_Bistro_Chalong_Phuke)



stem_corpus_En_Vogue_Restaurant<- tm_map(corpus_En_Vogue_Restaurant, removeWords,stopwords("english"))
corpus_En_Vogue_Restaurant<- tm_map(corpus_En_Vogue_Restaurant, stripWhitespace)
inspect(corpus_En_Vogue_Restaurant)


stem_corpus_Subparod_Restaurant <- tm_map(corpus_Subparod_Restaurant, removeWords,stopwords("english"))
corpus_Subparod_Restaurant<- tm_map(corpus_Subparod_Restaurant, stripWhitespace)
inspect(corpus_Subparod_Restaurant)


stem_corpus_Sunset_Bar<- tm_map(corpus_Sunset_Bar, removeWords,stopwords("english"))
corpus_Sunset_Bar<- tm_map(corpus_Sunset_Bar, stripWhitespace)
inspect(corpus_Sunset_Bar)



stem_corpus_Red_Chopsticks <- tm_map(corpus_Red_Chopsticks, removeWords,stopwords("english"))
corpus_Red_Chopsticks<- tm_map(corpus_Red_Chopsticks, stripWhitespace)
inspect(corpus_Red_Chopsticks)


stem_corpus_Cashew_Nuts_Food <- tm_map(corpus_Cashew_Nuts_Food, removeWords,stopwords("english"))
corpus_Cashew_Nuts_Food<- tm_map(corpus_Cashew_Nuts_Food, stripWhitespace)
inspect(corpus_Cashew_Nuts_Food)




stem_corpus_The_Palm_Cuisine <- tm_map(corpus_The_Palm_Cuisine, removeWords,stopwords("english"))
corpus_The_Palm_Cuisine<- tm_map(corpus_The_Palm_Cuisine, stripWhitespace)
inspect(corpus_The_Palm_Cuisine)





stem_corpus_BonIslandRestaurant<- tm_map(corpus_BonIslandRestaurant, removeWords,stopwords("english"))
corpus_BonIslandRestaurant<- tm_map(corpus_BonIslandRestaurant, stripWhitespace)
inspect(corpus_BonIslandRestaurant)



stem_corpus_Mali_Seafood_Restaurant_Bar<- tm_map(corpus_Mali_Seafood_Restaurant_Bar, removeWords,stopwords("english"))
corpus_Mali_Seafood_Restaurant_Bar<- tm_map(corpus_Mali_Seafood_Restaurant_Bar, stripWhitespace)
inspect(corpus_Mali_Seafood_Restaurant_Bar)



stem_corpus_Baia_Del_Sole<- tm_map(corpus_Baia_Del_Sole, removeWords,stopwords("english"))
corpus_Baia_Del_Sole<- tm_map(corpus_Baia_Del_Sole, stripWhitespace)
inspect(corpus_Baia_Del_Sole)





stem_corpus_Autogrill_Risto_Bar_Pizza<- tm_map(corpus_Autogrill_Risto_Bar_Pizza, removeWords,stopwords("english"))
corpus_Autogrill_Risto_Bar_Pizza<- tm_map(corpus_Autogrill_Risto_Bar_Pizza, stripWhitespace)
inspect(corpus_Autogrill_Risto_Bar_Pizza) 



stem_corpus_Louis_Kitchen<- tm_map(corpus_Louis_Kitchen, removeWords,stopwords("english"))
corpus_Louis_Kitchen<- tm_map(corpus_Louis_Kitchen, stripWhitespace)
inspect(corpus_Louis_Kitchen)



stem_corpus_Baia_Del_Sole<- tm_map(corpus_Baia_Del_Sole, removeWords,stopwords("english"))
corpus_Baia_Del_Sole<- tm_map(corpus_Baia_Del_Sole, stripWhitespace)
inspect(corpus_Baia_Del_Sole)





stem_corpus_Autogrill_Risto_Bar_Pizza <- tm_map(corpus_Autogrill_Risto_Bar_Pizza, removeWords,stopwords("english"))
corpus_Autogrill_Risto_Bar_Pizza<- tm_map(corpus_Baia_Del_Sole, stripWhitespace)
inspect(corpus_Autogrill_Risto_Bar_Pizza)





stem_corpus_LouisKitchen<- tm_map(corpus_LouisKitchen, removeWords,stopwords("english"))
corpus_LouisKitchen<- tm_map(corpus_LouisKitchene, stripWhitespace)
inspect(corpus_LouisKitchen) 



stem_corpus_MalilaRestaurant <- tm_map(corpus_MalilaRestaurant, removeWords,stopwords("english"))
corpus_MalilaRestaurant<- tm_map(corpus_MalilaRestaurant, stripWhitespace)
inspect(corpus_MalilaRestaurant)



stem_corpus_Thong_Dee_The_Kathu_Brasserie <- tm_map(corpus_Thong_Dee_The_Kathu_Brasserie, removeWords,stopwords("english"))
corpus_Thong_Dee_The_Kathu_Brasserie<- tm_map(corpus_Thong_Dee_The_Kathu_Brasserie, stripWhitespace)
inspect(corpus_Thong_Dee_The_Kathu_Brasserie)




stem_corpus_BaiToey<- tm_map(corpus_BaiToey, removeWords,stopwords("english"))
corpus_BaiToey<- tm_map(corpus_BaiToey, stripWhitespace)
inspect(corpus_BaiToey)


stem_corpus_Siam_Smile_Wine_Restaurant <- tm_map(corpus_Siam_Smile_Wine_Restaurant, removeWords,stopwords("english"))
corpus_Siam_Smile_Wine_Restaurant<- tm_map(corpus_Siam_Smile_Wine_Restaurant, stripWhitespace)
inspect(corpus_Siam_Smile_Wine_Restaurant)


stem_corpus_The_Coffee_Club<- tm_map(corpus_The_Coffee_Club, removeWords,stopwords("english"))
corpus_The_Coffee_Club<- tm_map(corpus_The_Coffee_Club, stripWhitespace)
inspect(corpus_The_Coffee_Clubcorpus_The_Coffee_Club) 





stem_corpus_A_Spoonful_of_Sugar <- tm_map(corpus_The_Coffee_Club, removeWords,stopwords("english"))
corpus_The_Coffee_Club<- tm_map(corpus_The_Coffee_Club, stripWhitespace)
inspect(corpus_A_Spoonful_of_Sugar )




stem_corpus_Sala_Mexicali <- tm_map(corpus_Sala_Mexicali, removeWords,stopwords("english"))
corpus_Sala_Mexicali<- tm_map(corpus_Sala_Mexicali, stripWhitespace)
inspect(corpus_Sala_Mexicali)



stem_corpus_Da_Mario_Karon<- tm_map(corpus_Da_Mario_Karon, removeWords,stopwords("english"))
corpus_Da_Mario_Karon<- tm_map(corpus_Da_Mario_Karon, stripWhitespace)
inspect(corpus_Da_Mario_Karon)



stem_corpus_Laem_Hin_Seafood <- tm_map(corpus_Laem_Hin_Seafood, removeWords,stopwords("english"))
corpus_Laem_Hin_Seafood<- tm_map(corpus_Laem_Hin_Seafood, stripWhitespace)
inspect(corpus_Laem_Hin_Seafood)




stem_corpus_Elephant_No9_Restaurant<- tm_map(corpus_Elephant_No9_Restaurant, removeWords,stopwords("english"))
corpus_Elephant_No9_Restaurant<- tm_map(corpus_Elephant_No9_Restaurant, stripWhitespace)
inspect(corpus_Elephant_No9_Restaurant)


corpus_Outdoor_Restaurant<- tm_map(corpus_Outdoor_Restaurant, removeWords,stopwords("english"))
corpus_Outdoor_Restaurant<- tm_map(corpus_Outdoor_Restaurant, stripWhitespace)
inspect(corpus_Outdoor_Restaurant)


#Load the positive and negative lexicon data
positive_lexicon <- read.csv("positive-lexicon.txt")
negative_lexicon <- read.csv("negative-lexicon.txt")


#Inspect lexicons
head(positive_lexicon)
tail(positive_lexicon)

head(negative_lexicon)
tail(negative_lexicon)

#Creating a function for sentimental analysis
sentiment <- function(stem_corpus)
{
  #generate wordclouds
  wordcloud(stem_corpus,
            min.freq = 3,
            colors=brewer.pal(8, "Dark2"),
            random.color = TRUE,
            max.words = 100)
  #Calculating the count of total positive and negative words in each review
  
  #Create variables and vectors
  total_pos_count <- 0
  total_neg_count <- 0
  pos_count_vector <- c()
  neg_count_vector <- c()
  #Calculate the size of the corpus
  size <- length(stem_corpus)
  
  for(i in 1:size)
  {
    #All the words in current review
    corpus_words<- list(strsplit(stem_corpus[[i]]$content, split = " "))
    
    #positive words in current review
    pos_count <-length(intersect(unlist(corpus_words), unlist(positive_lexicon)))
    
    #negative words in current review
    neg_count <- length(intersect(unlist(corpus_words), unlist(negative_lexicon)))
    
    total_pos_count <- total_pos_count + pos_count ## overall positive count
    total_neg_count <- total_neg_count + neg_count ## overall negative count
    
  }
  #Calculating overall percentage of positive and negative words of all the reviews
  total_pos_count ## overall positive count
  total_neg_count ## overall negative count
  total_count <- total_pos_count + total_neg_count
  overall_positive_percentage <- (total_pos_count*100)/total_count
  overall_negative_percentage <- (total_neg_count*100)/total_count
  overall_positive_percentage ## overall positive percentage
  #Create a dataframe with all the positive and negative reviews
  df<-data.frame(Review_Type=c("Postive","Negitive"),
                 Count=c(total_pos_count ,total_neg_count ))
  print(df) #Print
  overall_positive_percentage<-paste("Percentage of Positive Reviews:",
                                     round(overall_positive_percentage,2),"%")
  return(overall_positive_percentage)
}



sentiment(stem_corpus_Laem_Hin_Seafood)
sentiment(stem_corpus_Phuket_La_CaS_a)
sentiment(stem_corpus_Butterfly_Bistro) 
sentiment(stem_corpus_YoGreen_Restaurant) 
sentiment(stem_corpus_corpus_BeachBar)
sentiment(stem_corpus_corpus_Mom_Tris_Kitchen_at_Villa_royale)
sentiment(stem_corpus_Wine_Connection_Deli_Bistro_Chalong_Phuket) 
sentiment(stem_corpus_En_Vogue_Restaurant)
sentiment(stem_corpus_Subparod_Restaurant) 
sentiment(stem_corpus_Sunset_Bar)  
sentiment(stem_corpus_CRed_hopsticks)  
sentiment (stem_corpus_Cashew_Nuts_Food) 
sentiment(stem_corpus_The_Palm_Cuisine) 
sentiment(stem_corpus_BonIslandRestaurant )
sentiment(stem_corpus_Mali_Seafood_Restaurant_Bar) 
sentiment(stem_corpus_Baia_Del_Sole )
sentiment(stem_corpus_Autogrill_Risto_Bar_Pizza) 
sentiment(stem_corpus_Louis_Kitchen) 
sentiment(stem_corpus_Baia_Del_Sole) 
sentiment(stem_corpus_Autogrill_Risto_Bar_Pizza) 
sentiment (stem_corpus_LouisKitchen) 
sentiment(stem_corpus_MalilaRestaurant) 
sentiment(stem_corpus_Thong_Dee_The_Kathu_Brasserie) 
sentiment(stem_corpus_BaiToey)
sentiment(stem_corpus_Siam_Smile_Wine_Restaurant) 
sentiment(stem_corpus_The_Coffee_Club) 
sentiment(stem_corpus_A_Spoonful_of_Sugar) 
sentiment  (stem_corpus_Sala_Mexicali) 
sentiment(stem_corpus_Da_Mario_Karon )
sentiment(stem_corpus_Laem_Hin_Seafood) 
sentiment(stem_corpus_Elephant_No9_Restaurant)
sentiment(stem_corpus_Outdoor_Restaurant)



































# more robust approach ----

source("sentiment.R")
source("corpusFun.R")

Reviews <- read.csv("Reviews_of_Amazon_Products.csv", header= TRUE)

Reviews %>% 
  gsub("http\\S+\\s*|[[:punct:]]|[[:digit:]]| $|tablet",
       "", .) 


R_16GB_Blue<-subset(Reviews,
                    name=="Fire HD 8 Tablet, Wi-Fi, 16 GB-Blue")
R_16GB_Magenta<-subset(Reviews,
                       name=="Fire HD 8 Tablet, Wi-Fi, 16 GB-Magenta")
R_32GB_Blue<-subset(Reviews,
                    name=="Fire HD 8 Tablet, Wi-Fi, 32 GB-Blue")
R_32GB_Magenta<-subset(Reviews,
                       name=="Fire HD 8 Tablet, Wi-Fi, 32 GB-Magenta")
R_32GB_Black<-subset(Reviews,
                     name=="Fire HD 8 Tablet, Wi-Fi, 32 GB-Black")


review_16GB_Blue<-R_16GB_Blue$reviews.text
review_16GB_Magenta<-R_16GB_Magenta$reviews.text
review_32GB_Blue<-R_32GB_Blue$reviews.text
review_32GB_Magenta<-R_32GB_Magenta$reviews.text
review_32GB_Black<-R_32GB_Black$reviews.text


corpusFun <- function(x){
  require(tm)
  require(wordcloud)
  
  # step 1: Converting the text vectors to corpus
  z1 = Corpus(VectorSource(x)) 
  # step 2: 
  z2 = tm_map(z1, removeWords, stopwords("english"))
  z3 = tm_map(z2, stripWhitespace)
  z4 = tm_map(z3, stemDocument)
  res = sentiment(z4)
  return(res)
}

# apply corpusFUN to data

corp_32GB_Blue <- corpusFun(x = review_32GB_Blue)
corp_16GB_Blue <- corpusFun(x = review_16GB_Blue)
review_32GB_Black
corp_32GB_Black <- corpusFun(x = review_32GB_Black)
review_16GB_Magenta
corp_GB_Magenta <- corpusFun(x = review_16GB_Magenta)


























 install.packages("SnowballC")
  library(SnowballC)
  
  install.packages("dplyr")
 library(dplyr)
 
 count <- t.hotel %>% count(t.hotel$Hotel.Restaurant.name, sort = TRUE)
 View(count)
 
 #ignore
 t.hotel2 <- t.hotel %>% filter(grepl('Bar', Hotel.Restaurant.name))
 
 count2 <- t.hotel2 %>% count(Hotel.Restaurant.name, sort = TRUE)
 View(count2)
 
 count3 <- count2[1:30,1]
 count3
 
 hotel <- filter(t.hotel, t.hotel$Hotel.Restaurant.name %in% count3)
 View(hotel)
 
 hotelr <- hotel$Review
 
 head(hotelr)
 
 