library(testthat)
library(knitr)

# 1. Extração do código
knitr::purl("exercicio_01_A.qmd", output = "codigo_aluno.R", quiet = TRUE)

# 2. Injeção do código no ambiente de teste
source("codigo_aluno.R")

# 3. Testes

test_that("O vetor do TCLE reflete as desistências corretamente", {
  expect_true(exists("tcle"), info = "O vetor 'tcle' não foi criado.")
  expect_type(tcle, "logical", info = "O vetor 'tcle' deve ser do tipo lógico (TRUE/FALSE).")
  expect_false(tcle[1], info = "O primeiro participante deve ter o TCLE como FALSE.")
  expect_equal(sum(tcle), 39, info = "Os outros 39 participantes devem ter o TCLE como TRUE.")
})
