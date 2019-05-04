context("Summary Functions Test")

test_that("aux_mean has a valid parameters and fails with invalid parameters", {
  expect_equal(aux_mean(10, 0.3), 3)
  expect_equal(aux_mean(25, 0.6), 15)
  expect_error(aux_mean(10,"cal"))
  expect_error(aux_mean("cal",-2))

})

test_that("aux_variance has a valid parameters and fails with invalid parameters", {

  expect_equal(aux_variance(10, 0.3), 2.1)
  expect_equal(aux_variance(25, 0.6), 6)
  expect_error(aux_variance(10,"cal"))
  expect_error(aux_variance("cal",-2))
})


test_that("aux_mode has a valid parameters and fails with invalid parameters", {

  expect_equal(aux_mode(10, 0.3), 3)
  expect_equal(aux_mode(25, 0.6), 15)
  expect_error(aux_mode(10,"cal"))
  expect_error(aux_mode("cal",-2))
})


test_that("aux_skewness has a valid parameters and fails with invalid parameters", {

  expect_error(aux_skewness(10,"cal"))
  expect_error(aux_skewness("cal",-2))
  expect_length(aux_skewness(15,0.5),1)
})


test_that("aux_kurtosis has a valid parameters and fails with invalid parameters", {

  expect_error(aux_kurtosis(10,"cal"))
  expect_error(aux_kurtosis("cal",-2))
  expect_equal(aux_kurtosis(20,0.1),0.2)
})
