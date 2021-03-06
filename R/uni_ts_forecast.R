#' Univariate time series forecast
#'
#' Univariate time series forecast.
#' @param series returns series.
#' @param h number of steps ahead for forecast.
#' @return Model order, coefficients and predictions.
#' @export

uni_ts_forecast <- function(series, h){
  fit <- auto.arima(series, approximation = TRUE, d=0)
  if(length(fit$coef)==0){
    pred_series <- xts(matrix(as.numeric(mean(series)), nrow = h, ncol = 3), order.by = seq(tail(index(series),1), by = 'months', length.out = h + 1)[-1])
  }else{
    pred <- forecast(fit, h)
    pred_series <- xts(cbind(as.numeric(pred$mean), as.numeric(as.matrix(pred$lower)[,2]), as.numeric(as.matrix(pred$upper)[,2])), order.by = seq(tail(index(series),1), by = 'months', length.out = h + 1)[-1])
  }

  names(pred_series) <- c('mean', 'lower95', 'upper95' )
  return(list(series = pred_series, coef = fit$coef))
}
