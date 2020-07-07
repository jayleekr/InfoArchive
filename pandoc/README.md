# Readme.md
|Author|Jay Lee|
|-|-|
|Last Edit|2020.02.27|
|E-Mail|jayleekr0125@gmail.com|

## Pandoc?

universal markup converter!

다양한 문서 형식을 다른 문서형식으로 전환가능합니다..
아래는 지원하는 문서 양식을 나열합니다.(from -> to)
 
    It can convert from

    commonmark (CommonMark Markdown)
    creole (Creole 1.0)
    csv (CSV table)
    docbook (DocBook)
    docx (Word docx)
    dokuwiki (DokuWiki markup)
    epub (EPUB)
    fb2 (FictionBook2 e-book)
    gfm (GitHub-Flavored Markdown), or the deprecated and less accurate markdown_github; use markdown_github only if you need extensions not supported in gfm.
    haddock (Haddock markup)
    html (HTML)
    ipynb (Jupyter notebook)/fon
    jats (JATS XML)
    jira (Jira wiki markup)
    json (JSON version of native AST)
    latex (LaTeX)
    markdown (Pandoc’s Markdown)
    markdown_mmd (MultiMarkdown)
    markdown_phpextra (PHP Markdown Extra)
    markdown_strict (original unextended Markdown)
    mediawiki (MediaWiki markup)
    man (roff man)
    muse (Muse)
    native (native Haskell)
    odt (ODT)
    opml (OPML)
    org (Emacs Org mode)
    rst (reStructuredText)
    t2t (txt2tags)
    textile (Textile)
    tikiwiki (TikiWiki markup)
    twiki (TWiki markup)
    vimwiki (Vimwiki)
    It can convert to

    asciidoc (AsciiDoc) or asciidoctor (AsciiDoctor)
    beamer (LaTeX beamer slide show)
    commonmark (CommonMark Markdown)
    context (ConTeXt)
    docbook or docbook4 (DocBook 4)
    docbook5 (DocBook 5)
    docx (Word docx)
    dokuwiki (DokuWiki markup)
    epub or epub3 (EPUB v3 book)
    epub2 (EPUB v2)
    fb2 (FictionBook2 e-book)
    gfm (GitHub-Flavored Markdown), or the deprecated and less accurate markdown_github; use markdown_github only if you need extensions not supported in gfm.
    haddock (Haddock markup)
    html or html5 (HTML, i.e. HTML5/XHTML polyglot markup)
    html4 (XHTML 1.0 Transitional)
    icml (InDesign ICML)
    ipynb (Jupyter notebook)
    jats_archiving (JATS XML, Archiving and Interchange Tag Set)
    jats_articleauthoring (JATS XML, Article Authoring Tag Set)
    jats_publishing (JATS XML, Journal Publishing Tag Set)
    jats (alias for jats_archiving)
    jira (Jira wiki markup)
    json (JSON version of native AST)
    latex (LaTeX)
    man (roff man)
    markdown (Pandoc’s Markdown)
    markdown_mmd (MultiMarkdown)
    markdown_phpextra (PHP Markdown Extra)
    markdown_strict (original unextended Markdown)
    mediawiki (MediaWiki markup)
    ms (roff ms)
    muse (Muse),
    native (native Haskell),
    odt (OpenOffice text document)
    opml (OPML)
    opendocument (OpenDocument)
    org (Emacs Org mode)
    pdf (PDF)
    plain (plain text),
    pptx (PowerPoint slide show)
    rst (reStructuredText)
    rtf (Rich Text Format)
    texinfo (GNU Texinfo)
    textile (Textile)
    slideous (Slideous HTML and JavaScript slide show)
    slidy (Slidy HTML and JavaScript slide show)
    dzslides (DZSlides HTML5 + JavaScript slide show),
    revealjs (reveal.js HTML5 + JavaScript slide show)
    s5 (S5 HTML and JavaScript slide show)
    tei (TEI Simple)
    xwiki (XWiki markup)
    zimwiki (ZimWiki markup)
    the path of a custom Lua writer, see Custom writers below
    
## Use Case

예시 : 
> pandoc -o output.docx -f markdown -t docx General.md


