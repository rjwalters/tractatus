#!/usr/bin/env python3
"""Tier diagram for the world-model spectrum (Figure 1).

Poset of constraint tiers under refinement, with the free model at the
top and the exclusion/Horn incomparability (exclusion_not_horn) marked.
"""
import matplotlib

matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib.patches import FancyArrowPatch, FancyBboxPatch

fig, ax = plt.subplots(figsize=(7.0, 4.6))
ax.set_xlim(0, 10)
ax.set_ylim(0, 10)
ax.axis("off")

BOX = dict(boxstyle="round,pad=0.42", linewidth=1.1, facecolor="white", edgecolor="black")


def node(x, y, lines, fs=9.5):
    ax.text(x, y, "\n".join(lines), ha="center", va="center", fontsize=fs,
            bbox=BOX, family="serif")


def arrow(x1, y1, x2, y2, style="-", lw=1.0):
    ax.add_patch(FancyArrowPatch((x1, y1), (x2, y2), arrowstyle="-|>",
                                 mutation_scale=13, linewidth=lw,
                                 linestyle=style, color="black",
                                 shrinkA=26, shrinkB=26))


# Nodes
node(5.0, 8.9, [r"$\mathrm{freeModel}\ S$", "full independence: every profile realized"])
node(2.6, 5.9, [r"$\mathrm{HornModel}\ S\ cs$", r"positive implications $w\,a \to w\,b$",
                r"top world realizable"])
node(7.4, 5.9, [r"$\mathrm{ExclusionModel}\ S\ cs$", r"exclusions $\neg(w\,a \wedge w\,b)$",
                r"top world blocked"])
node(2.6, 2.9, [r"$\mathrm{EquivModel}\ S\ cs$", "biconditional constraints"])
node(7.4, 2.9, [r"$\mathrm{colorModel}$", r"$\neg(\mathrm{red}\wedge\mathrm{green})$ — TLP 6.3751"])
node(5.0, 0.75, [r"$\mathrm{pointModel}\ w$", "a single profile"], fs=9)

# Refinement arrows (upward = Refines)
arrow(3.1, 6.75, 4.5, 8.35)
arrow(6.9, 6.75, 5.5, 8.35)
arrow(2.6, 3.75, 2.6, 5.05)
arrow(7.4, 3.75, 7.4, 5.05)
arrow(4.2, 1.35, 2.9, 2.2)
arrow(5.8, 1.35, 7.1, 2.2)

# Incomparability marker between Horn and Exclusion tiers
ax.plot([4.35, 5.65], [5.9, 5.9], linestyle=(0, (2, 3)), color="black", linewidth=1.0)
ax.text(5.0, 6.55, "no refinement\nequivalence", ha="center", va="bottom", fontsize=8.2,
        style="italic", family="serif")
ax.text(5.0, 5.25, "exclusion_not_horn", ha="center", va="top", fontsize=8.0,
        family="monospace")

ax.text(0.35, 8.9, "more\nfree", ha="center", va="center", fontsize=8, style="italic",
        family="serif")
ax.text(0.35, 0.9, "more\nconstrained", ha="center", va="center", fontsize=8,
        style="italic", family="serif")
ax.annotate("", xy=(0.35, 7.9), xytext=(0.35, 2.0),
            arrowprops=dict(arrowstyle="-|>", linewidth=0.9, color="black"))

fig.tight_layout()
out = __file__.rsplit("/", 2)[0] + "/figures/spectrum.pdf"
fig.savefig(out, bbox_inches="tight")
print(f"wrote {out}")
