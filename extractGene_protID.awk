#!/bin/awk -f
{
  for (i=1; i<=NF; ++i) {  # Loop through each field
    if ($i ~ /^protein_id=[^ ]+/) {  # Check if field starts with "protein_id_" followed by non-space characters
      protein_id = $i        # Store the entire protein_id field value (including prefix)
      break;                  # Exit the loop once found
    } 
    }
  for (j=1; j<=NF; ++j) {  # Loop through each field
    if ($j ~ /^gene=[^ ]+/) {  # Check if field starts with "protein_id_" followed by non-space characters
      gene_id = $j        # Store the entire protein_id field value (including prefix)
      break;                  # Exit the loop once found
    } 
    }
  print $1, $4, $5, $7, gene_id, protein_id  # Print desired columns and the protein_id field
  gene_id = ""                        # Reset gene_id variable for next row
  protein_id = ""                     # Reset protein_id variable for next row
}
