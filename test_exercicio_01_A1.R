library(testthat)
library(knitr)

# 1. Extração do código
knitr::purl("exercicio_01_A.qmd", output = "codigo_aluno.R", quiet = TRUE)

# 2. Injeção do código no ambiente de teste
source("codigo_aluno.R")

# 3. Testes
test_that("Variáveis de parâmetros foram criadas corretamente", {
  expect_true(exists("n_grupos"), info = "A variável 'n_grupos' não foi encontrada.")
  expect_true(exists("n_participante_grupo"), info = "A variável 'n_participante_grupo' não foi encontrada.")
  expect_equal(n_grupos, 2, info = "O número de grupos deve ser exatamente 2.")
  expect_equal(n_participante_grupo, 20, info = "O número de participantes por grupo deve ser 20.")
})
