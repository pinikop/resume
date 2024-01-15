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

\newcommand{\name}[1]{\def\@name{#1}}
\newcommand{\phone}[1]{\def\@phone{\makebox[1em][r]{\faIcon{mobile-alt}} #1}}
\newcommand{\email}[1]{\def\@email{\makebox[1em][r]{\color{colorgmail}{\faEnvelope[regular]}} #1}}
\newcommand{\linkedin}[1]{\def\@linkedin{\makebox[1em][r]{\color{colorlinkedin}{\faLinkedin}} #1}}
\newcommand{\github}[1]{\def\@github{\makebox[1em][r]{\color{colorgithub}{\faGithub}} #1}}

\renewcommand{\maketitle}{
    \begin{flushright}
        \begin{minipage}[c]{0.6\textwidth}
            \Huge\color{color1}{\textbf{\@name}}
        \end{minipage}
        \begin{minipage}{0.25\textwidth}
            \small
            \textcolor{color2}{
                \@phone \\
                \@email\\
                \@linkedin\\
                \@github\\
                }
        \end{minipage}
    \end{flushright}
    }
    
%% end of file `template.cls'.