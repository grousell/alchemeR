#' Fetch Alchemer Survey Data
#'
#' This function retrieves survey data from an Alchemer account and saves a .csv file in a project folder.
#' Requires user to have set up an API with Alchemer, including a token and secret key
#'
#' @param survey_id
#' Alchemer survey number, retrieved from survey URL
#'
#' @param token
#' Alchemer API token (https://apihelp.alchemer.com/help/authentication)
#'
#' @param secret_key
#' Alchemer API secret key
#'
#' @param survey_name
#' Name of survey
#'
#' @return
#' Downloaded file of survey responses
#' @export
#'
#' @examples
#' # alchemer_survey("SURVEY_ID", <YOUR-ALCHEMER_TOKEN>, <YOUR-ALCHEMER_SECRET_KEY>, "SURVEY_NAME")

fetch_survey <- function(survey_id, token, secret_key, survey_name = "survey_data"){

  survey_url <- glue::glue("https://api.alchemer-ca.com/v5/survey/{survey_id}/surveyresponse")
  survey_req <- httr2::request(survey_url)

  for (i in c(1:250)) {

    survey <- survey_req |>
      httr2::req_url_query(
        `api_token` = token,
        `api_token_secret` = secret_key,
        `resultsperpage` = 250,
        page = i
      )

    temp_survey_df <- jsonlite::fromJSON(survey$url, flatten = TRUE)

    if (length(temp_survey_df$data) == 0) {
      break
    } else {
      temp_df <- temp_survey_df$data |>
        dplyr::select(
          c(1, 3:5, 8, 14),
          tidyr::ends_with("answer")
        )
    }

    if(!exists("new_df")){
      new_df <- temp_df
    } else {
      new_df <- new_df |>
        dplyr::bind_rows(temp_df)
    }
  }

  names(new_df) <- stringr::str_replace_all(names(new_df), "survey_data.", "Q")
  names(new_df) <- stringr::str_replace_all(names(new_df), ".answer", "")

  utils::write.csv(
    new_df,
    file = glue::glue("{survey_name}.csv"),
    row.names = FALSE
  )
}


