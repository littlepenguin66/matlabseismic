# 课程实验报告撰写要求

## 一、整体框架

本课程实验报告聚焦于地震数据处理，需按照以下结构进行撰写，确保内容完整、逻辑清晰。

### （一）实验标题

请根据给定的地震数据处理代码及相关描述，为课程报告拟定一个精准且能体现实验核心的标题。标题应简洁明了，能直观反映实验的主要内容与目的，例如 “基于 \[具体算法] 的地震数据处理实验研究” 等类似表述。

### （二）实验内容

**实验内容阐述**：基于所提供的地震数据处理代码，将其系统地转化为完整的地震数据课程实验内容描述。详细说明实验所涉及的各个环节，包括但不限于数据读取、预处理步骤（如滤波、去噪等操作）、核心算法的应用以及数据的后处理等过程，确保每个步骤都有清晰的解释，使读者能够理解整个实验流程。

### （三）实验数据和函数说明

**实验数据基本特征**：介绍实验所使用地震数据的来源，说明数据的类型（如时间序列数据、二维或三维地震数据体等）、数据规模（数据量大小、数据的时间跨度或空间范围等）、数据格式以及数据中所包含的关键信息（如地震波的振幅、频率、地震道数量等特征）。

**函数说明**：针对实验中使用的关键函数，详细解释其输入参数的含义与取值范围，输出参数的形式及所代表的物理意义，以及函数本身所实现的具体功能。例如，若使用了一个滤波函数，需说明输入数据是原始地震数据，输入参数可能包括滤波器的类型、截止频率等，输出则是经过滤波处理后的地震数据，函数功能为去除特定频率范围的噪声。

### （四）实验结果图说明

**图像描述**：对实验所得的图像，依据代码的处理过程进行详细描述。说明图像所展示的数据内容，例如是地震波的传播特征、处理前后数据的对比等。解释图像中各个元素的含义，如坐标轴代表的物理量、颜色或线条所表示的数据特征等。

**图像插入**：在报告中对应描述位置，准确插入实验所得的图像。确保图像清晰、分辨率足够，图像的编号、标题与描述内容相互对应，便于读者对照理解。

### （五）实验总结

**实验成果总结**：概括实验所取得的主要成果，明确阐述通过实验数据处理是否达成了预期目标。例如，是否成功提取出特定的地震波特征，处理后的数据在精度或其他关键指标上是否达到实验要求等。同时，对比实验前后数据的关键变化，量化说明数据处理带来的效果提升。

## 二、书写规范

**环境要求**：使用 MacOS 系统下的 LaTeX 进行课程实验报告的书写。需确保 LaTeX 环境能够正常输入中文，可通过配置合适的中文字体和宏包来实现，如 xeCJK 宏包等。

**代码插入**：在报告中若需要展示地震数据处理代码，应使用 LaTeX 的代码环境（如 minted 宏包提供的环境），对代码进行清晰的排版，区分代码中的不同元素（如关键字、变量名、注释等），并为代码添加必要的注释，解释关键代码行的功能。

**图片插入**：按照上述实验结果图说明部分的要求，正确插入实验图像。使用 LaTeX 的图形插入命令（如 graphicx 宏包的 \includegraphics 命令），设置好图像的路径、大小等参数，确保图像在报告中的布局合理、美观。

**完整报告框架**：报告应包含封面（注明课程名称、实验名称、姓名、学号等信息）、目录（自动生成，能准确反映报告各章节内容及页码）、正文（按照上述实验标题、实验内容和要求、实验数据和函数说明、实验结果图说明、实验总结等结构进行组织）、参考文献（列出实验过程中引用的所有文献资料）等部分，形成一个完整、规范的课程实验报告。

## 模板

