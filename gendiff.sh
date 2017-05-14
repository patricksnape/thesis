rm -fr /tmp/diff
mkdir /tmp/diff

latexdiff --flatten $1/thesis.tex $1/thesis.tex > /tmp/diff/orig.tex
latexdiff --flatten $2/thesis.tex $2/thesis.tex > /tmp/diff/new.tex

rsync -r $1/ /tmp/diff/
rsync -ar $2/ /tmp/diff/
latexdiff --flatten /tmp/diff/orig.tex /tmp/diff/new.tex > /tmp/diff/diff.tex

cd /tmp/diff
pdflatex diff.tex
bibtex diff.aux
pdflatex diff.tex
pdflatex diff.tex
