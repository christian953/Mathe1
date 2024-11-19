\NeedsTeXFormat{LaTeX2e}
% based on: {ti2}[2009/10/27 Ingo Sieverdingbeck]
\ProvidesClass{ti1}[2019-04-20 Pascal Pieper]
\LoadClass[a4paper]{scrartcl}

% -----------------------------------------------------------------------
% Required packages

\RequirePackage[ngerman]{babel}
\RequirePackage{array}
\RequirePackage{amssymb}
\RequirePackage{epsfig}
\RequirePackage{graphicx}
\RequirePackage{moreverb}
\RequirePackage{parskip}
\RequirePackage{listings}
\RequirePackage{xcolor}
\RequirePackage{multirow}
\RequirePackage{adjustbox}
\RequirePackage{enumerate}

% -----------------------------------------------------------------------
% define page layout using typearea

\KOMAoptions{headinclude=true}
\KOMAoptions{footinclude=true}
\areaset{16cm}{27cm}
% -----------------------------------------------------------------------
% define page style
\pagestyle{plain}
\thispagestyle{plain}

% -----------------------------------------------------------------------
% Macro für das Abgabeblatt
\newcommand{\Abgabeblatt}[2]
{
\begin{adjustbox}{width=1\textwidth}
\begin{tabular}{l>{\centering\arraybackslash}p{5cm}r}
{\"Ubungsblatt} {#1} && Abgabe: {#2}\\
\end{tabular}\\[1ex]
\end{adjustbox}
\rule{\linewidth}{1pt}
}

\newcommand{\Gruppe}[5]
{
\begin{adjustbox}{width=1\textwidth}
\begin{tabular}{l>{\centering\arraybackslash}p{5cm}r}
Gruppe {#1} && \\
{#2} && {#3} \\
{#4} && {#5} \\
\end{tabular}\\[1ex]
\end{adjustbox}
\rule{\linewidth}{1pt}
}

\newcommand{\Tutorium}[3]
{
\begin{adjustbox}{width=1\textwidth}
\begin{tabular}{l>{\centering\arraybackslash}p{5cm}r}
  {#1} 
\end{tabular}\\[1ex]
\end{adjustbox}
% \rule{\linewidth}{1pt}
}

\newcommand{\grenzop}[3]{\mathop{#1}\limits^{#2}_{#3}}

\newcommand{\langrechtspfeil}[2]{\grenzop{\longrightarrow}{#1}{#2}}
\newcommand{\bob}[0]{\hspace*{\fill}$\Box$}

% -----------------------------------------------------------------------

\newcommand{\Zeile}

\newcommand{\Arbblatt}[9]
{
\rule{\linewidth}{1pt}
\begin{adjustbox}{width=1\textwidth}
\begin{tabular}{l>{\centering\arraybackslash}p{5cm}r}
    Algorithmentheorie \hspace{20ex}& WiSe \the\year & {#6}\\
    Tutor: {#4} && {#7}\\
    %{\Huge\textsf{{#9} {#1}}} \hspace{10ex} \begin{tabular}{c|c|c|c|c|c}1&2&3&4&5&$\sum$\\\hline &&&&&\end{tabular}\\[1.5ex]
    {#1} & Gruppe {#5} & {#8}\\
    %{\Large L\"osungsvorschlag} \\[1ex]
    %\multirow{2}{*}
    {Abgabe: {#3}} &  {\"Ubungsblatt} {#2}& {#9}\\
%          && {#8}\\
  \end{tabular}\\[1ex]
\end{adjustbox}
\rule{\linewidth}{1pt}
}

\lstdefinelanguage[RISC-V]{Assembler}
{
	alsoletter={.}, % allow dots in keywords
	alsodigit={0x}, % hex numbers are numbers too!
	morekeywords=[1]{ % instructions
		lb, lh, lw, lbu, lhu,
		sb, sh, sw,
		sll, slli, srl, srli, sra, srai,
		add, addi, sub, lui, auipc,
		xor, xori, or, ori, and, andi,
		slt, slti, sltu, sltiu,
		beq, bne, blt, bge, bltu, bgeu,
		j, jr, jal, jalr, ret,
		scall, break, nop
	},
	morekeywords=[2]{ % sections of our code and other directives
		.align, .ascii, .asciiz, .byte, .data, .double, .extern,
		.float, .globl, .half, .kdata, .ktext, .set, .space, .text, .word
	},
	morekeywords=[3]{ % registers
		zero, ra, sp, gp, tp, s0, fp,
		t0, t1, t2, t3, t4, t5, t6,
		s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11,
		a0, a1, a2, a3, a4, a5, a6, a7,
		ft0, ft1, ft2, ft3, ft4, ft5, ft6, ft7,
		fs0, fs1, fs2, fs3, fs4, fs5, fs6, fs7, fs8, fs9, fs10, fs11,
		fa0, fa1, fa2, fa3, fa4, fa5, fa6, fa7
	},
	morecomment=[l]{;},   % mark ; as line comment start
	morecomment=[l]{\#},  % as well as # (even though it is unconventional)
	morestring=[b]",      % mark " as string start/end
	morestring=[b]'       % also mark ' as string start/end
}


% define some basic colors
\definecolor{mauve}{rgb}{0.58,0,0.82}

\lstset{
	% listings sonderzeichen (for german weirdness)
	literate={ö}{{\"o}}1
	{ä}{{\"a}}1
	{ü}{{\"u}}1,
	basicstyle=\small\ttfamily,                    % very small code
	numbers=left,
	breaklines=true,                              % break long lines
	commentstyle=\itshape\color{green!50!black},  % comments are green
	keywordstyle=[1]\color{blue!80!black},        % instructions are blue
	keywordstyle=[2]\color{orange!80!black},      % sections/other directives are orange
	keywordstyle=[3]\color{red!50!black},         % registers are red
	stringstyle=\color{mauve},                    % strings are from the telekom
	identifierstyle=\color{teal},                 % user declared addresses are teal
	frame=l,                                      % black line on the left side of code
	language=[RISC-V]Assembler,                   % all code is RISC-V
	tabsize=4,                                    % indent tabs with 4 spaces
	showstringspaces=false                        % do not replace spaces with weird underlines
}

%%% Local Variables:
%%% mode: latex
%%% TeX-master: t
%%% End:


