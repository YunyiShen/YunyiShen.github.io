###Verbruggen H.'s thinner
 VHthinner<- function(kerRaster=NULL,record=NULL,savedir=NULL,thr1=0,thr2=1,prob=0.5,nfinal=NA,omitNA=F,Xcol=1,Ycol=2){

require(raster)
if(class(kerRaster)!='RasterLayer'){
print('Please select the kernel density layer')
kerRaster=raster(file.choose())# choose the kernel density
}
   
if(class(record)!='data.frame' & class(record)!='character'){
print('Please select the record csv')
occuraw=read.csv(file.choose())# choose the record csv 
}
   
if(class(record)=='character'){
  occuraw=read.csv(record)
}

kerRaster=(kerRaster-min(getValues(kerRaster)))/(max(getValues(kerRaster))-min(getValues(kerRaster))) # min-max standardize 
occur=occuraw

occur$density=extract(kerRaster,occur[,c(Xcol,Ycol)])

if(omitNA){
  occur=na.omit(occur)
}

occur$density[is.na(occur$density)]=rep(0,length(occur$density[is.na(occur$density)])) 

autoinclude=occur[occur$density<thr1,] #automatically include

occur=occur[occur$density>thr1 & occur$density<thr2,] #random choose pool

nchoose=nfinal-nrow(autoinclude)

if(!is.na(nfinal)){
  prob=nchoose/nrow(occur)
}

nchoose = prob*nrow(occur)

#randomchose=occur[runif(min = 0,max=1,nrow(occur))<prob,]

entries = 1:nrow(occur)

randomchose = occur[sample(entries,nchoose),]

chosepoints=rbind(autoinclude,randomchose)

if(class(savedir)!='character'){

print('Please select the direction and type its name with extension to save the results')

write.csv(chosepoints,file.choose())
}
else{
  write.csv(chosepoints,savedir)
}


}