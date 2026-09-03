# latexmkrc (or .latexmkrc)

# ===== Engine =====
$latex = 'lualatex -interaction=nonstopmode -file-line-error -synctex=1 %O %S';
$pdflatex = $latex;

# ===== Output directory =====
$out_dir = 'out';

# ===== Continuous preview with zathura =====
$pdf_previewer = 'zathura';
$pdf_previewer_options = '-x "nvr --remote-silent +%{line} %{input}"';

# ===== Misc =====
$recorder = 1; 
$max_repeat = 5;

