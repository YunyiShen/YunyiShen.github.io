require(RCurl)
require(RJSONIO)
require(plyr)
require(tmcn)
require(rvest)

url <- function(address, return.call = "json", sensor = "false") {
  root <- "http://maps.google.com/maps/api/geocode/"
  u <- paste(root, return.call, "?address=", address, "&sensor=", sensor, sep = "")
  return(URLencode(u))
}

geoCode <- function(address,verbose=FALSE) {
  if(verbose) cat(address,"\n")
  u <- url(address)
  doc <- getURL(u)
  x <- fromJSON(doc,simplify = FALSE)
  if(x$status=="OK") {
    lat <- x$results[[1]]$geometry$location$lat
    lng <- x$results[[1]]$geometry$location$lng
    location_type <- x$results[[1]]$geometry$location_type
    formatted_address <- x$results[[1]]$formatted_address
    return(c(lat, lng, location_type, formatted_address))
  } else {
    return(c(NA,NA,NA, NA))
  }
}


oldver.point=read.csv('C:/aftergoogle3.csv')

nn=nrow(oldver.point)

oldver.point=data.frame(oldver.point,google=matrix(nrow=nn,ncol=1))
for(i in 1:nn){
  if(is.na(oldver.point$lat[i])){
    namecoding=catUTF8(oldver.point$oldver.point.char[i])
    geo=tryCatch(geoCode(revUTF8(namecoding)),
                 error=function(e){c(NA,NA,"err",NA)})
    
    
    lattemp=geo[1]
    longtemp=geo[2]
	errlog = as.character( geo[3])
    googlep=geo[4]
    if(!is.na(lattemp)){
      oldver.point$lat[i]=lattemp
      oldver.point$long[i]=longtemp
      oldver.point$google[i]=googlep
    }
    
  }
  print(paste('point ',as.character(i),'done'))
}

write.csv(oldver.point,'C:/aftergoogle2.csv',row.names = F)