## Options

    pandoc.exe [OPTIONS] [FILES]
    -f FORMAT, -r FORMAT  --from=FORMAT, --read=FORMAT                    
    -t FORMAT, -w FORMAT  --to=FORMAT, --write=FORMAT                     
    -o FILE               --output=FILE                                   
                            --data-dir=DIRECTORY                            
    -M KEY[:VALUE]        --metadata=KEY[:VALUE]                          
                            --metadata-file=FILE                            
    -d FILE               --defaults=FILE                                 
                            --file-scope                                    
    -s                    --standalone                                    
                            --template=FILE                                 
    -V KEY[:VALUE]        --variable=KEY[:VALUE]                          
                            --wrap=auto|none|preserve                       
                            --ascii                                         
                            --toc, --table-of-contents                      
                            --toc-depth=NUMBER                              
    -N                    --number-sections                               
                            --number-offset=NUMBERS                         
                            --top-level-division=section|chapter|part       
                            --extract-media=PATH                            
                            --resource-path=SEARCHPATH                      
    -H FILE               --include-in-header=FILE                        
    -B FILE               --include-before-body=FILE                      
    -A FILE               --include-after-body=FILE                       
                            --no-highlight                                  
                            --highlight-style=STYLE|FILE                    
                            --syntax-definition=FILE                        
                            --dpi=NUMBER                                    
                            --eol=crlf|lf|native                            
                            --columns=NUMBER                                
    -p                    --preserve-tabs                                 
                            --tab-stop=NUMBER                               
                            --pdf-engine=PROGRAM                            
                            --pdf-engine-opt=STRING                         
                            --reference-doc=FILE                            
                            --self-contained                                
                            --request-header=NAME:VALUE                     
                            --abbreviations=FILE                            
                            --indented-code-classes=STRING                  
                            --default-image-extension=extension             
    -F PROGRAM            --filter=PROGRAM                                
    -L SCRIPTPATH         --lua-filter=SCRIPTPATH                         
                            --shift-heading-level-by=NUMBER                 
                            --base-header-level=NUMBER                      
                            --strip-empty-paragraphs                        
                            --track-changes=accept|reject|all               
                            --strip-comments                                
                            --reference-links                               
                            --reference-location=block|section|document     
                            --atx-headers                                   
                            --listings                                      
    -i                    --incremental                                   
                            --slide-level=NUMBER                            
                            --section-divs                                  
                            --html-q-tags                                   
                            --email-obfuscation=none|javascript|references  
                            --id-prefix=STRING                              
    -T STRING             --title-prefix=STRING                           
    -c URL                --css=URL                                       
                            --epub-subdirectory=DIRNAME                     
                            --epub-cover-image=FILE                         
                            --epub-metadata=FILE                            
                            --epub-embed-font=FILE                          
                            --epub-chapter-level=NUMBER                     
                            --ipynb-output=all|none|best                    
                            --bibliography=FILE                             
                            --csl=FILE                                      
                            --citation-abbreviations=FILE                   
                            --natbib                                        
                            --biblatex                                      
                            --mathml                                        
                            --webtex[=URL]                                  
                            --mathjax[=URL]                                 
                            --katex[=URL]                                   
                            --gladtex                                       
                            --trace                                         
                            --dump-args                                     
                            --ignore-args                                   
                            --verbose                                       
                            --quiet                                         
                            --fail-if-warnings                              
                            --log=FILE                                      
                            --bash-completion                               
                            --list-input-formats                            
                            --list-output-formats                           
                            --list-extensions[=FORMAT]                      
                            --list-highlight-languages                      
                            --list-highlight-styles                         
    -D FORMAT             --print-default-template=FORMAT                 
                            --print-default-data-file=FILE                  
                            --print-highlight-style=STYLE|FILE              
    -v                    --version                                       
    -h                    --help                                          

## Pandoc on Docker

구글링 하다가 [여기](https://madforfamily.com/post/markdown%EA%B3%BC-pandoc-%EA%B0%96%EA%B3%A0-%EB%86%80%EA%B8%B0-pdf.html)에서 발견했습니다.. :(

사실 그냥 md -> docx 로 해도 충분하긴합니다만.. 하다보니 몇가지 변환이 잘되지 않는것을 발견했습니다.

그래서 pdf변환을 하려고 하다보니 latex 관련 프로그램을 추가로 설치해야 했죠.
이럴꺼면 docker에 올라와있는건 없을까? 하고 뒤져보니.. 역시 God Docker...
위 링크처럼 docker pull 만 하고나면 그다지 세팅할게 없습니다. (이거 때문에 choco도 깔았는데..)

아래와 처럼 thomasweise/docker-pandoc image가 정상적으로 설치되었다고 가정하겠습니다.
```
REPOSITORY                   TAG                 IMAGE ID            CREATED             SIZE
thomasweise/docker-pandoc    latest              503296836b3f        3 days ago          3.4GB
```

이제 docker run을 하면됩니다.
```

docker run -it --rm -v "$(pwd):/notes" thomasweise/docker-pandoc /bin/bash -c "cd /notes && find . -type f -name '*.md' -print0 | xargs -0 -n2 -P2 -I{} pandoc {} --pdf-engine=xelatex -f markdown -o {}.pdf"

docker run -it --rm -v "$(pwd):/notes" thomasweise/docker-pandoc /bin/bash -c "apt-get update && apt-get install -y fonts-nanum; cd /notes; find . -type f -name '*.md' -print0 | xargs -0 -n2 -P2 -I{} pandoc {} -V mainfont='NanumMyeongjo' -V sansfont='NanumGothic' -V monofont='NanumGothoc' --pdf-engine=xelatex -f markdown -o {}.pdf"
```


## 참고자료
- Docker Hub
https://gitlab.com/pointbre/all-in-one-pandoc/-/blob/master/Dockerfile
- HTTPS 관련
https://madforfamily.com/post/caddy%EB%A1%9C-%EB%AC%B4%EB%A3%8C-https-%EC%9A%B4%EC%98%81%ED%95%98%EA%B8%B0.html


## Jira(Confluence) 변환
Markdown(github favored markdown) -> Jira
```
$ pandoc -f gfm -t jira -o out.txt input.md 
```

out.txt에 있는 text를 업로드하면 되니다.

