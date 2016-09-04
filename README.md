# purrrrrrrrrrrrrrrrrrrrrrrr

[![Travis-CI Build Status](https://travis-ci.org/yutannihilation/purrrrrrrrrrrrrrrrrrrrrrrr.svg?branch=master)](https://travis-ci.org/yutannihilation/purrrrrrrrrrrrrrrrrrrrrrrr)

This package is not related to purrr at all. This package just displays [HTTP Cats](https://http.cat/) for the given status code.

## Installation

```{r}
devtools::install_packages("yutannihilation/purrrrrrrrrrrrrrrrrrrrrrrr")
```

## Usage

```{r}
library(httr)
library(purrrrrrrrrrrrrrrrrrrrrrrr)

# numeric
http_cat(200)

# response object
res <- GET("http://httpbin.org/status/451")
http_cat(res)

# print.response is overriden if purrrrrrrrrrrrrrrrrrrrrrrr is loaded after httr
res
```
