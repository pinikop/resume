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

\ExecuteOptions{10pt}

\ProcessOptions\relax

% % Load base class
\LoadClass[a4paper]{article}

%% end of file `template.cls'.