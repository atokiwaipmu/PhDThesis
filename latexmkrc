# .latexmkrc

# Set the default compiler to LuaLaTeX
$pdflatex = 'lualatex -interaction=nonstopmode -synctex=1 %O %S';

# Ensure that bibtex or biber is run appropriately
$bibtex_use = 2; # Use biber if using biblatex with biber backend

# Clean auxiliary files after compilation
push @clean_ext, 'aux', 'bbl', 'bcf', 'blg', 'log', 'out', 'toc', 'fdb_latexmk', 'run.xml', 'synctex.gz';
