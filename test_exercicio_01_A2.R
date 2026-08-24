library(testthat)
library(knitr)

# 1. Extração do código
knitr::purl("exercicio_01_A.qmd", output = "codigo_aluno.R", quiet = TRUE)

# 2. Injeção do código no ambiente de teste
source("codigo_aluno.R")

# 3. Testes

test_that("O vetor de grupos foi gerado com a função rep()", {
  expect_true(exists("vetor_grupos"), info = "O 'vetor_grupos' não foi criado.")
  expect_length(vetor_grupos, 40, info = "O vetor de grupos deve ter 40 elementos (2 grupos de 20).")
  expect_equal(sum(vetor_grupos == 1), 20, info = "Devem existir vinte participantes no grupo 1.")
  expect_equal(sum(vetor_grupos == 2), 20, info = "Devem existir vinte participantes no grupo 2.")
})
