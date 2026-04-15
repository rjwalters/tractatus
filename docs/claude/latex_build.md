# LaTeX Build Convention

**TL;DR**: Always compile LaTeX with `pdflatex -output-directory=.build/`. Never
manually `rm *.aux *.log *.out` between runs.

## Why

The `pub/` and `ip/` workflows iterate on LaTeX documents many times per session
(`/pub-revise`, `/ip-revise`, etc.). The naive flow looks like:

```bash
pdflatex -interaction=nonstopmode paper.tex
pdflatex -interaction=nonstopmode paper.tex     # rerun for refs
rm -f paper.aux paper.log paper.out paper.toc   # cleanup before next edit
```

That last `rm` triggers Claude Code CLI's built-in "potentially destructive
command" warning and interrupts the iteration loop. The warning comes from the
CLI's heuristic, not our `.loom/hooks/guard-destructive.sh` (verified for issue
#4854 — the hook silently allows this command).

The fix is structural: don't drop aux files in the source tree at all. Use
`-output-directory=.build/`, and `.build/` is gitignored repo-wide.

## Convention

```bash
mkdir -p .build
pdflatex -interaction=nonstopmode -output-directory=.build paper.tex
pdflatex -interaction=nonstopmode -output-directory=.build paper.tex
# PDF is at .build/paper.pdf
cp .build/paper.pdf paper.pdf      # if you want the PDF beside the source
```

For documents that use `\includegraphics` with relative paths, set `TEXINPUTS`
so pdflatex can still find figures and shared style files:

```bash
TEXINPUTS=".:../../../docs/templates//:" \
    pdflatex -interaction=nonstopmode -output-directory=.build paper.tex
```

For BibTeX:

```bash
pdflatex -interaction=nonstopmode -output-directory=.build paper.tex
BIBINPUTS=".:" bibtex .build/paper
pdflatex -interaction=nonstopmode -output-directory=.build paper.tex
pdflatex -interaction=nonstopmode -output-directory=.build paper.tex
```

(`bibtex` operates on the `.aux` file inside `.build/`, not the source tree.)

## What's gitignored

The repo `.gitignore` already covers individual aux extensions (`*.aux`,
`*.log`, `*.toc`, `*.fls`, `*.fdb_latexmk`, `*.bbl`, `*.blg`, `*.out`,
`*.synctex.gz`, `*.nav`, `*.snm`, `*.lof`, `*.lot`, `*.vrb`, `*.run.xml`,
`*.bcf`) **and** `.build/` / `**/.build/` directories. You should never need to
add LaTeX-aux entries to a project-local `.gitignore`.

## Hook allowlist (defense in depth)

`.loom/hooks/guard-destructive.sh` also has an explicit allowlist for these
extensions and for `.build/`, so even if a builder script regresses to bare
`rm -f *.aux`, the hook will allow it without falling through the
realpath / repo-root check. See `.loom/tests/test-guard-destructive.sh` for the
LaTeX-cleanup test group.

The hook allowlist does NOT suppress the Claude Code CLI's built-in warning —
that lives outside our process. The only way to avoid the warning entirely is
to stop running `rm -f` on aux files, which is what `-output-directory=.build/`
buys you.

## Existing Makefiles

When you touch a project's LaTeX Makefile (or compile script), migrate it to
the convention:

```make
BUILD := .build
TEX   := paper.tex

all: $(BUILD)/paper.pdf

$(BUILD)/paper.pdf: $(TEX) $(wildcard figures/*.pdf) | $(BUILD)
	pdflatex -interaction=nonstopmode -output-directory=$(BUILD) $(TEX)
	pdflatex -interaction=nonstopmode -output-directory=$(BUILD) $(TEX)

$(BUILD):
	mkdir -p $(BUILD)

clean:
	rm -rf $(BUILD)

.PHONY: all clean
```

`make clean` removes only `.build/`, which is also covered by the hook
allowlist.
