Context("Context for Binomial")

test_that("bin_choose has valid parameters", {

  expect_equal(bin_choose(2 , 3), 0.75)
  expect_equal(bin_choose(0 , 1), Inf)
  expect_equal(bin_choose(4 , 5), 0.05208333)

})
test_that("bin_choose has invalid parameters", {

  expect_error(bin_choose(3, 2))
  expect_error(bin_choose(1, 0))
  expect_error(bin_choose(4, 3))

})

test_that("bin_probability has valid parameters", {

  expect_equal(bin_probability(1, 2), )
  expect_equal(bin_probability(0, 1))
  expect_equal(bin_probability(1, 0))

})
test_that("bin_probability has invalid parameters", {

  expect_error(bin_probability(7, 6))
  expect_error(bin_probability(-1 , 2))
  expect_error(bin_probability(5 , -2))

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
