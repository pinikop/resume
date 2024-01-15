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
% setting title layout
%-------------------------------------------------------------------------------
\newcommand*{\name}[1]{\def\@name{#1}}
\newcommand*{\phone}[1]{\def\@phone{#1}}
\newcommand*{\email}[1]{\def\@email{#1}}
\newcommand*{\linkedin}[1]{\def\@linkedin{#1}}
\newcommand*{\github}[1]{\def\@github{#1}}

\renewcommand{\maketitle}{
    \begin{flushright}
        \begin{minipage}[c]{0.6\textwidth}
            \Huge\textcolor{black}{\textbf{\@name}} % Use title from metadata
        \end{minipage}
        \begin{minipage}{0.25\textwidth}
            \small
            \textcolor{gray}{
                \@phone\\
                \@email\\
                \@linkedin\\
                \@github\\
                }
        \end{minipage}
    \end{flushright}
    }
    
%% end of file `template.cls'.