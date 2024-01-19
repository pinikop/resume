%-------------------------------------------------------------------------------
%                identification
%-------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{template}[2022/01/01 My Custom Template]

%-------------------------------------------------------------------------------
%                class options
%-------------------------------------------------------------------------------
% Font size options
\DeclareOption{10pt}{\PassOptionsToClass{\CurrentOption}{article}}
\DeclareOption{11pt}{\PassOptionsToClass{\CurrentOption}{article}}
\DeclareOption{12pt}{\PassOptionsToClass{\CurrentOption}{article}}

% font type options
\DeclareOption{sans}{\renewcommand{\familydefault}{\sfdefault}}
\DeclareOption{roman}{\renewcommand{\familydefault}{\rmdefault}}
\DeclareOption{helvetica}{\renewcommand{\sfdefault}{phv}}

\ExecuteOptions{10pt, sans}

\ProcessOptions\relax

%-------------------------------------------------------------------------------
% Load base class
%-------------------------------------------------------------------------------
\LoadClass[a4paper]{article}
\setlength{\parindent}{0pt}
%-------------------------------------------------------------------------------
% adjust the page margins
%-------------------------------------------------------------------------------
\usepackage{geometry}
\geometry{top=10mm, bottom=10mm, right=10mm, left=10mm}
%-------------------------------------------------------------------------------
% adjust title location
%-------------------------------------------------------------------------------
\usepackage{titling}
\pretitle{\begin{center}\Huge\vskip -2em}

%-------------------------------------------------------------------------------
% define color scheme - Blue
%-------------------------------------------------------------------------------
\usepackage{xcolor}

% color scheme 
\definecolor{color0}{RGB}{0, 0, 0} % black
\definecolor{color1}{RGB}{0, 119, 181} % light blue
\definecolor{color2}{RGB}{100, 100, 100} % gray

% icon colors
\definecolor{colorgmail}{RGB}{212, 70, 56} % gmail red (Jasper)
\definecolor{colorlinkedin}{RGB}{0, 119, 181} % linkeding blue
\definecolor{colorgithub}{RGB}{36, 41, 46} % gray

%-------------------------------------------------------------------------------
% setting title layout
%-------------------------------------------------------------------------------
\usepackage{fontawesome5}
\usepackage[hidelinks]{hyperref}

\newcommand{\linkIcon}[2]{\makebox[1em][r]{\color{#2}{#1}}}  
% usage \linkIcon{<icon>}{<color>}

\newcommand{\contactDetailsRow}[3]{\linkIcon{#2}{#3} #1}  
% usage \contactDetailsRow{<phone|email|username>}{<icon>}{<color>}

%% TODO: add key-value structure to have 2 values <phone|email|username> & <phone|email|social network>
%% TODO: make color argument optional
\newcommand{\contactDetailsHyperLink}[4]{%  
\href{#2#1}{\contactDetailsRow{#1}{#3}{#4}}}
% usage \contactDetailsHyperLink{<phone|email|username>}{<URL>}{<icon>}{<color>}

\newcommand{\name}[1]{\def\@name{#1}}
\newcommand{\phone}[1]{\def\@phone{%
        \contactDetailsHyperLink{#1}{tel:}{\faIcon{mobile-alt}}{color2}\\}}
\newcommand{\email}[1]{\def\@email{%
        \contactDetailsHyperLink{#1}{mailto:}{\faEnvelope[regular]}{colorgmail}\\}}
\newcommand{\linkedin}[1]{\def\@linkedin{%
        \contactDetailsHyperLink{#1}{https://www.linkedin.com/in/}{\faLinkedin}{colorlinkedin}\\}}
\newcommand{\github}[1]{\def\@github{%
    \contactDetailsHyperLink{#1}{https://github.com/}{\faGithub}{colorgithub}\\}}

% make title
\renewcommand{\maketitle}{
    \begin{flushright}
        \begin{minipage}[c]{0.6\textwidth}
            \Huge\color{color1}{\textbf{\@name}}
        \end{minipage}
        \begin{minipage}{0.25\textwidth}
            \small
            \textcolor{color2}{
                \@phone
                \@email
                \@linkedin
                \@github
                }
        \end{minipage}
    \end{flushright}
    \vspace{-0.5em}
    }

%-------------------------------------------------------------------------------
% setting Sections layout
%-------------------------------------------------------------------------------
\usepackage{titlesec}
\setcounter{secnumdepth}{0}

%-------------------------------------------------------------------------------
% Formatting Sections titles
%-------------------------------------------------------------------------------
\titleformat{name=\section,numberless}
    {\vspace{-0.75em}\color{color1}\Large\bfseries}{}{10pt}{} 
    [{\vspace{-0.15em}\titlerule[0.5pt]}]

%-------------------------------------------------------------------------------
% Setting  Experience entries
%-------------------------------------------------------------------------------
\newcommand*{\experienceEentry}[8][.5em]{
    \begin{tabular*}{\textwidth}{l@{\extracolsep{\fill}}r}%
        {{\large\bfseries #2}\  %
        \emph{
            \ifstrempty{#5}
                {\ifstrempty{#6}{}{#6}}
                {\ifstrempty{#6}{#5}{#5, #6}}
                }
            } & {\bfseries #3--#4}
    \end{tabular*}%
    \ifx&#7&%
        \else{\\%
            \begin{minipage}{\textwidth}%
                {\small#7}%
            \end{minipage}}
    \fi%
    \ifx&#8&%
        \else{\\%
        \begin{minipage}{\textwidth}%
            \vspace{#1}
            #8%
        \end{minipage}}\fi%
    \par\addvspace{#1}
}

%-------------------------------------------------------------------------------
% define bullet symbole
%-------------------------------------------------------------------------------
\usepackage{marvosym}
\newcommand*{\bulletSymbol}{\makebox[1.5em][l]{\strut{\color{color1}\large\Neutral}}}
%-------------------------------------------------------------------------------
% setting Sections layout
%-------------------------------------------------------------------------------
\newcommand*{\cvItem}[2][.25em]{%
    \bulletSymbol\begin{minipage}[t]{\textwidth}#2\end{minipage}%
    \par\addvspace{#1}}

%-------------------------------------------------------------------------------
% skill items
%-------------------------------------------------------------------------------
\newcommand*{\skillItem}[3][.25em]{%
    \begin{minipage}[t]{\textwidth}{
        {\bfseries #2: }#3
    }
    \end{minipage}
    \par\addvspace{#1}}

%-------------------------------------------------------------------------------
% Setting  Education entries
%-------------------------------------------------------------------------------
\newcommand*{\educationEentry}[9][.5em]{
    \begin{tabular*}{\textwidth}{l@{\extracolsep{\fill}}r}%
        {\large\bfseries #2: #3} & {\bfseries #4}
    \end{tabular*}\\%
    \begin{tabular*}{\textwidth}{l@{\extracolsep{\fill}}r}%
        {#7,  {\emph#8}} & {#5--#6}
    \end{tabular*}%
    \ifx&#9&%
        \else \\%
        \begin{minipage}[t]{\textwidth}
            {\small #9}
        \end{minipage}%
    \fi

    \par\addvspace{#1}
}

%% end of file `template.cls'.