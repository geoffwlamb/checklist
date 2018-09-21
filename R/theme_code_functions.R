
tc_get_bg <- function(theme = rstudioapi::getThemeInfo()$editor) {
  tryCatch(
    expr = {
      if (identical(theme_codes$bg[theme_codes$theme == theme], character(0))) {
        warning("Unrecognized theme. Using default color scheme.")
        return(theme_codes$bg[theme_codes$theme == "default"])
      }
      else {
        return(theme_codes$bg[theme_codes$theme == theme])
      }
    },
    error = function(cond) {
      warning("Couldn't access RStudio api. Using default color scheme.")
      return(theme_codes$bg[theme_codes$theme == "default"])
    }
  )
}

tc_get_color <- function(theme = rstudioapi::getThemeInfo()$editor) {
  tryCatch(
    expr = {
      if (identical(theme_codes$color[theme_codes$theme == theme], character(0))) {
        warning("Unrecognized theme. Using default color scheme.")
        return(theme_codes$color[theme_codes$theme == "default"])
      }
      else {
        return(theme_codes$color[theme_codes$theme == theme])
      }
    },
    error = function(cond) {
      warning("Couldn't access RStudio api. Using default color scheme.")
      return(theme_codes$color[theme_codes$theme == "default"])
    }
  )
}
