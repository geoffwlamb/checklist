context("account package components")

test_that("class initialization and setters exist", {
  expect_true(exists("pub_init", where = "package:checklist", mode = "function"))
  expect_true(exists("pub_set_title", where = "package:checklist", mode = "function"))
  expect_true(exists("pub_set_sound", where = "package:checklist", mode = "function"))
  expect_true(exists("pub_set_background_color", where = "package:checklist", mode = "function"))
  expect_true(exists("pub_set_text_color", where = "package:checklist", mode = "function"))
  expect_true(exists("pub_set_complete_color", where = "package:checklist", mode = "function"))
  expect_true(exists("pub_set_font_family", where = "package:checklist", mode = "function"))
})

test_that("class misc functions exist", {
  expect_true(exists("pub_remind", where = "package:checklist", mode = "function"))
})

test_that("class private functions exist", {
  expect_true(exists("prv_write", where = "package:checklist", mode = "function"))
  expect_true(exists("prv_view", where = "package:checklist", mode = "function"))
})

test_that("class task functions exist", {
  expect_true(exists("pub_add_task", where = "package:checklist", mode = "function"))
  expect_true(exists("pub_edit_task", where = "package:checklist", mode = "function"))
  expect_true(exists("pub_remove_task", where = "package:checklist", mode = "function"))
  expect_true(exists("pub_complete_task", where = "package:checklist", mode = "function"))
  expect_true(exists("pub_uncomplete_task", where = "package:checklist", mode = "function"))
})

test_that("css functions exist", {
  expect_true(exists("css_body", where = "package:checklist", mode = "function"))
  expect_true(exists("css_title", where = "package:checklist", mode = "function"))
  expect_true(exists("css_complete", where = "package:checklist", mode = "function"))
  expect_true(exists("css_progress", where = "package:checklist", mode = "function"))
  expect_true(exists("css_progress_before", where = "package:checklist", mode = "function"))
  expect_true(exists("css_progress_value", where ="package:checklist", mode = "function"))
})

test_that("html functions exist", {
  expect_true(exists("html_task", where ="package:checklist", mode = "function"))
  expect_true(exists("html_title", where ="package:checklist", mode = "function"))
  expect_true(exists("html_progress", where ="package:checklist", mode = "function"))
  expect_true(exists("html_style", where ="package:checklist", mode = "function"))
  expect_true(exists("html_compile", where ="package:checklist", mode = "function"))
})

test_that("theme_codes data and functions exist", {
  expect_true(exists("theme_codes", where = "package:checklist"))
  expect_true(exists("tc_get_bg", where = "package:checklist", mode = "function"))
  expect_true(exists("tc_get_color", where = "package:checklist", mode = "function"))
})

test_that("Checklist class exists", {
  expect_true(exists("Checklist", where = "package:checklist"))
})
