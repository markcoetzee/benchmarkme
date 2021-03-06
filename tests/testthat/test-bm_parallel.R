test_that("Test bm_parallel", {
  skip_on_cran()
  skip_on_travis()
  
  res = bm_parallel("bm_matrix_cal_power", runs = 2, verbose = TRUE, cores = 1)
  expect_equal(nrow(res), 2)
  expect_equal(ncol(res), 6)
  expect_true(all(res$cores == 1))
  
  res = bm_parallel(bm = "bm_matrix_cal_power", runs = 2, verbose = TRUE, cores = 1:2)
  expect_equal(nrow(res), 4)
  expect_equal(ncol(res), 6)
  expect_equal(c(1,1, 2, 2), res$cores)
  
  res = bm_parallel(bm = "bm_read_io", runs = 2, verbose = FALSE, 
                     cores = 2, size = 5)
  expect_equal(nrow(res), 2)
  expect_equal(ncol(res), 6)
  expect_identical(c(2, 2), res$cores)
})
