
<!-- README.md is generated from README.Rmd. Please edit that file -->

# alchemeR

<!-- badges: start -->

[![R-CMD-check](https://github.com/grousell/alchemeR/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/grousell/alchemeR/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of alchemeR is to provide tools to access Alchemer survey data
from their API and pull into an R environment. More informtion on the
Alchemer API and set up can be found here:
<https://apihelp.alchemer.com/help>

## Installation

You can install the development version of alchemeR from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("grousell/alchemeR")
```

## Example

### List of all surveys:

``` r
library(alchemeR)

all_surveys(
  keyring::key_get("alchemer", "token"),
  keyring::key_get("alchemer", "secret")
  )
```

### Download survey data:

This function downloads a .csv into the working directory. The larger
the data set, the longer the API call can take. This prevents the needs
to constantly make an API call when conducting analyses.

The `survey_name` argument can include folders. For example,
`"data/survey_name"` will save the .csv in the data subfolder.

``` r
library(alchemeR)

fetch_survey(
  "SURVEY_ID", 
  keyring::key_get("alchemer", "token"),
  keyring::key_get("alchemer", "secret"),
  "SURVEY_NAME"
  )

df <- read.csv("survey_data.csv")
```

### Fetch survey data dictionary:

``` r

survey_data_dictionary <- fetch_data_dictionary(
  "SURVEY_ID", 
  keyring::key_get("alchemer", "token"),
  keyring::key_get("alchemer", "secret")
)
```
