library(testthat)
library(knitr)

# 1. Extração do código
knitr::purl("exercicio_01_A.qmd", output = "codigo_aluno.R", quiet = TRUE)

# 2. Injeção do código no ambiente de teste
source("codigo_aluno.R")

# 3. Testes

test_that("O vetor de participantes é uma sequência correta", {
  expect_true(exists("vetor_participantes"), info = "O 'vetor_participantes' não foi criado.")
  expect_length(vetor_participantes, 40, info = "Devem existir 40 identificadores de participantes.")
  expect_equal(vetor_participantes[40], 40, info = "O último identificador deve ser o número 40.")
})