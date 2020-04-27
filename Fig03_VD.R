### Plotting VD of Sig. SNPs from CMH


install.packages("VennDiagram")

# Making Venn Diagram (4-way) of 7.5 and 7.0 S and V, all against D7 control (8.1S)
library(VennDiagram)

venn.plot <- draw.quad.venn(
  area1 = 24,
  area2 = 34,
  area3 = 602,
  area4 = 253,
  n12 = 4,
  n13 = 6,
  n14 = 6,
  n23 = 6,
  n24 = 1,
  n34 = 106,
  n123 = 1,
  n124 = 1,
  n134 = 4,
  n234 = 1,
  n1234 = 1,
  category = c("7.5 Static", "7.5 Variable", "7.0 Static", "7.0 Variable"),
  fill = c("blue","light blue","red","pink"),
  lty = "dashed",
  cex = 1.5,
  cat.cex = 1.5,
  cat.col = c("blue","light blue","red","pink")
)

grid.draw(venn.plot)