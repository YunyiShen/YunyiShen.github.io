import arcpy  
arcpy.CheckOutExtension("spatial")
arcpy.gp.overwriteOutput = 1  
arcpy.env.workspace = "D:\\syy2017 seed & bear distribution\\bear distribution data&models\\0.11full result\\5.management units\\zz.shp man"  
#masks = arcpy.ListFiles("*", "shp")
#masks = arcpy.ListFiles()
masks = arcpy.ListFeatureClasses()
print(masks)
raster= "D:\\syy2017 seed & bear distribution\\bear distribution data&models\\0.11full result\\3.final result\\thr0.1581 Lpass 0.5.tif"
i=0
for mask in masks:
    i=i+1
    print(mask)  
    #out= "D:\\syy2017 seed & bear distribution\\bear distribution data&models\\0.11full result\\5.management units\\a.rasters\\"+str( mask)+".tif"
    out= "E:\\"+ str(i) +".tif" 
    arcpy.gp.ExtractByMask_sa(raster, mask, out)  
    #print("ma_"+str(i)+"  has done")
    print(mask + "has done")
print("All done")  
     
     
