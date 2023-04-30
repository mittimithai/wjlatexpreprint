# Proposed wikimedia2latex-based script for automatically generated WikiJournal preprints

## Install
Use the following to install wikimedia2latex on a linux machine (this won't work on Mac). NOTE: You generally need a machine with 8GB of RAM, you can get opaque problems like "process killed" with haskell otherwise.

	apt-get update
	apt-get install -y tzdata keyboard-configuration make
	apt-get install -y ghc libghc-x509-dev libghc-pem-dev
	apt-get install -y libghc-regex-compat-dev libghc-http-dev cabal-install libghc-hxt-dev
	apt-get install -y libghc-split-dev libghc-blaze-html-dev libghc-file-embed-dev
	apt-get install -y libghc-highlighting-kate-dev  libghc-hxt-http-dev libghc-regex-pcre-dev
	apt-get install -y libghc-temporary-dev libghc-url-dev libghc-utf8-string-dev
	apt-get install -y libghc-utility-ht-dev libghc-http-conduit-dev libghc-happstack-server-dev
	apt-get install -y libghc-directory-tree-dev libghc-zip-archive-dev libghc-strict-dev
	apt-get install -y libghc-network-uri-dev libghc-tagsoup-dev libghc-word8-dev
	apt-get install -y ghostscript calibre latex2rtf libreoffice git
	apt-get install -y librsvg2-bin imagemagick
	apt-get install -y  fonts-freefont-ttf texlive-xetex texlive-latex-recommended
	apt-get install -y  texlive-latex-extra texlive-fonts-recommended texlive-fonts-extra
	apt-get install -y  cm-super-minimal texlive-lang-all poppler-utils
	apt-get install -y  lmodern texlive-plain-generic latex-cjk-common
	apt-get install -y  fonts-cmu fonts-wqy-zenhei
	apt-get install -y  djvulibre-bin
	apt-get install -y mediawiki2latex tzdata
	apt-get install -y make
	git clone https://git.code.sf.net/p/wb2pdf/git wb2pdf-git
	make -C wb2pdf-git
	make -C wb2pdf-git install

`wikimedia2latex` should be in your path now.

## Usage Example
To generate the initial copy, make a directory that you will work in:

	mkdir preprint
	cd preprint

Assuming you are now in that directory, copy the `wjheaders` into that directory:

	cp -r /path/to/wjlatexpreprint/wjheaders .
	
Then call mediawiki2latex:
	
	mediawiki2latex --url=https://en.wikiversity.org/wiki/WikiJournal_of_Medicine/Alternative_androgens_pathways --headers=wjheaders --output=doc --copy=preprint_latex

Further edits to latex (figure placement etc.) can be made inside `preprint_latex`.  Preprocess the latex output with:

	cd preprint_latex/document/main
	perl /path/to/wjlatexpreprint/preprocess_main.pl < main.tex > main_processed.tex

Edit the values in `commands.tex`, (look for "FILL THESE IN FOR EACH PREPRINT").
You can compile the latex by going inside main and the running latex, you need xelatex:

	xelatex main_processed.tex

`main_processed.pdf` should be there now. The last things to do are to fix up the `\includegraphics` for figures and put them on separate pages if they are big, use this as a template:

	\begin{minipage}{1.0\columnwidth}
	\begin{center}
	\includegraphics[width=1.0\textwidth,height=6.5in,keepaspectratio]{../images/1.\SVGExtension}
	\end{center}
	\raggedright{}\myfigurewithcaption{A caption}
	\end{minipage}

Watch for `\item{} \newline` in the Reference sections that come from URL cites, just delete the newline.

## TODO
Font paths needs to be fixed to not be ubuntu specific, I think it will then be possible to compile the latex source on mac.
