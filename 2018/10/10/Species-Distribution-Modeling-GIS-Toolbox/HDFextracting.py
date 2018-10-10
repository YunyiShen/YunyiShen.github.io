import arcpy  
arcpy.CheckOutExtension("spatial")
arcpy.gp.overwriteOutput=1  
arcpy.env.workspace = "G:\\migration\\landuse\\2001"  
raster_sets = arcpy.ListRasters("*", "hdf")  
#ref= "G:\\pheasant\\1.maxent\\2.rasters\\LIM\\TIF\\dem1.tif"
#spref=arcpy.Describe(ref).SpatialReference
for raster_set in raster_sets:
    print(raster_set)  
    out= "G:\\migration\\landuse\\2001\\"+raster_set+'.tif' 
    #arcpy.ProjectRaster_management(raster, out, ref)
    arcpy.ExtractSubDataset_management (raster_set, out , '1')
    print(raster_set+"  has done")  
print("All done")  
     
     
