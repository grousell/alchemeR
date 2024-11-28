#' Retrieve all surveys in Alchemer
#'
#' @param token
#' Alchemer API token (https://apihelp.alchemer.com/help/authentication)
#'
#' @param secret_key
#' Alchemer API secret key
#'
#' @return
#' Data frame with all Alchemer surveys
#' @export
#'
#' @examples
#' # all_surveys("YOUR-ALCHEMER_TOKEN","YOUR-ALCHEMER_SECRET_KEY")

all_surveys <- function(token, secret_key){

  survey_url <- glue::glue("https://api.alchemer-ca.com/v5/survey/")
  survey_req <- httr2::request(survey_url)

  surveys <- survey_req |>
    httr2::req_url_query(
      `api_token` = token,
      `api_token_secret` = secret_key,
      `resultsperpage` = 250,
      page = 1
    )

  temp_surveys <- jsonlite::fromJSON(surveys$url, flatten = TRUE)

  temp_surveys$data

}

