context("Binomial Function Tests")

test_that("bin_choose has valid parameters and fails for invalid parameters", {

  expect_equal(bin_choose(2 , 3), 0.75)
  expect_equal(bin_choose(0 , 1), Inf)
  expect_equal(bin_choose(4 , 5), 0.05208333)
  expect_error(bin_choose(3, 2))
  expect_error(bin_choose(1, 0))
  expect_error(bin_choose(4, 3))

})

test_that("bin_probability has valid parameters and fails for invalid parameters", {

  expect_equal(bin_probability(success = 1, trials = 20, prob = 0.5), 9.536743e-07)
  expect_equal(bin_probability(success = 10, trials = 20, prob = 0.3), 4.596528e-14)
  expect_equal(bin_probability(success = 5, trials = 20, prob = 0.05), 1.206488e-09)
  expect_error(bin_probability(success = 10, trials = 2, prob = 0.5))
  expect_error(bin_probability(success = -1, trials = 2, prob = 0.5))
  expect_error(bin_probability(success = 1, trials = -2, prob = 0.5))

})


test_that("bin_distribution has valid parameters and fails if it has invalid parameters", {

  expect_output(bin_distribution(trials = 10, prob = 0.5), regexp = NA)
  expect_error(bin_distribution(trials = 10, prob = 5))
  expect_error(bin_distribution(trials = -10, prob = 0.5))

})


test_that("bin_cumulative has valid parameters", {

  expect_output(bin_cumulative(trials = 5, prob = 0.1), regexp = NA)
  expect_error(bin_cumulative(trials = -5, prob = 0.1))
  expect_error(bin_cumulative(trials = 5, prob = -0.1))

})
