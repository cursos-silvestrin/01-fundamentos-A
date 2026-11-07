library(testthat)
library(knitr)

# 1. Extração do código
knitr::purl("exercicio_01_A.qmd", output = "codigo_aluno.R", quiet = TRUE)

# 2. Injeção do código no ambiente de teste
source("codigo_aluno.R")

# 3. Testes

test_that("O vetor do TCLE reflete as desistências corretamente", {
  show_failure(expect_true(exists("tcle")))
  show_failure(expect_type(tcle, "logical"))
  show_failure(expect_false(tcle[1]))
  show_failure(expect_equal(sum(tcle), 39))
})
