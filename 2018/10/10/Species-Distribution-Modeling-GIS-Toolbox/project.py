import arcpy  
arcpy.CheckOutExtension("spatial")
arcpy.gp.overwriteOutput=1  
arcpy.env.workspace = "H:\\LGM BIOCLOM\\China"   # path for all rasters to be deal with
rasters = arcpy.ListRasters("*", "tif")  
ref= "H:\\rasters\\dem1.tif" # reference of projection system
spref=arcpy.Describe(ref).SpatialReference
for raster in rasters:
    print(raster)  
    out= "H:\\LGM BIOCLOM\\China\\proj\\"+raster  # out put path
    arcpy.ProjectRaster_management(raster, out, ref)  
    print(raster+"  has done")  
print("All done")  
     
     
