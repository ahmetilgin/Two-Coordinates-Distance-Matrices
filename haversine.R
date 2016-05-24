x<-read.table(file="/home/valkyrie/Şehirler arası Mesafe/koordinates.txt",header =FALSE,sep ="\t")
mesafeler<-function()
{
  options(scipen=999)
library("geosphere")
#distHaversine(c(36.88414,30.70563),c(41.00145,39.7178))

korX<-x$V3
korY<-x$V4
korX<-gsub(",","\\.",korX)
korY<-gsub(",","\\.",korY)

korX<-as.numeric(korX)
korY<-as.numeric(korY)

dizi<-array(0,c(81,81))
for(i in 1:81)
{
  x<-as.numeric(korX[i])
  y<-as.numeric(korY[i])
  xy<-c(x,y)
  for(q in 1:81)
  {
    x2<-as.numeric(korX[q])
    y2<-as.numeric(korY[q])
    xy2<-c(x2,y2)
    dizi[i,q]<-distHaversine(xy,xy2)/1000
  }
}

return(dizi)
}
uzaklık<-mesafeler()
write(uzaklık,"Haversine.txt")
uzaklık
