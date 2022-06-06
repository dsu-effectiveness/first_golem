#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {

  litera <- bslib::bs_theme(bootswatch = "litera",
                     bg = "#FFFFFF", fg = "#000",
                     primary = "#B5302A",
                     base_font = bslib::font_google("Source Serif Pro"),
                     heading_font = bslib::font_google("Josefin Sans", wght = 100))

  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    navbarPage(
      theme = litera,
      title = div(style = 'text-align: justify; width:150;',
                  tags$img(
                    style = 'display: block;
                       margin-left:-20px;
                       margin-top:-10px;
                       margin-bottom:-20px',
                    src = "www/ie_logo.png",
                    width="170",
                    height="50",
                    alt="UT Data"
                  )
      ),
      tabPanel("Historical", HTML('Here is the point in time graph')),
      tabPanel("Enrollment Funnel", HTML('Here is the enrollment funnel')),
      tabPanel("Headcount", HTML("Here is the headcount information."))
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "first_golem"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
