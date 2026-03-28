# Probabilidades y Estadística — UBA

This repo is for studying the Probabilidades y Estadística course at UBA (Universidad de Buenos Aires).

## Purpose
Help resolve practical exercises (prácticas) using the theoretical material and bibliography as reference. Explain concepts clearly for a student learning probability and statistics.

## Directory Structure

- `ProbabilidadesYEstadistica/practica/` — Practical exercises to solve (PDFs)
- `ProbabilidadesYEstadistica/teoricas/` — Theoretical class notes (currently empty)
- `ProbabilidadesYEstadistica/bibliografia/` — Reference books and materials
  - `notas_de_proba-2024.pdf` — Main course notes (2024)
  - `notas_probabilidades.pdf` — Probability notes
  - `TeoricasProbaM2016-Pablo.pdf` — Theoretical classes (Pablo, 2016)
  - `resumen_dist.pdf` — Distribution summary sheet
  - `tabla_normal.pdf` — Normal distribution table
  - `ejer_pensar.pdf` — Exercises to think about
- `ProbabilidadesYEstadistica/clasesPracticas/` — Practical class materials
- `ProbabilidadesYEstadistica/tp/` — Work projects (TPs)
- `ProbabilidadesYEstadistica/programa/` — Course syllabus

## How to Help

- When solving exercises, reference the bibliography PDFs when relevant.
- Show step-by-step solutions — this is for learning, not just getting answers.
- Use standard probability/statistics notation consistent with UBA course materials.
- When a concept is needed, explain it briefly before applying it.
- Answers should be in Spanish unless the user writes in English.

## PDF to Markdown Conversion

When asked to parse a PDF and generate a Markdown file:

- Use the `Read` tool directly on the `.pdf` file — it supports PDFs natively (no Python or external tools needed).
- Save the output as a `.md` file in the same directory as the PDF, with the same base name.
- Preserve all text exactly as it appears in the PDF (Spanish included).
- Convert all mathematical expressions to LaTeX: `$...$` for inline, `$$...$$` for display blocks.
- Use `\binom{n}{k}` for binomial coefficients, `\sum`, `\prod`, `\frac`, etc. for standard notation.
- Use `##` headers for each exercise (e.g. `## Ejercicio 1`).
- Use lettered sub-lists (`a)`, `b)`, ...) for sub-items, matching the original structure.
- For figures or diagrams described in the PDF, add a brief italicized description in parentheses since images cannot be embedded.
- Do not add solutions, explanations, or extra content — only transcribe what is in the PDF.

## Exercise Solution Format

Use this structure for every exercise solution:

1. **¿Por qué es interesante/paradójico?** — Identify and dismantle the wrong intuition before calculating. Explain what makes the problem surprising or tricky.
2. **Idea clave** — Name the resolution strategy explicitly (complement, conditional probability, linearity of expectation, etc.) before applying it.
3. **Resolución paso a paso** — Build the solution one step at a time, justifying each step. Do not jump directly to the general formula.
4. **Fórmulas en LaTeX** — All mathematical expressions must use LaTeX (`$...$` inline or `$$...$$` for blocks). Never write formulas as plain text.
5. **Resultado destacado** — Highlight the final result clearly (e.g. with `\boxed{}`).
6. **Tabla o ejemplos numéricos** — When useful, include a table of values to consolidate intuition or show how the result varies.
7. **Generalización** — Close with the general formula or idea when the problem is a special case of something broader.
