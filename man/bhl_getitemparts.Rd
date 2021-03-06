% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bhl_getitemparts.R
\name{bhl_getitemparts}
\alias{bhl_getitemparts}
\title{Return a list of an item's parts.}
\usage{
bhl_getitemparts(itemid, as = "table", key = NULL, ...)
}
\arguments{
\item{itemid}{the item id (character)}

\item{as}{(character) Return a list ("list"), json ("json"), xml ("xml"),
or parsed table ("table", default). Note that \code{as="table"} can give
different data format back depending on the function - for example,
sometimes a data.frame and sometimes a character vector.}

\item{key}{Your BHL API key, either enter, or loads from your \code{.Renviron}
as \code{BHL_KEY}
or from \code{.Rprofile} as \code{bhl_key}.}

\item{...}{Curl options passed on to \code{\link[crul:HttpClient]{crul::HttpClient()}}}
}
\description{
Return a list of an item's parts.
}
\examples{
\dontrun{
bhl_getitemparts(35600)
bhl_getitemparts(35600, 'json')
bhl_getitemparts(35600, 'xml')
}
}
