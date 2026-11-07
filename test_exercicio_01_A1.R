library(testthat)
library(knitr)

# 1. Extração do código
knitr::purl("exercicio_01_A.qmd", output = "codigo_aluno.R", quiet = TRUE)

# 2. Injeção do código no ambiente de teste
source("codigo_aluno.R")

# 3. Testes
test_that("Variáveis de parâmetros foram criadas corretamente", {
  show_failure(expect_true(exists("n_grupos")))
  show_failure(expect_true(exists("n_participante_grupo")))
  show_failure(expect_equal(n_grupos, 2))
  show_failure(expect_equal(n_participante_grupo, 20))
})
