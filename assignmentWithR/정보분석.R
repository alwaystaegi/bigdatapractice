library(wordcloud)
library(KoNLP)
library(RColorBrewer)
  library(stringr)
extractNoun(a)



data1<-readLines("data.txt")
data1
data2<-sapply(data1,extractNoun,USE.NAMES = F)
data2

data3<-unlist(data2)
movie_gsub<- str_replace_all(data3,"[^[:alpha:]]","")
gsub("\\d+","",movie_gsub)
gsub("\\.","",movie_gsub)
movie_gsub<-gsub(" ","",movie_gsub)
movie_gsub <- gsub("내공","",movie_gsub)
movie_gsub <- gsub("중간","",movie_gsub)

movie_gsub<- Filter(function(x){nchar(x)>=2},movie_gsub)
movie_gsub
write(unlist(movie_gsub),"data2.txt")
data4= read.table("data2.txt")
wordcount<- table(data4)
head(sort(wordcount,decreasing=T),10)
palete<- brewer.pal(9,"Set3")
wordcloud(names(wordcount),freq=wordcount,scale=c(5,1),rot.per=0.25,min.freq=1,random.order=F,random.color=T,color=palete)

