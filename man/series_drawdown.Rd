% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/series_drawdown.R
\name{series_drawdown}
\alias{series_drawdown}
\title{Drawdown Returns returns}
\usage{
series_drawdown(series, horizon = "12M", quant = 0.9, type = "arit")
}
\arguments{
\item{series}{data frame series.}

\item{horizon}{Drawdown horizon.}

\item{quant}{Quantile.}

\item{type}{Type of returns: arithmetic (discrete) or log (continuous)}

\item{atribution}{Risk atribution}
}
\value{
Drawdown distribution, and mean, max and conditional drawdown.
}
\description{
Estimates de covariance using weighted averages of products of past returns.
}
