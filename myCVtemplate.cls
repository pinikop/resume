%% myCVtemplate.cls
%% Copyright 2024 Pini Koplovitch
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
%
% This work consists of the files myCVtemplate.cls and myCV.tex.

%-------------------------------------------------------------------------------
%                identification
%-------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{myCVtemplate}[2022/01/01 My Custom Template]

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
%-------------------------------------------------------------------------------
% set lengths
%-------------------------------------------------------------------------------
\setlength{\parindent}{0pt}  % no indentation of paragraph
\newlength{\titleSpacing} \setlength{\titleSpacing}{-2ex}
\newlength{\sectionSpacing} \setlength{\sectionSpacing}{-2ex}
\newlength{\entrySpacing} \setlength{\entrySpacing}{1ex}
\newlength{\bulletSpacing} \setlength{\bulletSpacing}{0.5ex}
%-------------------------------------------------------------------------------
% adjust the page margins
%-------------------------------------------------------------------------------
\RequirePackage{geometry}
\geometry{top=10mm, bottom=5mm, right=10mm, left=10mm}

%-------------------------------------------------------------------------------
% define color scheme - Blue
%-------------------------------------------------------------------------------
\RequirePackage{xcolor}

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
\RequirePackage{fontawesome5}
\RequirePackage[hidelinks]{hyperref}

\newcommand{\linkIcon}[2]{\makebox[1em][r]{\color{#2}{#1}}}  
% usage \linkIcon{<icon>}{<color>}

\newcommand{\contactDetailsRow}[3]{\linkIcon{#2}{#3} #1}  
% usage \contactDetailsRow{<phone|email|username>}{<icon>}{<color>}

%% TODO: add key-value structure to have 2 values <phone|email|username> & <phone|email|social network>
%% TODO: make color argument optional
\newcommand{\contactDetailsHyperLink}[4]{
\href{#2#1}{\contactDetailsRow{#1}{#3}{#4}}}
% usage \contactDetailsHyperLink{<phone|email|username>}{<URL>}{<icon>}{<color>}

\newcommand{\name}[1]{\def\@name{#1}}
\newcommand{\phone}[1]{\def\@phone{
        \contactDetailsHyperLink{#1}{tel:}{\faIcon{mobile-alt}}{color2}}}
\newcommand{\email}[1]{\def\@email{
        \contactDetailsHyperLink{#1}{mailto:}{\faEnvelope[regular]}{colorgmail}}}
\newcommand{\linkedin}[1]{\def\@linkedin{
        \contactDetailsHyperLink{#1}{https://www.linkedin.com/in/}{\faLinkedin}{colorlinkedin}}}
\newcommand{\github}[1]{\def\@github{
    \contactDetailsHyperLink{#1}{https://github.com/}{\faGithub}{colorgithub}}}

% make title %TODO: make it a parameter\option or theme

% \renewcommand{\maketitle}{
%     \begin{flushright}
%         \begin{minipage}[c]{0.6\textwidth}
%             \color{color1}\Huge\textbf{\@name}
%         \end{minipage}
%         \begin{minipage}{0.25\textwidth}
%             \small\textcolor{color2}{
%                 \@phone \\
%                 \@email \\
%                 \@linkedin \\
%                 \@github \\
%                 }
%         \end{minipage}
%     \end{flushright}
%     \vspace{\titleSpacing}
%     }

\renewcommand{\maketitle}{
    \hspace*{\fill}
    {\color{color1}\Huge\textbf{\@name}}
    \hspace*{\fill} \\
    \begin{minipage}[c]{\textwidth}
        \centering \@phone \@email \@linkedin %\@github
    \end{minipage} \\
}

%-------------------------------------------------------------------------------
% setting Sections layout
%-------------------------------------------------------------------------------
\RequirePackage{titlesec}
\setcounter{secnumdepth}{0}

%-------------------------------------------------------------------------------
% Formatting Sections titles
%-------------------------------------------------------------------------------
\titleformat{name=\section,numberless}
    {\vspace{\sectionSpacing}\color{color1}\Large\bfseries}{}{10pt}{} 
    [{\vspace{-0.15ex}\titlerule[0.5pt]}]

%-------------------------------------------------------------------------------
% Setting  Experience entries
%-------------------------------------------------------------------------------
\newcommand*{\experienceEntry}[8][\entrySpacing]{
    \begin{tabular*}{\textwidth}{l@{\extracolsep{\fill}}r}
        {{\large\bfseries #2}\
            \ifstrempty{#5}
                {\ifstrempty{#6}{}{#6}}
                {\ifstrempty{#6}{\emph{#5}}{\emph{#5}, #6}}
            } & {\bfseries #3--#4}
    \end{tabular*}
    \ifstrempty{#7}{\unskip}{\\[0.5ex] \makebox[1.5ex]\small #7}  % HACK: \makebox is a hack to fix indentation
    \ifstrempty{#8}{\unskip}{\\[0.5ex] #8}
    \par\addvspace{#1}
}


%-------------------------------------------------------------------------------
% define bullet symbole  %TODO: make it a parameter\option or theme
%-------------------------------------------------------------------------------
\RequirePackage{marvosym}
% \newcommand*{\bulletSymbol}{\makebox[1.5em][l]{\strut{\color{color1}\large\Neutral}}}
\newcommand*{\bulletSymbol}{\makebox[1.5em][l]{\strut{\color{color1}\scriptsize\CircSteel}}}
%-------------------------------------------------------------------------------
% setting Sections layout
%-------------------------------------------------------------------------------
\newcommand*{\cvBullet}[2][\bulletSpacing]{
    \bulletSymbol\ \hspace*{-1ex}\begin{minipage}[t]{\dimexpr\linewidth-2em}
        #2
    \end{minipage}
    \par\addvspace{#1}}

%-------------------------------------------------------------------------------
% skill items
%-------------------------------------------------------------------------------
\newcommand*{\skillItemSingle}[4][\bulletSpacing]{
    \begin{tabular*}{\textwidth}{l@{\extracolsep{\fill}}r}
        {{\bfseries #2: }#3} & {\ifstrempty{#4}{}{\bfseries #4}}
    \end{tabular*}
    \par\addvspace{#1}
}

\newcommand*{\skillItemDouble}[5][\bulletSpacing]{
        \begin{tabular}{ll}
            {\bfseries #2: }#3 & {\bfseries #4: }#5
        \end{tabular}
    \par\addvspace{#1}
}

%-------------------------------------------------------------------------------
% Setting Education entries
%-------------------------------------------------------------------------------
\newcommand*{\educationEntry}[9][\entrySpacing]{
    \begin{tabular*}{\textwidth}{l@{\extracolsep{\fill}}r}
        {\large\bfseries 
        \ifstrempty{#2}{#3}{#2, #3}} & {\bfseries #4}
    \end{tabular*}\\
    \begin{tabular*}{\textwidth}{l@{\extracolsep{\fill}}r}
        {#7,  \emph{#8}} & {#5--#6}
    \end{tabular*}
    \ifstrempty{#9}{\unskip}{\\[0.5px] \makebox[1.5ex]{}#9} % HACK: \makebox is a hack to fix indentation
    \par\addvspace{#1}
}

%-------------------------------------------------------------------------------
% Recommmendations
%-------------------------------------------------------------------------------
\newcommand{\recommendations}{
    \vfill
    \hfill\small{**\emph{Recommendations} will be provided upon request}
}

%-------------------------------------------------------------------------------
% Disable page numbering
%-------------------------------------------------------------------------------
\pagestyle{empty}
%% end of file `template.cls'.