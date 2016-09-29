#### DUPLICATE-TIER.PRAAT
#### Time-stamp: <2014-09-27 12:48:01 amoebe>
#### Author: Kristine Yu <krisyu@ucla.edu>
#### PURPOSE: This duplicates a specified tier to a specified new position and clears the new tier of all text
#### INPUT: Directory of textgrids
#### OUTPUT: Overwrites original TextGrids with additional tier as last tier

## This script loops over specified files in a directory and creates textgrids with voiced and unvoiced intervals labeled.

# User input: directory for files to be looped over
form Select directory and file type
	sentence Directory C:\Users\Matt\Google Drive\mf\sent\f1\
        sentence Extension TextGrid
        integer Tier_to_duplicate 2
        integer Tier_new 3
        sentence Tier_new_name IU

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

# Duplicate tier 3 (syllable tier) and clear text
  select TextGrid 'short$'
  Duplicate tier... tier_to_duplicate tier_new 'tier_new_name$'

  num_intervals = Get number of intervals... tier_new
  for interval from 1 to num_intervals
      Set interval text... tier_new interval
  endfor

# Remove first two boundaries in the new tier (this is to get rid of the na boundaries)
#  Remove left boundary... tier_new 2
#  Remove left boundary... tier_new 2
  

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
