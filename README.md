
<!-- README.md is generated from README.Rmd. Please edit that file -->

# alchemeR

<!-- badges: start -->

<!-- badges: end -->

The goal of alchemeR is to provide tools to access Alchemer survey data
from their API and pull into an R ennvironment. More informtion on the
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

``` r
library(alchemeR)

fetch_survey(
  "50269987", 
  keyring::key_get("alchemer", "token"),
  keyring::key_get("alchemer", "secret")
  )

df <- read.csv("survey_data.csv")
```

### Fetch survey data dictionary:

``` r

survey_data_dictionary <- fetch_data_dictionary(
  "50269987", 
  keyring::key_get("alchemer", "token"),
  keyring::key_get("alchemer", "secret")
)
```
