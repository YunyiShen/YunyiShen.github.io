import sys, string, os
  
dir = 'G:\\pheasant\\jinji\\White\\TIF'  
  
# Import arcpy module  
import arcpy  
  
files = os.listdir(dir)  
for f in files:  
    if os.path.splitext(f)[1] == '.tif':  
        # Script arguments...  
        Input_raster_file = dir + os.sep + f  
  
        # Local variables...  
        Output_data_type = "TIFF"  
        Raster_Format = "ASCII"  
        Output_Workspace = "G:\\pheasant\\jinji\\White\\asc"  
  
        # =============== file name process ======================  
        basename = os.path.splitext(f)[0];  
        Output_raster = Output_Workspace + os.sep + f + ".asc";  
  
        if os.path.exists(Output_raster) == False:  
            print Input_raster_file  
            # Process: Raster To Other Format (multiple)...  
            arcpy.RasterToASCII_conversion(Input_raster_file,   
                        Output_raster)  
  
            print Output_raster 
