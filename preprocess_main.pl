#!/usr/bin/perl

#There has to be a better way to do this, but perl is the best way I know

$headflag=0;
while(<>){
    last if /^\\section\{Abstract}/;
}

print "\\input{../headers/maininc.tex}\n";
print "\\section\{Abstract}\n";

$inbib=0;
while(<>) {
    #ugly, can't figure out how to match "sub" 0 or more times elegantly, didn't work when I tried to nest the subpattern    
    s/\\(.*)section\{/\\\1section\*\{/;
    s/\\symbol\{34\}/\\textquotedbl\{\}/g;
    s/^\$\\text\{\s\}\$\\newline\{\}//;

    if(m/^\\section\*\{Introduction\}/) {
	print "\\begin{multicols}{2}\n";
	print "\\receivedpublished\n";
    }

    if(m/\\subsection\*\{References\}/) {
	print("\\end{multicols}\n");
	$inbib=1;
    }

    print;

    if($inbib && m/\\end\{myenumerate\}/) {
	print("\\end\{document\}\n");
	last;
    }
}
