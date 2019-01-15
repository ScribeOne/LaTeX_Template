%\NeedsTexFormat{LaTeX2e}
\ProvidesClass{abgabe}[2018/01/14 Uni levy - Scribe]
\LoadClass{article}

\RequirePackage{lmodern}
\renewcommand*\familydefault{\sfdefault}
\RequirePackage{sansmath}
\RequirePackage{microtype}
\RequirePackage[utf8]{inputenc}
\RequirePackage{enumitem}
\RequirePackage{ifthen}
\RequirePackage{tikz}
\RequirePackage{listing}

\RequirePackage[english,ngerman]{babel}

\RequirePackage[margin=2cm,a4paper,ignorehead,headsep=1.2cm]{geometry}

\RequirePackage{graphicx}
\RequirePackage[hidelinks]{hyperref}

\definecolor{uulm}{RGB}{130,161,180}
\definecolor{uulm-akzent}{rgb}{.663,.635,.553}
\definecolor{uulm-in}{rgb}{.639,.149,.230}

%\renewcommand{\baselinestretch}{1.1}
%\setlength{\parindent}{0pt}
%\setlength{\parskip}{1em}

\newboolean{nocolor}
\DeclareOption{nocolor}{\setboolean{nocolor}{true}}
\ProcessOptions*


% Custom Fields
\def\@semester{} % default empty
\newcommand{\semester}[1]{
	\def\@semester{#1}
}
\def\@students{} % default empty
\newcommand{\students}[1]{
	\def\@students{#1}
}
\def\@course{} % default empty
\newcommand{\course}[1]{
	\def\@course{#1}
}


% Title 
\renewcommand{\maketitle}{
	% \thispagestyle{empty}
	\begin{flushright}
		\@students
	\end{flushright}
	\textbf{\@course} 
	\par
	\vspace{1em}
	{\Large \textbf{ \@title}}
	\vspace{2em}
}


% \task command with counter and style
% 1 Argument: name
\newcounter{taskcounter}
\setcounter{taskcounter}{0}
\newcommand{\task}[1]{%
	\addtocounter{taskcounter}{1} %
	{\large \textbf{Aufgabe \arabic{taskcounter}: #1}}}



