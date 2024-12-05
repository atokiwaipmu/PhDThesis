% ipmu.cls - Custom Thesis Class
% Refactored on 2024/10/29
% Based on the 'report' class with additional customizations for a thesis.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ipmu}[2024/10/29 Custom Thesis Class]

% ============================================================================
%                             CLASS OPTIONS
% ============================================================================
% Pass all unknown options to the base class 'report'.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}

% Process all options.
\ProcessOptions\relax

% ============================================================================
%                             BASE CLASS
% ============================================================================
% Load the base 'report' class with the passed options.
\LoadClass[a4paper,11pt,twoside]{report} % Added twoside option

% ============================================================================
%                             PACKAGES
% ============================================================================
% Load fontspec for font selection (requires XeLaTeX or LuaLaTeX)
\RequirePackage{fontspec}

% Load polyglossia for multilingual support
\RequirePackage{polyglossia}
\setmainlanguage{english}
\setotherlanguage{japanese}

% Load additional required packages
\RequirePackage{natbib}     % For bibliography management
\RequirePackage{caption}    % Better control of figure captions
\RequirePackage{subcaption} % Support for subfigures
\RequirePackage{aas_macros} % AAS journal macros
\RequirePackage{rotating}   % Support for rotating figures
\RequirePackage{booktabs}  % Professional tables
\RequirePackage{enumitem}  % Customize lists
\RequirePackage{comment}   % Comment environment
\RequirePackage{geometry}          % For page layout
\RequirePackage{graphicx}          % For including graphics
\RequirePackage{amsmath, amssymb}  % For mathematical symbols and environments
\RequirePackage{setspace}          % For setting line spacing
\RequirePackage{titlesec}          % For customizing section titles
\RequirePackage{fancyhdr}          % For header and footer customization
\RequirePackage{unicode-math}      % For Unicode math fonts
\RequirePackage{lipsum} % For dummy text (optional)
\RequirePackage{hyperref}
\hypersetup{
    linktoc=page,        % ページ番号にリンク
    colorlinks=true,     % カラーリンクを有効化
    linkcolor=blue,      % 内部リンク
    citecolor=blue,      % 引用リンク
    filecolor=blue,      % ファイルリンク
    urlcolor=blue        % URLリンク
}
\RequirePackage{minitoc}
\setcounter{tocdepth}{3}
\setcounter{minitocdepth}{1}
\AtBeginDocument{\dominitoc} 

% Set main font (you can change this to your preferred font)
\setmainfont{Times New Roman} % Example for English text

% Set Japanese font (ensure this font is installed on Overleaf)
\newfontfamily\japanesefont{Noto Sans JP} % Example font; adjust as needed

% --- Additional Packages for Enhanced Headers and Footers ---

