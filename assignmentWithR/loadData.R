setwd("C:/Users/taegi/Documents/iot1500")
#install.packages("rvest")#웹 페이지 통째로 수집
#install.packages("httr")#웹 서버에 접속하는 페이지
#install.packages("stringr")
#데이터 수집

library(rvest)
library(httr)
library(stringr)
url= 'https://kin.naver.com/qna/list.naver?dirId=602060402&queryTime=2022-10-24%2018%3A33%3A33&page='
url

htxt=read_html(url)
htxt
allReview= c()



for(page in 1:100){
  urls=paste(url,page,sep="")
  htxt= read_html(urls)
  comments=html_nodes(htxt,'td.title>a')
  print(comments)
  reviews= html_text(comments)
  if(length(reviews)==0){break}
  allReview=c(allReview,reviews)
  print(page)
}
write(allReview,"data.txt")
#write.csv(allReview,"영화평점수집.csv")

