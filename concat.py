# Python script to append all files of the form 'cv-*.png' 
# vertically into 1 png named 'cv.png'.

import glob
import os

# Get all files of the form 'cv-*.png'.
# http://regexr.com/
blocks = glob.glob('cv-*.png')
#print ' '.join(blocks)
os.system("convert -append " + ' '.join(blocks) + " cv.png")