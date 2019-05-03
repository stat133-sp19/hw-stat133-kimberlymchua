context("Context for Binomial")

test_that("bin_choose has valid parameters", {

  expect_true(bin_choose(k < n))
  expect_true(bin_choose(n > 0))
  expect_true(bin_choose(k > 0))

})
test_that("bin_choose has invalid parameters", {

  expect_error(bin_choose(k > n))
  expect_error(bin_choose(k < 0))
  expect_error(bin_choose(n < 0))

})

test_that("bin_probability has valid parameters", {

  expect_true(bin_probability(k < n))
  expect_true(bin_probability(n > 0))
  expect_true(bin_probability(k > 0))

})
test_that("bin_probability has invalid parameters", {

  expect_error(bin_probability(k > n))
  expect_error(bin_probability(k < 0))
  expect_error(bin_probability(n < 0))

})


test_that("bin_distribution has valid parameters", {

  expect_true(bin_distribution(k < n))
  expect_true(bin_distribution(n > 0))
  expect_true(bin_distribution(k > 0))

})
test_that("bin_distribution has invalid parameters", {

  expect_error(bin_distribution(k > n))
  expect_error(bin_distribution(k < 0))
  expect_error(bin_distribution(n < 0))

})


test_that("bin_cumulative has valid parameters", {

  expect_true(bin_cumulative(k < n))
  expect_true(bin_cumulative(n > 0))
  expect_true(bin_cumulative(k > 0))

})
test_that("bin_cumulative has invalid parameters", {

  expect_error(bin_cumulative(k > n))
  expect_error(bin_cumulative(k < 0))
  expect_error(bin_cumulative(n < 0))

})