```tex
\documentclass[a4paper, 12pt, AutoFakeBold]{article}
\usepackage{xeCJK} % 支持中文
\usepackage{fontspec}
\usepackage{ctex}  % 支持中文

% 设置中英文主字体
\setCJKmainfont{SimSun} % 设置中文主字体为宋体
\setmainfont{Times New Roman} % 设置英文和其他字符的主字体为 Times New Roman

\usepackage{xcolor} % 颜色
\usepackage{textcomp}
\usepackage{listings} % 插入代码
\usepackage{upgreek}  % 为π等希腊字母提供支持
\usepackage{microtype}
\usepackage{geometry}  % 设置页面边距
\usepackage{graphicx}  % 插入图片
\usepackage{amsmath, amssymb}  % 数学公式
\usepackage{booktabs}  % 表格
\usepackage{hyperref}  % 超链接
\usepackage{cite}  % 引用
\usepackage{dirtree}  % 目录树结构
\usepackage{subcaption} % 支持子图排列

% Configure code listings appearance
\lstset{
    basicstyle          =   \sffamily,          % Base code style
    keywordstyle        =   \bfseries,          % Keyword style (bold)
    commentstyle        =   \rmfamily\itshape,  % Comment style (italic)
    stringstyle         =   \ttfamily,          % String style (monospace)
    flexiblecolumns,                            % Flexible column alignment
    numbers             =   left,               % Line numbers on left
    showspaces          =   false,              % Hide spaces
    numberstyle         =   \footnotesize\ttfamily,% Line number style (small size)
    showstringspaces    =   false,              % Hide string spaces
    captionpos          =   t,                  % Caption at top
    frame               =   lrtb,               % Show frame on all sides
}

% Define MATLAB-specific style with refined color palette
\lstdefinestyle{MATLAB}{
    language        =   MATLAB,                 % Language specification
    basicstyle      =   \footnotesize\ttfamily,    % Base style for MATLAB code
    numberstyle     =   \footnotesize\color{gray!80}\ttfamily, % Subtle line numbers
    keywordstyle    =   \color{rgb:blue,4;cyan,1},  % Rich blue for keywords
    keywordstyle    =   [2] \color{rgb:teal,5;gray,1}, % Muted teal for secondary keywords
    stringstyle     =   \color{rgb:violet,5;red,2},  % Deep violet for strings
    commentstyle    =   \color{rgb:green,5;black,2}\ttfamily, % Forest green for comments
    breaklines      =   true,                   % Enable automatic line breaks
    columns         =   fixed,                  % Fixed-width columns
    basewidth       =   0.5em,                  % Base character width
    backgroundcolor =   \color{gray!5},         % Very light gray background
    emphstyle       =   \color{rgb:orange,5;red,1}\bfseries, % Highlighted code
    frame           =   single,                 % Simple frame
    rulecolor       =   \color{gray!50},        % Subtle frame color
    literate        =   {π}{{$\pi$}}1           % Replace π with proper math symbol
}

\geometry{left=2.5cm, right=2.5cm, top=2.5cm, bottom=2.5cm}

\begin{document}
% 标题信息
\title{\textbf{实验报告标题}}
\author{作者单位及姓名}

\date{}

\maketitle

\section{实验内容}
本实验主要聚焦于[实验主题]，通过[编程环境或工具]实现[实验的主要操作和目标]。实验分为[X]个主要部分：
\begin{enumerate}
    \item \textbf{部分一标题}：[对部分一的简要描述，如数据读取、某种分析等]
    \item \textbf{部分二标题}：[对部分二的简要描述，如数据显示、某种处理等]
\end{enumerate}

\section{实验数据和函数说明}
\subsection{实验数据基本特征}
本实验使用的是[数据格式]的[数据类型]文件（[数据文件名]），这些数据包含了[数据的实际来源或相关背景]。具体特征如下：
\begin{itemize}
    \item \textbf{数据类型}：[具体数据类型描述]，包含[数据的组成部分，如多个样本等]。
    \item \textbf{数据结构}：包含[数据结构的组成部分，如矩阵、结构体等]。其中[某部分]包含[该部分的具体内容描述，如实际数据、属性信息等]。
    \item \textbf{数据规模}：包含[数据规模的描述，如多个数据点等]，每个[数据单元]对应[相关的描述]。
    \item \textbf{关键信息}：包含[关键信息的描述，如坐标、编号等]。
\end{itemize}

\subsection{函数说明}
本实验中使用了多个关键函数，其功能和参数说明如下：
\begin{enumerate}
    \item \textbf{函数一名称(参数)}
          \begin{itemize}
              \item \textbf{功能}：[函数的功能描述]
              \item \textbf{输入}：[输入参数的名称及描述]
              \item \textbf{输出}：[输出结果的名称及描述]
          \end{itemize}

    \item \textbf{函数二名称(参数)}
          \begin{itemize}
              \item \textbf{功能}：[函数的功能描述]
              \item \textbf{输入}：[输入参数的名称及描述]
              \item \textbf{输出}：[输出结果的名称及描述]
          \end{itemize}
    % 可根据实际函数数量添加更多函数说明
\end{enumerate}

\newpage

\section{实验结果图说明}
\subsection{实验部分一结果}
\subsubsection{图一标题}
\begin{figure}[htbp]
    \centering
    \includegraphics[width=0.6\textwidth]{[图片文件名1]}
    \caption{[图片的简要描述]}
    \label{fig:[图片标签1]}
\end{figure}
图\ref{fig:[图片标签1]}展示了[对图的详细描述，如不同变量的关系等]。

\subsubsection{图二标题}
\begin{figure}[htbp]
    \centering
    \includegraphics[width=0.6\textwidth]{[图片文件名2]}
    \caption{[图片的简要描述]}
    \label{fig:[图片标签2]}
\end{figure}
图\ref{fig:[图片标签2]}显示了[对图的详细描述，如某种分布情况等]。
% 可根据实际图片数量添加更多图片说明

\subsection{实验部分二结果}
\subsubsection{图三标题}
\begin{figure}[htbp]
    \centering
    \begin{subfigure}[b]{0.32\textwidth}
        \centering
        \includegraphics[width=\textwidth]{[图片文件名3-1]}
        \caption{[子图1的简要描述]}
        \label{fig:[子图标签3-1]}
    \end{subfigure}
    \hfill
    \begin{subfigure}[b]{0.32\textwidth}
        \centering
        \includegraphics[width=\textwidth]{[图片文件名3-2]}
        \caption{[子图2的简要描述]}
        \label{fig:[子图标签3-2]}
    \end{subfigure}
    \hfill
    \begin{subfigure}[b]{0.32\textwidth}
        \centering
        \includegraphics[width=\textwidth]{[图片文件名3-3]}
        \caption{[子图3的简要描述]}
        \label{fig:[子图标签3-3]}
    \end{subfigure}
    \caption{[整体图的简要描述]}
    \label{fig:[图片标签3]}
\end{figure}
图\ref{fig:[图片标签3]}以[展示方式，如不同模式对比等]展示了[相关内容]，有助于[说明展示的意义或作用]。
% 可根据实际情况添加更多部分和图片说明

\section{实验代码说明}
本实验的[编程环境或语言]代码分为[X]个主要部分，下面给出关键部分的代码说明：
\subsection{实验部分一代码}
\begin{lstlisting}[style=MATLAB, title=\bf 实验部分一主要代码]
% 此处填写实验部分一的相关代码
% 例如数据读取、初步处理等操作的代码
\end{lstlisting}

\subsection{实验部分二代码}
\begin{lstlisting}[style=MATLAB, title=\bf 实验部分二主要代码]
% 此处填写实验部分二的相关代码
% 例如数据显示、进一步处理等操作的代码
\end{lstlisting}
% 可根据实际情况添加更多部分的代码说明

\section{实验总结}
\begin{enumerate}
    \item 成功[总结实验的主要操作，如读取数据、解析信息等]，[描述相关操作的具体成果，如提取了哪些关键信息等]。
    \item 使用[展示方式或工具]展示了[实验数据或结果]，形成了直观对比，理解了[不同展示方式或结果的优缺点]。
    \item 成功实现了[实验的主要目标或处理步骤，如某种转换、分析等]，并通过[相关图表或数据]分析了[实验结果的相关方面，如分布情况等]。
\end{enumerate}

\end{document}

```
