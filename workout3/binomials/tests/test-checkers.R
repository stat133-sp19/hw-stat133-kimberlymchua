context("Checkers for the Binomial")

test_that("check_prob has valid probability", {

  expect_true(check_prob(prob))
  expect_error(check_prob(prob > 1))
  expect_error(check_prob(prob < 0))
})


test_that("check_trials has a valid number of trials", {

  expect_error(check_trials(trials < 0))
  expect_true(check_trials(trials))
})


test_that("check_success has a valid number of successes and trials", {

  expect_error(check_success(success > trials))
  expect_error(check_success(success > 0))
  expect_true(check_success(success,trial))
})

