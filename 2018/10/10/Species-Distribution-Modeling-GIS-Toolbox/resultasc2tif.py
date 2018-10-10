import sys, string, os, csv
  
dir = 'G:\\pheasant\\1.maxent\\3.results\\1km all data'  
  
# Import arcpy module  
import arcpy  
  
files = os.listdir(dir)
c = open("G:\\pheasant\\1.maxent\\3.results\\1km all tif renamed\\1.species.csv","w")
#writer = csv.writer(open('E:\\pheasant\\1.maxent\\3.results\\1km all tif renamed\\1.species.txt', 'w'), delimiter=' ', quotechar='|', quoting=csv.QUOTE_MINIMAL)
#writer = csv.writer(open('E:\\1.species.txt', 'w'), delimiter=' ', quotechar='|', quoting=csv.QUOTE_MINIMAL)

ww=1
for f in files:  
    if os.path.splitext(f)[1] == '.asc':  
        # Script arguments...  
        Input_raster_file = dir + os.sep + f  
  
        # Local variables...  
        Output_data_type = "TIFF"  
        Raster_Format = "ASCII"  
        Output_Workspace = "G:\\pheasant\\1.maxent\\3.results\\1km all tif renamed"  
  
        # =============== file name process ======================  
        basename = os.path.splitext(f)[0];
        Output_raster = Output_Workspace + os.sep + str(ww) + ".tif";  
        
        if os.path.exists(Output_raster) == False:  
            print Input_raster_file  
            # Process: Raster To Other Format (multiple)...  
            arcpy.ASCIIToRaster_conversion(Input_raster_file,   
                        Output_raster,"FLOAT")
            c.write(f+'\n')
            c.flush()
            ww=ww+1
            print Output_raster 
