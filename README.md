# Proposed wikimedia2latex-based script for automatically generated WikiJournal preprints

## Install
Use the following to install wikimedia2latex on a linux machine (this won't work on Mac). NOTE: You generally need a machine with 8GB of RAM, you can get opaque problems like "process killed" with haskell otherwise.

```
sudo apt-get update
sudo apt-get install -y \
 cabal-install calibre cm-super-minimal djvulibre-bin \
 fonts-cmu fonts-freefont-ttf fonts-wqy-zenhei \
 ghc ghostscript git \
 imagemagick keyboard-configuration \
 latex-cjk-common latex2rtf \
 libghc-blaze-html-dev libghc-directory-tree-dev libghc-file-embed-dev \
 libghc-happstack-server-dev libghc-highlighting-kate-dev \
 libghc-http-conduit-dev libghc-http-dev libghc-hxt-dev \
 libghc-hxt-http-dev libghc-network-uri-dev libghc-pem-dev \
 libghc-regex-compat-dev libghc-regex-pcre-dev libghc-split-dev \
 libghc-strict-dev libghc-tagsoup-dev libghc-temporary-dev \
 libghc-url-dev libghc-utf8-string-dev libghc-utility-ht-dev \
 libghc-word8-dev libghc-x509-dev libghc-zip-archive-dev \
 libreoffice \
 librsvg2-bin lmodern make mediawiki2latex poppler-utils \
 texlive-fonts-extra texlive-fonts-recommended texlive-lang-all \
 texlive-latex-extra texlive-latex-recommended texlive-plain-generic \
 texlive-xetex \
 tzdata
git clone https://git.code.sf.net/p/wb2pdf/git wb2pdf-git
make -C wb2pdf-git
make -C wb2pdf-git install
```

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

## TODO
Font paths needs to be fixed to not be ubuntu specific, I think it will then be possible to compile the latex source on mac.
