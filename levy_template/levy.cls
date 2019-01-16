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

\renewcommand{\baselinestretch}{1.1}
\setlength{\parindent}{0pt}
\setlength{\parskip}{.5em}

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
\def\@tutor{null} % default null for compare
\newcommand{\tutor}[1]{
	\def\@tutor{#1}
}


% Title
\renewcommand{\maketitle}{
	% \thispagestyle{empty}
	
	% Top Right, Student and Tutor names
	\vspace*{-2cm}
	\begin{flushright}
		{\large \@students}
		\par
		\ifthenelse{\equal{\@tutor}{null}}{}{Tutor: \@tutor}
	\end{flushright}

	% Top Left, Course and Semester
	\vspace*{-1.35cm}
	\begin{flushleft}
		{\large \textbf{\@course}}
		\par
		\@semester
	\end{flushleft}
	\par
	
	% Center with Main Title
	\vspace{.7em}
	\begin{center}
	{\LARGE \textbf{ \@title}}
	\end{center}
	\vspace{1.5em}
}


% counters for task and subtask
\newcounter{taskcounter}
\setcounter{taskcounter}{0}
\newcounter{subcounter}[taskcounter]
\setcounter{subcounter}{0}


% \task command 
% 1 optional Argument: name
\newcommand{\task}[1]{
	\addtocounter{taskcounter}{1}
	\setcounter{subcounter}{0}
	\vspace{.8em}
	\ifthenelse{\equal{#1}{}} 								% condition
	{\large \textbf{Aufgabe \arabic{taskcounter}}}			% then
	{\large \textbf{Aufgabe \arabic{taskcounter}: #1}}		% else
}

% \subtask command 
\newcommand{\subtask}{
	\addtocounter{subcounter}{1}	
	\arabic{taskcounter}.\arabic{subcounter}	
}
