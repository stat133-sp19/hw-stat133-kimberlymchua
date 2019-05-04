context("Checkers Functions Test")

test_that("check_prob has a valid probability", {

  expect_true(check_prob(prob = 1))
  expect_true(check_prob(prob = 0.5))
  expect_true(check_prob(prob = 0.1))
  expect_true(check_prob(prob = 0))
})

test_that("check_prob has an invalid probability", {

  expect_error(check_prob(prob = 1.1))
  expect_error(check_prob(prob = -0.1))

})


test_that("check_trials has a valid number of trials", {

  expect_true(check_trials(trials = 0))
  expect_true(check_trials(trials = 5))
})

test_that("check_trials has an invalid number of trials", {

  expect_error(check_trials(trials = -1))

})


test_that("check_success has a valid number of successes and trials", {

  expect_true(check_success(success = 5,trial = 10))
})

test_that("check_success has an invalid number of successes and trials", {

  expect_error(check_success(success = 20, trials = 4))
  expect_error(check_success(success = -10, trials = 5))

})

