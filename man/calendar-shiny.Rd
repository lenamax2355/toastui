% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calendar.R
\name{calendar-shiny}
\alias{calendar-shiny}
\alias{calendarOutput}
\alias{renderCalendar}
\title{Shiny bindings for calendar}
\usage{
calendarOutput(outputId, width = "100\%", height = "600px")

renderCalendar(expr, env = parent.frame(), quoted = FALSE)
}
\arguments{
\item{outputId}{output variable to read from}

\item{width, height}{Must be a valid CSS unit (like \code{'100\%'},
\code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
string and have \code{'px'} appended.}

\item{expr}{An expression that generates a calendar}

\item{env}{The environment in which to evaluate \code{expr}.}

\item{quoted}{Is \code{expr} a quoted expression (with \code{quote()})? This
is useful if you want to save an expression in a variable.}
}
\value{
Output element that can be included in UI. Render function to create output in server.
}
\description{
Output and render functions for using calendar within Shiny
applications and interactive Rmd documents.
}
\examples{
library(shiny)
library(toastui)

ui <- fluidPage(
  tags$h2("calendar shiny example"),
  fluidRow(
    column(
      width = 8,
      calendarOutput("my_calendar")
    ),
    column(
      width = 4,
      tags$b("Dates:"),
      verbatimTextOutput("dates"),
      tags$b("Clicked schedule:"),
      verbatimTextOutput("click")
    )
  )
)

server <- function(input, output, session) {
  
  output$my_calendar <- renderCalendar({
    calendar(cal_demo_data(), useNavigation = TRUE) \%>\%
      cal_props(
        list(
          id = 1,
          name = "PERSO",
          color = "white",
          bgColor = "firebrick",
          borderColor = "firebrick"
        ),
        list(
          id = 2,
          name = "WORK",
          color = "white",
          bgColor = "forestgreen",
          borderColor = "forestgreen"
        )
      )
  })
  
  output$dates <- renderPrint({
    input$my_calendar_dates
  })
  
  output$click <- renderPrint({
    input$my_calendar_click
  })
  
}

if (interactive())
  shinyApp(ui, server)
}
