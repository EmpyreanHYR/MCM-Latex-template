<!--
 * @Author: HuangYaorong 133381452+EmpyreanHYR@users.noreply.github.com
 * @Date: 2025-11-13 18:43:42
 * @LastEditors: HuangYaorong 133381452+EmpyreanHYR@users.noreply.github.com
 * @LastEditTime: 2026-01-28 11:49:12
 * @FilePath: \MCM-Latex-template\README.md
 * @Description: 
 * 
 * Copyright (c) 2026 by HUANG Y. R. , All Rights Reserved. 
-->
# MCM-Latex-template

MCM（数学建模竞赛）/ICM（交叉学科建模竞赛）论文 LaTeX 模板（基于 EasyMCM 扩展）。

## 功能特点

- 模块化章节：0–10 号文件便于增删调整
- 智能引用：`cleveref` 支持 `\cref` 自动带前缀（图/表/公式）
- 全局表格行高：`\arraystretch=1.3`，表注左对齐小号字体
- 参考文献格式：编号居中对齐方括号，行距适中
- AI 工具声明：独立页眉样式，页码显示但不计入总页数，可出现在目录/书签
- 代码高亮：Python、MATLAB 样式；AI 报告内代码块不显示 Listing 标题

## 目录结构

```
MCM-Latex-template/
├── MCM-main.tex           # 主文档
├── easymcm.sty            # 模板宏包（含 AI 声明样式）
├── texfile/
│   ├── 0abstract.tex
│   ├── 1ProblemRestatement.tex
│   ├── 2ProblemAnalysis.tex          # 如不需要可在主文件注释掉
│   ├── 3AssumptionAndNotations.tex
│   ├── 4DataPreprocessing.tex
│   ├── 5ModelBuilding.tex
│   ├── 6SensitivityAndErrorAnalysis.tex
│   ├── 7ModelEvaluation.tex
│   ├── 8Reference.tex
│   ├── 9Appendix.tex                  # 可选附录
│   └── 10AIToolDeclaration.tex        # 可选 AI 工具声明
├── texfile/figures/        # 图片目录
├── code/                   # 代码示例
│   ├── code_example.py
│   ├── code_example.m
│   └── 参考文献条目生成.py
├── README.md
└── LICENSE
```

## 使用说明

1. 在 `MCM-main.tex` 中设置队伍号、题号、标题：

   - 队伍号：`\usepackage[123456]{easymcm}`
   - 题号：`\problem{C}`
   - 标题：`\title{...}`
2. 根据需要编辑/启用章节：在主文件中注释或取消注释 `\input{texfile/...}`。
3. 图片放入 `texfile/figures/`，代码示例放入 `code/`。
4. 可选部分：

   - 附录：取消 `\input{texfile/9Appendix}` 注释
   - AI 声明：取消 `\input{texfile/10AIToolDeclaration}` 注释
     - 总页数计数到 `\label{LastPage}` 前（即正文+参考文献/附录），AI 部分页码显示但不计入总页数。
5. 如果要启用附录 `9Appendix.tex`，请将 `8Reference.tex`的最后一页的设置进入注释
   ```
   % \clearpage
   %\label{MyLastPage}
   ```



## 编译

```bash
xelatex MCM-main.tex
bibtex MCM-main
xelatex MCM-main.tex
xelatex MCM-main.tex
```

或使用 TeXstudio、Overleaf 等。

## 注意

- 章节内容为英文；中文注释保留便于理解
- 智能引用请使用 `\cref{}`
- AI 报告中的代码块已移除 Listing 标题

## 许可证

详见 LICENSE
