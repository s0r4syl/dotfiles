#!/usr/bin/env perl

$latex 		= 'uplatex -sysctex=1 -halt-on-error -interaction=tatchmode';
#$latex_silent	= 'uplatex -synctex=1 -halt-on-error -interaction=batchmode';
$bibtex 	= 'upbibtex';

$dvipdf 	= 'dvipdfmx %O -o %D %S';

## Compile Option
$max_repeat 	= 10;
# Create .pdf from .dvi
$pdf_mode 	= 3;
# Not create tmp file
$pre_view_file_via_temporary = 0;
$pdf_previewer 	= "evince";
