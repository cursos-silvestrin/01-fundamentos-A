library(testthat)
library(knitr)

# 1. Extração do código
knitr::purl("exercicio_01_A.qmd", output = "codigo_aluno.R", quiet = TRUE)

# 2. Injeção do código no ambiente de teste
source("codigo_aluno.R")

# 3. Testes

test_that("O vetor de grupos foi gerado com a função rep()", {
  show_failure(expect_true(exists("vetor_grupos")))
  show_failure(expect_length(vetor_grupos, 40))
  show_failure(expect_equal(sum(vetor_grupos == 1), 20))
  show_failure(expect_equal(sum(vetor_grupos == 2), 20)) 
})
