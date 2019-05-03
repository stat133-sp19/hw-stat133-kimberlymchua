context("Context for Summary")

test_that("aux_mean has a valid probability", {

  expect_true(aux_mean(prob = 1))
  expect_true(aux_mean(prob < 1))
  expect_true(aux_mean(prob > 0))
  expect_true(aux_mean(prob = 0))
})

test_that("aux_mean has a valid amount of trials", {

  expect_true(aux_mean(trials > 0))
})

test_that("aux_mean has an invalid amount of trials", {

  expect_error(aux_mean(trials < 0))
})

test_that("aux_mean has an invalid probablity", {

  expect_error(aux_mean(prob > 1))
  expect_error(aux_mean(prob < 0))
})


test_that("aux_variance has a valid probability", {

  expect_true(aux_variance(prob = 1))
  expect_true(aux_variance(prob < 1))
  expect_true(aux_variance(prob > 0))
  expect_true(aux_variance(prob = 0))
})

test_that("aux_variance has a valid amount of trials", {

  expect_true(aux_variance(trials > 0))
})

test_that("aux_variance has an invalid amount of trials", {

  expect_error(aux_variance(trials < 0))
})

test_that("aux_variance has an invalid probablity", {

  expect_error(aux_variance(prob > 1))
  expect_error(aux_variance(prob < 0))
})


test_that("aux_mode has a valid probability", {

  expect_true(aux_mode(prob = 1))
  expect_true(aux_mode(prob < 1))
  expect_true(aux_mode(prob > 0))
  expect_true(aux_mode(prob = 0))
})

test_that("aux_mode has a valid amount of trials", {

  expect_true(aux_mode(trials > 0))
})

test_that("aux_mode has an invalid amount of trials", {

  expect_error(aux_mode(trials < 0))
})

test_that("aux_mode has an invalid probablity", {

  expect_error(aux_mode(prob > 1))
  expect_error(aux_mode(prob < 0))
})


test_that("aux_skewness has a valid probability", {

  expect_true(aux_skewness(prob = 1))
  expect_true(aux_skewness(prob < 1))
  expect_true(aux_skewness(prob > 0))
  expect_true(aux_skewness(prob = 0))
})

test_that("aux_skewness has a valid amount of trials", {

  expect_true(aux_skewness(trials > 0))
})

test_that("aux_skewness has an invalid amount of trials", {

  expect_error(aux_skewness(trials < 0))
})

test_that("aux_skewness has an invalid probablity", {

  expect_error(aux_skewness(prob > 1))
  expect_error(aux_skewness(prob < 0))
})


test_that("aux_kurtosis has a valid probability", {

  expect_true(aux_kurtosis(prob = 1))
  expect_true(aux_kurtosis(prob < 1))
  expect_true(aux_kurtosis(prob > 0))
  expect_true(aux_kurtosis(prob = 0))
})

test_that("aux_kurtosis has a valid amount of trials", {

  expect_true(aux_kurtosis(trials > 0))
})

test_that("aux_skewness has an invalid amount of trials", {

  expect_error(aux_skewness(trials < 0))
})

test_that("aux_skewness has an invalid probablity", {

  expect_error(aux_skewness(prob > 1))
  expect_error(aux_skewness(prob < 0))
})
