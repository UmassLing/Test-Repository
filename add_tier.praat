#### ADD_TIER.PRAAT
#### Time-stamp: <2013-12-20 21:01:06 amoebe>
#### Author: Kristine Yu <krisyu@ucla.edu>
#### Edited by mfrelinger on 2016-9-9, fixed tier_add functionality
#### PURPOSE: This adds tier to all TextGrids in directory
#### INPUT: Directory of textgrids
#### OUTPUT: Overwrites original TextGrids with additional tier as last tier

## This script loops over specified files in a directory and creates textgrids with voiced and unvoiced intervals labeled.

# User input: directory for files to be looped over
#######SEE 'add specified tier' BELOW FOR SELECTING POINT OR INTERVAL TIER
form Select directory and file type
	sentence Directory C:\Users\Matt\Samoan\mf\sent\f1\
        integer Tier_add 6
        sentence Tier_name english
        sentence Extension TextGrid

endform

# Set up file list to be looped over
Create Strings as file list... list 'directory$'*.'extension$'
number_of_files = Get number of strings

# Loop over files to create text grids with labeled voiced/unvoiced intervals
for i_file to number_of_files
  select Strings list
  current$ = Get string... i_file
  Read from file... 'directory$''current$'
  short$ = selected$ ("TextGrid")

# Add specified tier
      select TextGrid 'short$'
      Insert interval tier... 'Tier_add' 'tier_name$'
#      Insert point tier... 'Tier_add' 'tier_name$'

# Save modified text grid file
      Write to text file... 'directory$''short$'.TextGrid
  endif   
# Clean up
  select all
  minus Strings list
  Remove
endfor

select Strings list
Remove
clearinfo
echo Yay! add_tier.praat done. 'number_of_files' had Tier 'tier_name$' added in 'directory$'.
