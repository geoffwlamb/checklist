% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/checklist_external_functions.R
\name{cl_create}
\alias{cl_create}
\title{Create a Checklist}
\usage{
cl_create(title = "Checklist", tasks = c(), completed = rep(FALSE,
  length(tasks)), sound = FALSE, background.color = tc_get_bg(),
  text.color = tc_get_color(), complete.color = "green",
  font.family = "Georgia, serif", remind = FALSE)
}
\arguments{
\item{title}{String containing the name of the checklist.}

\item{tasks}{Vector containing items to include on the checklist}

\item{completed}{Boolean vector indicating which items have already been
completed. Defaults to FALSE for each item.}

\item{sound}{A Boolean determining whether or not sound should be played
upon task completion. Defaults to FALSE (no sound).}

\item{background.color}{String containing a hex value representing
a color or a recognized named color that determines the
background color of the checklist. Defaults to background color
of current RStudio theme.}

\item{text.color}{String containing a hex value representing a color
or a recognized named color that determines the text color of
the checklist. Defaults to text color of current RStudio theme.}

\item{complete.color}{String containing a hex value representing a color
or a recognized named color that determines the color of completed
items on the checklist. Defaults to green.}

\item{font.family}{String containing the font family to use for
all text on the checklist. Defaults to "Georgia, serif".}

\item{remind}{A logical indicating if a reminder file should be created
with the checklist. Mostly useful if using a checklist for
working on a git commit.}
}
\value{
A Checklist object
}
\description{
This function initializes a checklist option. In the
absence of any customization, it will attempt to pick reasonable
defaults. Customization after initialization is possible using
the cl_set function.
}
\examples{
# create a checklist with default settings
my_checklist <- cl_create()

# create a customized checklist
my_patriotic_checklist <- cl_create(
  title = "My Patriotic Checklist",
  sound = TRUE,
  background.color = "red",
  text.color = "white",
  complete.color = "blue"
)

# create a pre-populated checklist
my_populated_checklist <- cl_create(
  tasks = c("make a checklist", "take over the world"),
  completed = c(TRUE, FALSE)
)

# create a checklist with a reminder file
checklist_with_reminder <- cl_create(remind = TRUE)

}
