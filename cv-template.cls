%% cv-template.cls
%% Copyright 2024 Pini Koplovitch
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
%
% This work consists of the files cv-template.cls and example.tex.

%-------------------------------------------------------------------------------
%                identification
%-------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv-template}[2024/03/19 Custom CV class]

%-------------------------------------------------------------------------------
%                class options
%-------------------------------------------------------------------------------
% Font size options
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

% font type options
\DeclareOption{sans}{\renewcommand{\familydefault}{\sfdefault}}
\DeclareOption{roman}{\renewcommand{\familydefault}{\rmdefault}}
\DeclareOption{helvetica}{\renewcommand{\sfdefault}{phv}}

\ExecuteOptions{10pt, sans}
\ProcessOptions\relax

%-------------------------------------------------------------------------------
% Load base class and required packages
%-------------------------------------------------------------------------------
\LoadClass[a4paper]{article}
\RequirePackage{xcolor}     % Load first for color definitions
\RequirePackage{geometry}
\RequirePackage{fontawesome5}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{marvosym}
\RequirePackage{titlesec}
\RequirePackage{cv-themes}  % Must be loaded after xcolor

%-------------------------------------------------------------------------------
% Basic commands
%-------------------------------------------------------------------------------
\newcommand*{\name}[1]{\def\@name{#1}}

% Contact detail command with icon color and text color separated
\newcommand*{\contactDetail}[5]{%
    \expandafter\def\csname @#1\endcsname{%
        \href{#3#2}{{\color{#5}#4}\hspace{0.5em}{\useThemeColor{secondary}#2}}%
    }%
}

% Predefined contact detail commands with brand colors
\newcommand*{\phone}[1]{\contactDetail{phone}{#1}{tel:}{\faIcon{mobile-alt}}{\getThemeColor{secondary}}}
\newcommand*{\email}[1]{\contactDetail{email}{#1}{mailto:}{\faEnvelope[regular]}{gmail-red}}
\newcommand*{\linkedin}[1]{\contactDetail{linkedin}{#1}{https://www.linkedin.com/in/}{\faLinkedin}{linkedin-blue}}
\newcommand*{\github}[1]{\contactDetail{github}{#1}{https://github.com/}{\faGithub}{github-gray}}

% Contact order command
\newcommand*{\setContactOrder}[1]{\def\@contactOrder{#1}}
\setContactOrder{phone,email,linkedin,github}  % Default order

% Contact separator command
\newcommand{\setContactSeparator}[1]{\def\@contactSeparator{#1}}
\setContactSeparator{\quad}  % Default separator

%-------------------------------------------------------------------------------
% Lengths
%-------------------------------------------------------------------------------
\newlength{\titleSpacing}
\newlength{\sectionSpacing}
\newlength{\entrySpacing}
\newlength{\bulletSpacing}

\setlength{\parindent}{0pt}
\setlength{\titleSpacing}{-2ex}
\setlength{\sectionSpacing}{-2ex}
\setlength{\entrySpacing}{1ex}
\setlength{\bulletSpacing}{0.5ex}

%-------------------------------------------------------------------------------
% Page layout
%-------------------------------------------------------------------------------
\geometry{top=15mm, bottom=15mm, left=15mm, right=20mm}
\setcounter{secnumdepth}{0}

%-------------------------------------------------------------------------------
% Title layout
%-------------------------------------------------------------------------------
\renewcommand{\maketitle}{%
    \begingroup
    \centering
    {\useThemeColor{title}\Huge\textbf{\@name}\par}%
    \vspace{1ex}%
    % Process contact details
    \def\@tempsep{}% Initialize separator as empty
    \@for\contact:=\@contactOrder\do{%
        \ifcsname @\contact\endcsname
            \@tempsep
            \csname @\contact\endcsname
            \def\@tempsep{\@contactSeparator}% Set separator for subsequent items
        \fi
    }%
    \par
    \vspace{2ex}%
    \endgroup
}

%-------------------------------------------------------------------------------
% Summary section
%-------------------------------------------------------------------------------
\newcommand{\cvSummary}[1]{%
    {\useThemeColor{secondary}#1}%
    \par
    \vspace{\entrySpacing}%
}

%-------------------------------------------------------------------------------
% Section formatting
%-------------------------------------------------------------------------------
\titleformat{name=\section,numberless}
    {\vspace{\sectionSpacing}\useThemeColor{section}\Large\bfseries}
    {}  % format for the counter (empty since numberless)
    {1em}  % separation between number and title
    {}  % before-code (empty)
    [{\vspace{-0.15ex}\titlerule[0.5pt]}]  % after-code

%-------------------------------------------------------------------------------
% Bullet style
%-------------------------------------------------------------------------------
\newcommand{\setBulletStyle}[2]{%
    \renewcommand{\bulletSymbol}{\makebox[1.5em][c]{\strut{\useThemeColor{bullet}#2}}}%
}

\newcommand*{\bulletSymbol}{\makebox[1.5em][c]{\strut{\useThemeColor{bullet}\scriptsize\textbullet}}}

%-------------------------------------------------------------------------------
% CV entries
%-------------------------------------------------------------------------------
% \cvBullet[<spacing>]{<bullet_text>}
% Defines a command for a bullet point item in a CV entry.
% #1 (Optional): Vertical spacing after the bullet item. Defaults to \bulletSpacing.
% #2: The text of the bullet point.
\newcommand*{\cvBullet}[2][\bulletSpacing]{
    \bulletSymbol\ \hspace*{-1ex}\begin{minipage}[t]{\dimexpr\linewidth-1.5em}
        #2
    \end{minipage}
    \par\addvspace{#1}}

% \cvText{<text>}
% Helper command for indented, small plain text within CV entries (e.g., for descriptions).
% #1: The text to be displayed.
\newcommand*{\cvText}[1]{\makebox[1.5ex]{}\begin{minipage}[t]{\dimexpr\linewidth-1.5ex}\small #1\end{minipage}\par\addvspace{0.5ex}}

% \cvFormatYearRange{<start_year>}{<end_year>}
% Helper command to format year ranges. Displays "start_year--end_year" or just "start_year" if end_year is empty.
% #1: The start year.
% #2: The end year (can be empty or "Present").
\newcommand*{\cvFormatYearRange}[2]{#1\ifstrempty{#2}{}{--#2}}

%-------------------------------------------------------------------------------
% Setting Experience entries
%-------------------------------------------------------------------------------
% \experienceEntry[<spacing>]{<job_title>}{<company_name>}{<location>}{<start_year>}{<end_year>}{<description>}{<bullet_points>}
% Defines a command for an experience entry.
% #1: spacing (optional)
% #2: job title
% #3: company name
% #4: location
% #5: start year
% #6: end year
% #7: description
% #8: bullet points
\newcommand*{\experienceEntry}[8][\entrySpacing]{%
    \begin{tabular*}{\textwidth}{l@{\extracolsep{\fill}}r}
        {{\large\bfseries #2}\
            \ifstrempty{#3}
                {\ifstrempty{#4}{}{#4}}
                {\ifstrempty{#4}{\emph{#3}}{\emph{#3}, #4}}
            } & {\bfseries\cvFormatYearRange{#5}{#6}}
    \end{tabular*}
    \ifstrempty{#7}{\unskip}{%
        \par\addvspace{0.5ex}\noindent
        \makebox[1.5ex]{}\begin{minipage}[t]{\dimexpr\linewidth}\small #7\end{minipage}%
    }
    \ifstrempty{#8}{\unskip}{%
        \par\addvspace{0.5ex}
        #8%
    }
    \par\addvspace{#1}
}

%-------------------------------------------------------------------------------
% skill items
%-------------------------------------------------------------------------------

\usepackage{tabularx}
\usepackage{xifthen} % For \ifstrempty conditional commands

% \skillItemSingle[<spacing>]{<skill_category>}{<list_of_skills>}
% Defines a command for a single skill item (one category per line).
% #1 (Optional): Vertical spacing after the item. Defaults to \bulletSpacing.
% #2: The category of the skill (e.g., "Programming").
% #3: A comma-separated list of skills within that category.
\newcommand*{\skillItemSingle}[3][\bulletSpacing]{% 
    \noindent 
    {\ifstrempty{#2}{}{{\bfseries #2}: }#3}%
    \par\addvspace{#1}%
}

% \skillItemDouble[<spacing>]{<skill_category_1>}{<list_of_skills_1>}{<skill_category_2>}{<list_of_skills_2>}
% Defines a command for displaying two skill items side-by-side.
% #1 (Optional): Vertical spacing after the item. Defaults to \bulletSpacing.
% #2: The category of the first skill.
% #3: A comma-separated list of skills for the first category.
% #4: The category of the second skill.
% #5: A comma-separated list of skills for the second category.
\newcommand*{\skillItemDouble}[5][\bulletSpacing]{
        \begin{tabular}{ll}
            {\bfseries #2: }#3 & {\bfseries #4: }#5
        \end{tabular}
    \par\addvspace{#1}
}

%-------------------------------------------------------------------------------
% Setting Education entries
%-------------------------------------------------------------------------------
\newcommand*{\educationEntry}[9][\entrySpacing]{%
    \begin{tabular*}{\textwidth}{l@{\extracolsep{\fill}}r}
        {\large\ifstrempty{#2}{#3}{{\bfseries #2}, #3}} & {\bfseries #4}
    \end{tabular*}\\[0.5ex]
    \begin{tabular*}{\textwidth}{l@{\extracolsep{\fill}}r}
        {\normalsize #5, \emph{#6}} & {\normalsize\cvFormatYearRange{#7}{#8}}
    \end{tabular*}
    \ifstrempty{#9}{\unskip}{\par\addvspace{0.5ex} #9}
    \par\addvspace{#1}
}

%-------------------------------------------------------------------------------
% Recommmendations
%-------------------------------------------------------------------------------
% \recommendations
% Defines a command to add a line about recommendations being available upon request.
\newcommand{\recommendations}{
    \vfill
    \hfill\small{**\emph{Recommendations} will be provided upon request}
}

%-------------------------------------------------------------------------------
% Disable page numbering
%-------------------------------------------------------------------------------
\pagestyle{empty}

\endinput

%% end of file `cv-template.cls'.