\RequirePackage{xcolor}            % For color customization
\RequirePackage{fontawesome}       % Optional: For adding icons (ensure it's installed)
\RequirePackage{sectsty}           % Optional: For section font styles
\RequirePackage{tikz}              % Optional: For advanced decorative elements

% --- Optional: Customize Section Fonts ---
\allsectionsfont{\sffamily}                   % Set all section fonts to sans-serif (adjust as needed)

% ============================================================================
%                             PAGE LAYOUT
% ============================================================================
% Set up geometry if not already set by class options.
% Note: 'a4paper' and 'margin=2.5cm' can be overridden via class options.
\geometry{
    paper=a4paper,
    twoside,
    margin=2.5cm,
    bindingoffset=0.5cm  % Add space for binding
}

% --- Define frontmatter command ---
\newcommand{\frontmatter}{
    \pagenumbering{roman}    % i, ii, iii, ...
    \pagestyle{plain}        % Only page numbers, no headers
    \setcounter{page}{1}     % Start from page i
}

% --- Define mainmatter command if not already defined ---
\newcommand{\mainmatter}{
    \pagenumbering{arabic}   % 1, 2, 3, ...
    \setcounter{page}{1}     % Start from page 1
    \pagestyle{fancy}        % Use fancy headers
}

% --- Define backmatter command if needed ---
\newcommand{\backmatter}{
    \clearpage
    \pagestyle{plain}
}

% ============================================================================
%                             CUSTOM COMMANDS
% ============================================================================
% Define commands for thesis metadata.
\newcommand{\thesisTitle}{}
\newcommand{\thesisJapaneseTitle}{}
\newcommand{\thesisAuthorEnglish}{}
\newcommand{\thesisAuthorJapanese}{}

% Commands to set thesis metadata.
\newcommand{\setThesisTitle}[1]{\renewcommand{\thesisTitle}{#1}}
\newcommand{\setThesisJapaneseTitle}[1]{\renewcommand{\thesisJapaneseTitle}{#1}}
\newcommand{\setThesisAuthorEnglish}[1]{\renewcommand{\thesisAuthorEnglish}{#1}}
\newcommand{\setThesisAuthorJapanese}[1]{\renewcommand{\thesisAuthorJapanese}{#1}}


% ============================================================================
%                             TITLE PAGE
% ============================================================================
\newcommand{\makethesistitle}{
    \begin{titlepage}
        \centering
        \vspace*{1cm}
        
        % Dissertation Titles
        \textbf{\huge Doctoral Dissertation}\par
        \vspace{0.5cm}
        \textjapanese{\textbf{\huge 博士論文}}\par
        \vspace{2cm}
        
        % Thesis Titles from Commands within a constrained width
        {\huge \thesisTitle}\par
        \vspace{0.5cm}
        \textjapanese{{\large \thesisJapaneseTitle}}\par
        \vspace{2cm}
        
        % Submission Information
        A Dissertation Submitted for the Degree of Doctor of Philosophy\par
        \vspace{0.5cm}
        December 2024\par
        \textjapanese{令和６年１２月博士（理学）申請}\par
        \vspace{2cm}
        
        % Department and University
        Department of Physics, Graduate School of Science,\par
        \vspace{0.5cm}
        The University of Tokyo\par
        \vspace{0.5cm}
        \textjapanese{東京大学大学院理学系研究科}\par
        \textjapanese{物理学専攻}\par
        \vspace{2cm}
        
        % Author Information
        {\Large \thesisAuthorEnglish}\par
        \vspace{0.5cm}
        \textjapanese{\Large \thesisAuthorJapanese}\par
        
        \vfill
    \end{titlepage}
    \setcounter{footnote}{0}
}

% ============================================================================
%                             ABSTRACT PAGE
% ============================================================================
\newenvironment{abstractpage}{
    \begin{titlepage}
        \begin{center}
        \vspace*{1cm}
        
        % Abstract Header
        {\Large \textjapanese{論文の内容の要旨}}\par
        \vspace{1cm}
        
        % Thesis Titles within a constrained width
        {\Large \thesisTitle}\par
        \vspace{0.5cm}
        \textjapanese{\large \thesisJapaneseTitle}\par
        \vspace{1cm}
        
        % Author Information
        \textjapanese{氏名}\hspace{5em}\textjapanese{\thesisAuthorJapanese}\par
        \vspace{0.5cm}
        \end{center}
        
        % Abstract Content Placeholder
        \begin{spacing}{1.25}
            % User should input abstract text here.
} {%
        \end{spacing}
        \vfill
    \end{titlepage}
    \setcounter{footnote}{0}
}

% ============================================================================
%                             HEADER AND FOOTER
% ============================================================================
% --- Set Header Height ---
\setlength{\headheight}{23pt} % Adjust based on header content

% --- Fancyhdr Configuration ---
\pagestyle{fancy}
\fancyhf{} % Clear all default header and footer fields

% --- Header Configuration ---
\fancyhead[LO]{\leftmark} % Chapter on left of odd pages
\fancyhead[RE]{\rightmark} % Section on right of even pages

% --- Footer Configuration ---
% Center Footer (Both Even and Odd Pages)
\fancyfoot[C]{\thepage} % Page number 

% --- Decorative Lines ---
\renewcommand{\headrulewidth}{0.4pt} % Thickness of header line
\renewcommand{\headrule}{\hbox to\headwidth{%
    \leaders\hrule height \headrulewidth\hfill}} % Header line color
\renewcommand{\footrulewidth}{0pt} % No footer line

% ============================================================================
%                             SPACING
% ============================================================================
\setstretch{1.5} % Set line spacing to 1.5

% Redefine font size commands
\renewcommand{\normalsize}{\fontsize{11pt}{13pt}\selectfont}
\renewcommand{\small}{\fontsize{9pt}{11pt}\selectfont}
\renewcommand{\footnotesize}{\fontsize{8pt}{10pt}\selectfont}
\renewcommand{\large}{\fontsize{12pt}{14pt}\selectfont}
\renewcommand{\Large}{\fontsize{14pt}{16pt}\selectfont}
\renewcommand{\LARGE}{\fontsize{17pt}{19pt}\selectfont}
\renewcommand{\huge}{\fontsize{20pt}{22pt}\selectfont}
\renewcommand{\Huge}{\fontsize{25pt}{27pt}\selectfont}

% ============================================================================
%                             SECTION TITLES
% ============================================================================
% --- Custom Chapter Style ---
\titleformat{\chapter}[display]
  {\normalfont\huge\bfseries} % Format for the chapter title
  {%
    \hfill % Pushes "CHAPTER X" to the right
    \huge\textsc{Chapter} \thechapter % "CHAPTER" in small caps and chapter number
  }
  {1ex} % Space between label and title
  {%
    \titlerule[0.5pt] % Horizontal line
    \vspace{1ex} % Vertical space after the line
    \centering % Center the chapter title
  }
% Adjust spacing around chapter titles
\titlespacing*{\chapter}{0pt}{50pt}{40pt} % {left}{before}{after}

% --- Section and Subsection Titles ---
\titleformat{\section}
  {\normalfont\large\bfseries}
  {\thesection}{1em}{}

\titleformat{\subsection}
  {\normalfont\normalsize\bfseries}
  {\thesubsection}{1em}{}

% Include commands for mnras.bst compatibility
% ****************************************
% *    COMMANDS FOR USE WITH MNRAS.BST    *
% ****************************************

\def\@urlcharsother{%
  \let\do\@makeother 
  \do\\\do\$\do\&\do\#\do\^\do\_\do\%\do\~}

\def\doi{\begingroup
  \@urlcharsother
  \@ifnextchar[%
    {\@doi}
    {\@doi[]}}
\def\@doi[#1]#2{%
  \def\@tempa{#1}%
  \ifx\@tempa\@empty
    \href{http://dx.doi.org/#2}{doi:#2}%
  \else
    \href{http://dx.doi.org/#2}{#1}%
  \fi
  \endgroup
  }

\def\eprint#1#2{%
  \@eprint#1:#2::\@nil}
\def\@eprint@arXiv#1{\href{http://arxiv.org/abs/#1}{{\tt arXiv:#1}}}
\def\@eprint@dblp#1{\href{http://dblp.uni-trier.de/rec/bibtex/#1.xml}{dblp:#1}}
\def\@eprint#1:#2:#3:#4\@nil{%
  \def\@tempa{#1}%
  \def\@tempb{#2}%
  \def\@tempc{#3}%
  \ifx\@tempc\@empty
    \let\@tempc\@tempb
    \let\@tempb\@tempa
  \fi
  \ifx\@tempb\@empty
    % default to arXiv
    \def\@tempb{arXiv}%
  \fi
  \@ifundefined{@eprint@\@tempb}
    {\@tempb:\@tempc}
    {\expandafter\expandafter\csname @eprint@\@tempb\endcsname\expandafter{\@tempc}}%
  }

\def\mniiiauthor#1#2#3{%
  \@ifundefined{mniiiauth@#1}
    {\global\expandafter\let\csname mniiiauth@#1\endcsname\null #2}
    {#3}}

% ============================================================================
%                             DOCUMENT END
% ============================================================================
\endinput
