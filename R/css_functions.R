
css_body <- function(
  color = "black",
  background.color = "white",
  font.family = "Georgia, serif",
  ...) {
  htmltools::css(
    color = color,
    background.color = background.color,
    font.family = font.family,
    ...
  )
}

css_title <- function(text.align = "center", ...) {
  htmltools::css(
    text.align = text.align,
    ...
  )
}

css_complete <- function(
                         color = "green",
                         font.weight = "bold",
                         ...) {
  htmltools::css(
    color = color,
    font.weight = font.weight,
    ...
  )
}

css_progress <- function(
                          height = "1.5em",
                          width = "100%",
                          background.color ="#c9c9c9",
                          position = "relative",
                          color = "black",
                          ...) {
  htmltools::css(
    height = height,
    width = width,
    background.color = background.color,
    position = position,
    color = color,
    ...
  )
}

css_progress_before <- function(
                                content = "attr(datalabel)",
                                font.size = "0.8em",
                                position = "absolute",
                                text.align = "center",
                                top = "5px",
                                left = "0",
                                right = "0",
                                ...) {
  htmltools::css(
    content = content,
    font.size = font.size,
    position = position,
    text.align = text.align,
    top = top,
    left = left,
    right = right,
    ...
  )
}

css_progress_value <- function(
                                background.color = "green",
                                display = "inline-block",
                                height = "100%",
                                ...) {
  htmltools::css(
    background.color = background.color,
    display = display,
    height = height,
    ...
  )
}
