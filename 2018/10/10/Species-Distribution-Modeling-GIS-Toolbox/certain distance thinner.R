#data selection for tufted deer
# To delete points smaller than certain distance
rawdata = read.csv(file.choose())
#rawdata = read.csv("F:/R/Analysis/phd/Data/tufteddeerdata_row_low_20180618.csv")
head(rawdata);tail(rawdata)
#rawdata$la_name = as.character(rawdata$la_name)
rawdata$la_name = as.character(rawdata$la_name)
#species = unique(as.character(rawdata$la_name))
species = unique(as.character(rawdata$la_name))

dir.save = 'H:/pheasant data/thinned/'
#thr = 7500 #threshold 
thr = 7500
for (i in 1:length(species)){
  #i=1
  temp = rawdata[rawdata$la_name==species[i],] #certain species
  loop = T
  while(loop){
    n_points = nrow(temp)
    XY = temp[,5:6] # find the XY to calculate distance between points in certain species
    distance =  as.matrix( dist(XY)) #distance matrix
    smaller = (distance <= thr) # whether smaller than certain distance
    n_tooclose = colSums(smaller) - 1 # number of points with distance smaller than thr
    loop = (sum(n_tooclose)!=0)
    pointtodelete = as.numeric(which.max(n_tooclose)[1]) # delete the one with most point nearby
    temp = temp[-pointtodelete,]
  }
  write.csv(temp,paste0(dir.save,species[i],'.csv'),row.names = F)
}
