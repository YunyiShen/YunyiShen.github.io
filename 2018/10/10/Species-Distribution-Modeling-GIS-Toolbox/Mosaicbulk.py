####Mosaic
import arcpy
import numpy as np
arcpy.CheckOutExtension("spatial")
arcpy.gp.overwriteOutput=1
years = 2001 + np.arange(16)
#years = [2001]


arcpy.CheckOutExtension("spatial")
arcpy.gp.overwriteOutput=1
years = 2002 + np.arange(16)

for year in years:
    year_str = str(year)
    print (year_str + " data start")
    arcpy.env.workspace = "G:\\migration\\landuse\\" + year_str  # change the direction here, if it is not sort by year, also change it
    rasters = arcpy.ListRasters("*hdf_IGBP*", "tif") # change the key words in the file names
    #print rasters
    base = rasters[0]
    out_coor_system = arcpy.Describe(base).spatialReference 
    dataType = arcpy.Describe(base).DataType   
    piexl_type = arcpy.Describe(base).pixelType   
    cellwidth = arcpy.Describe(base).meanCellWidth  
    bandcount = arcpy.Describe(base).bandCount 
    print out_coor_system.name
    out_dir= r"G:\\migration\\landuse\\world wide IGBP" # out put direction
    name = "MCD12Q1_IGBP_"+year_str+'_world.tif' # out put file name
    arcpy.MosaicToNewRaster_management (rasters, out_dir, name, out_coor_system, "8_BIT_UNSIGNED", cellwidth, bandcount, "LAST", "FIRST")  
    print(year_str + " All done")
print("All Done!")
     
     

     
     
