require(raster)
setwd('H:/rasters')
file = list.files(pattern = '.tif$')

dirsave = 'H:/rasters/asc/' # save direction 

templ = raster(file[1])
tempres = templ
res(tempres) = 10000 # chage resolution here

templ = resample(templ,tempres) 
plot(templ)

rm(tempres)

for (i in 1 : length(file)){
  temp = raster(file[i])
  #filenum = substr(file[i],start = 8,stop = nchar(file[i]))
  #dir = paste0(dirsave,'CHELSA_bio_',filenum)
  
  dir = paste0(dirsave,filenamet,'.asc') # file name of the output file
  print(dir)
  temp = resample(temp , templ , filename = dir) # add method = "ngb" for factor layers
   
}
