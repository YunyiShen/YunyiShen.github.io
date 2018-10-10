import arcpy  
arcpy.CheckOutExtension("spatial")
arcpy.gp.overwriteOutput = 1  
arcpy.env.workspace = "H:\\LGM BIOCLOM"  
rasters = arcpy.ListRasters("*", "tif")  # rasters to be split
mask= "H:\\China border\\China.shp" # the mask
#i=0
for raster in rasters:
    #i=i+1
    print(raster)  
    out= "H:\\LGM BIOCLOM\\China\\"+raster  
    arcpy.gp.ExtractByMask_sa(raster, mask, out)  
    #print("ma_"+str(i)+"  has done")
    print(raster + "has done")
print("All done")  
     
     
