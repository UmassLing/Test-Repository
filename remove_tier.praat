#### REMOVE_TIER.PRAAT
#### Date: <9-9-2016>
#### Author: Matthew Frelinger, code modified from add_tier.praat by Kristine Yu <krisyu@ucla.edu>
#### PURPOSE: This removes a specified tier from all TextGrids in directory
#### INPUT: Directory of textgrids
#### OUTPUT: Overwrites original TextGrids after removing specified tier



# User input: directory for files to be looped over, tier to be deleted
form Select directory and file type
	sentence Directory C:\Users\Matt\Samoan\mf\sent\f2\
        integer Tier_del 1
        sentence Extension TextGrid

endform

# Set up file list to be looped over
Create Strings as file list... list 'directory$'*.'extension$'
number_of_files = Get number of strings

# Loop over files 
for i_file to number_of_files
  select Strings list
  current$ = Get string... i_file
  Read from file... 'directory$''current$'
  short$ = selected$ ("TextGrid")

# Remove specified tier
	select TextGrid 'short$'
	Remove tier... 'Tier_del'

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
echo Yay! remove_tier.praat done. 'number_of_files' files had Tier 'tier_del' deleted in 'directory$'.
