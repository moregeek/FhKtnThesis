%
% Bachelor Thesis for FH Kärnten
% Copyright (c) Stefan Morgenthaler, 2014
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3b
% of this license or (at your option) any later version.
% The latest version of this license is in
% http://www.latex-project.org/lppl.txt
% and version 1.3b or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
% 
% This work has the LPPL maintenance status `unmaintained'.
% 
% This work consists of the file FhKtnThesis.cls only.
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{FhKtnThesis}[2013/12/02 FH Kaernten Bachelor Thesis Class]

% declaration of options
\newif\ifdext@languagechosen

\DeclareOption{english}{%
  \PassOptionsToPackage{english}{babel}
  \dext@languagechosentrue
}
\DeclareOption{german}{%
  \PassOptionsToPackage{ngerman}{babel}
  \dext@languagechosentrue
}

% --- Execution of options 
% ------------------------------------------------------
\ProcessOptions

% --- Loading of packages 
% -------------------------------------------------------
\LoadClassWithOptions{scrreprt}               % Load parent class with provided options


\ifdext@languagechosen
  \RequirePackage{babel}
\else
  \RequirePackage[english]{babel}
\fi


\usepackage{iflang}                            % language switching
\usepackage[top=25mm, bottom=25mm, 
            left=35mm, right=25mm,             % paper margin
            includeheadfoot]{geometry}         % + include header and footer
\usepackage[onehalfspacing]{setspace}          % Line Spacing: 1,5
\usepackage{shadowtext}                        % titlepage: shadowtext
\usepackage[letterspace=500]{microtype}        % titlepage: spacing
\usepackage{graphicx}                          % enhanced support for graphics
\usepackage{tabularx}                          % tables	
\usepackage[utf8]{inputenc}                    % correct input encoding
\usepackage[T3,T1]{fontenc}                    % correct output encoding
\nonfrenchspacing                              % more space after punctuation marks than between two words (better readable)
\pagestyle{headings}                           % page header


% --- Code
% -------------------------------------------------------

%
% Commands to define the relevant informations for the title page
%
% usage:
%    \matriculationnumber{0123456789}
%    \firsttutor{First Tutor Name}
%    \secondtutor{Second Tutor Name}
%    \gradedate{February 28, 2014}

\newcommand{\matriculationnumber}[1]{
  \def\matriculationnumber{#1}
}

\newcommand{\firsttutor}[1]{
  \def\firsttutor{#1}
}

\newcommand{\secondtutor}[1]{
  \def\secondtutor{#1}
}

\newcommand{\gradedate}[1]{
  \def\deadline{#1}
}

%
% Small helper to easily make a multi language document class
%
% usage:
%   \mLangStr{Ich studiere}{I study}
%
\newcommand{\mLangStr}[2]{
  \IfLanguageName{ngerman}{#1}{#2}
}

%
% title page 
%
\renewcommand{\maketitle}{

  \begin{titlepage}
  
    \begin{center}

      % logo
      \begin{flushright}
        \includegraphics[width=7.28cm, height=2.55cm]{gfx/fh_kaernten_logo}
      \end{flushright}

      % university name    
      \begin{flushleft}
        {
          {\bf
            \mLangStr{Fachhochschulstudiengang}{University of Applied Sciences} \\
            \mLangStr{Netzwerk- und Kommunikationstechnik}{Network \& Communication Engineering}
          }
        }
      \end{flushleft}
  
      % kind of thesis
      \vspace*{15mm}      
      {
        \begin{huge}
          \textbf{\textls{\shadowtext{ \mLangStr{BACHELORARBEIT}{BACHELOR PAPER} }}}
        \end{huge}
      }
      
      % topic title
      \vspace*{15mm}
      {
        \Large\textbf{\@title}
      }
      
      % text block
      \vspace*{15mm}
      \mLangStr{
        Zur Erlangung des akademischen Grades\\
      }{
        A bachelor paper submitted in partial fulfillment of the\\
        requirements for the degree of\\
      }
      Bachelor of Science in Engineering (BSc)
      
    \end{center}
    
    % text block, with author & co.
    \vspace*{15mm}
    \begin{tabular}{ll}
      \mLangStr{Autor:}{Author:} & \@author\\ [2.5mm]
      \mLangStr{Matrikelnummer:}{Matriculation Number:} & \matriculationnumber\\ [10mm]

      \mLangStr{Erstbetreuer:}{Academic Tutor:}  & \firsttutor\\ [2.5mm]
      \mLangStr{Zweitbetreuer:}{Tutor:}  & \secondtutor\\ [10mm]

      \mLangStr{Tag der Abgabe:}{Deadline:} & \deadline
    \end{tabular}
    
  \end{titlepage}
}

%
% statement
%
\newcommand{\makestatement}{

  \clearpage
  
  \chapter*{
    \mLangStr{
      Eidesstattliche Erkl\"{a}rung
    }{
      Affidavit
    }
  }
  \noindent
  \thispagestyle{empty}
  
  \mLangStr{
    zur Arbeit mit dem Titel%\par
  }{
    for the thesis with the tile%\par
  }\par

  \vspace{1.5cm}
  \large
  \textbf{\uppercase\expandafter{\@title}} \par
  \vfill
  \begin{quotation}
  
  \IfLanguageName{english}{
    ``Hereby I faithfully declare that I have             
    independently composed this diploma thesis and that no other than the     
    indicated aids and sources have been used. Every external source used is  
    referenced in the bibliography. All phrases, which were obtained literally 
    from external sources, are marked. This thesis has not been presented to 
    any other examination board and has not been submitted for publication 
    elsewhere.''
  }{
    ``Ich erkl\"{a}re hiermit ehrenw\"{o}rtlich, dass ich
    die vorliegende Arbeit selbst\"{a}ndig angefertigt habe. Alle aus
    fremden Quel\-len direkt oder indirekt \"{u}bernommenen Gedanken sind als 
    solche kenntlich gemacht und in der Bibliographie angef\"{u}hrt. Die
    Arbeit wurde bisher keiner anderen Pr\"{u}fungsbeh\"{o}rde vorgelegt und
    noch nirgends ver\"{o}ffentlicht.''
  }
  
  \end{quotation}
  \vspace{2cm}
  \begin{flushright}
    \begin{minipage}{110mm}
      \normalsize
      \mLangStr{
        Dieses Dokument ist digital signiert,
      }{
        This document is digitally signed,
      } \today \par

      \rule{110mm}{0.5pt} \par
      \begin{flushright}
        \expandafter{\@author}
      \end{flushright}
    \end{minipage}
  \end{flushright}
}