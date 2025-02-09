library(ggplot2)
library(gridExtra)
library(factoextra)
library(ggbiplot)
library(corrplot)

pcastat <- prcomp(botany[,c(3:12)], center = TRUE, scale. = TRUE)
eigvalpcastat <- get_eigenvalue(pcastat)
fviz_eig(pcastat, addlabels = TRUE, ylim = c(0, 50))
var = get_pca_var(pcastat) 

a <- fviz_contrib(pcastat, choice = "var", axes = 1)
b <- fviz_contrib(pcastat, choice = "var", axes = 2)

grid.arrange(a, b, ncol=2, top = 'Contribution of the variables to the first two PCs')

fviz_pca_var(pcastat, col.var = "cos2", gradient.cols = c("#a95aa1", "#85c0f9","#0f2080"), repel = TRUE)
fviz_pca_biplot(pcastat, repel = TRUE, col.var = "blue", col.ind = "red")
ggbiplot(pcastat)
View(eigvalpcastat)

ggbiplot(pcastat, ellipse = TRUE, obs.scale = 2, var.scale = 4, choices = c(1,2), groups =
           botany$'pH Treatment') + scale_color_manual(values = c("#a95aa1",
             "#85c0f9","#0f2080")) + theme_classic()
save()