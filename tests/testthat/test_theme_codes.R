context("test theme_codes functionality")

# tc_get_bg ----
test_that("tc_get_bg picks up RStudio theme, if available", {
  if (rstudioapi::isAvailable()) {
    expect_warning(tc_get_bg(), regexp = NA)
  }
  else {
    expect_warning(tc_get_bg())
  }
})

test_that("tc_get_bg returns default with warning when unknown theme argument is provided", {
  expect_warning(tc_get_bg("bad input"))
  expect_equal(tc_get_bg("bad input"), "#FFFFFF")
})

# tc_get_color ----
test_that("tc_get_color picks up RStudio theme, if available", {
  using_rstudio <- Sys.getenv("RStudio")
  if (rstudioapi::isAvailable()) {
    expect_warning(tc_get_color(), regexp = NA)
  }
  else {
    expect_warning(tc_get_color())
  }
})

test_that("tc_get_color returns default with warning when unknown theme argument is provided", {
  expect_warning(tc_get_color("bad input"))
  expect_equal(tc_get_color("bad input"), "#000000")
})

