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

test_that("O vetor de grupos foi gerado com a função rep()", {
  expect_true(exists("vetor_grupos"), info = "O 'vetor_grupos' não foi criado.")
  expect_length(vetor_grupos, 40, info = "O vetor de grupos deve ter 40 elementos (2 grupos de 20).")
  expect_equal(sum(vetor_grupos == 1), 20, info = "Devem existir vinte participantes no grupo 1.")
  expect_equal(sum(vetor_grupos == 2), 20, info = "Devem existir vinte participantes no grupo 2.")
})

test_that("O vetor do TCLE reflete as desistências corretamente", {
  expect_true(exists("tcle"), info = "O vetor 'tcle' não foi criado.")
  expect_type(tcle, "logical", info = "O vetor 'tcle' deve ser do tipo lógico (TRUE/FALSE).")
  expect_false(tcle[1], info = "O primeiro participante deve ter o TCLE como FALSE.")
  expect_equal(sum(tcle), 39, info = "Os outros 39 participantes devem ter o TCLE como TRUE.")
})

test_that("O vetor de participantes é uma sequência correta", {
  expect_true(exists("vetor_participantes"), info = "O 'vetor_participantes' não foi criado.")
  expect_length(vetor_participantes, 40, info = "Devem existir 40 identificadores de participantes.")
  expect_equal(vetor_participantes[40], 40, info = "O último identificador deve ser o número 40.")
})