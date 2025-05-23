% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/all_surveys.R
\name{all_surveys}
\alias{all_surveys}
\title{Retrieve all surveys in Alchemer}
\usage{
all_surveys(token, secret_key)
}
\arguments{
\item{token}{Alchemer API token (https://apihelp.alchemer.com/help/authentication)}

\item{secret_key}{Alchemer API secret key}
}
\value{
Data frame with all Alchemer surveys
}
\description{
Retrieve all surveys in Alchemer
}
\examples{
# all_surveys("YOUR-ALCHEMER_TOKEN","YOUR-ALCHEMER_SECRET_KEY")
}
