---
layout: post
title: Least Squares Moving Averages
---

Moving averages are often overlaid on stock price charts to give a smooth representation of choppy price movements. But a simple moving average can lag significantly in a trending market. In this post, I explore the use of least squares regression methods to generate more accurate moving averages.

<!--excerpt-->

## Simple Moving Average

Let's consider the simple moving average first so that we can use it as a basis for comparison. For each day, the moving average value is computed by taking the average of all past closing prices within a given lookback period. The lookback window shifts forward by one after each new day closes. The following equation illustrates how to compute the simple moving average value at a given point in time:

<figure class="equation">
  {% latex 01 %}
    \begin{aligned}
    & \hat{y}_k = \frac{1}{n} \sum_{i = s}^{k} y_i
    \\[1em]
    &
    \begin{aligned}
    & n && \text{ is the size of the lookback window}
    \\
    & k && \text{ is the point in time for which the value is being computed}
    \\
    & s && \text{ is the starting point, } s = k - n + 1
    \end{aligned}
    \end{aligned}
  {% endlatex %}
</figure>

For the purpose of brevity, the equation above can be represented using the following shorthand notation:

<figure class="equation">
  {% latex 02 %}
    \hat{y} = \frac{\sum y_i}{n}
  {% endlatex %}
</figure>

You can think of this as a constant function for which we estimate the coefficient based on the observed data points within the lookback window. The constant function, if plotted within the bounds of the lookback window, would appear as a horizontal line fitted to the average of all closing prices within the lookback window.

The charts below illustrate what the moving average looks like for three different stock price data sets. The moving averages are computed using a 200 day lookback window. The fitted line is plotted for the final lookback period.

For ticker symbol `MSFT`:

<figure class="fullwide">
  {% chart fig-03-simple-MSFT-full.svg %}
</figure>

<figure class="fullwide">
  {% chart fig-04-simple-MSFT-zoom.svg %}
</figure>

For ticker symbol `WYNN`:

<figure class="fullwide">
  {% chart fig-05-simple-WYNN-full.svg %}
</figure>

<figure class="fullwide">
  {% chart fig-06-simple-WYNN-zoom.svg %}
</figure>

For ticker symbol `HEAR`:

<figure class="fullwide">
  {% chart fig-07-simple-HEAR-full.svg %}
</figure>

<figure class="fullwide">
  {% chart fig-08-simple-HEAR-zoom.svg %}
</figure>

The moving averages are nice and smooth in all three cases, but they fail to accurately track the market prices during uptrends and downtrends. The moving average lags behind the actual price movement. If you look at the fitted lines, you can see that the fit is less than ideal because it's constrained to the form of a constant function.

## Linear Regression

Instead of fitting a constant function to the observed data points, we can instead fit a linear function to the data. A linear model takes the following form:

<figure class="equation">
  {% latex 09 %}
    \hat{y} = a_0 + a_1x
  {% endlatex %}
</figure>

While there are many techniques that can be used to approximate the coefficients, we'll use the method of least squares in this post. You can compute the coefficients using the following formulas:

<figure class="equation">
  {% latex 10 %}
    \begin{aligned}
    & a_1 = \frac{n \sum{x_i y_i} - \sum{x_i} \sum{y_i}}{n \sum{x_i^2} - (\sum{x_i})^2}
    \\[1em]
    & a_0 = \frac{\sum{y_i} - a_1 \sum{x_i}}{n}
    \end{aligned}
  {% endlatex %}
</figure>

Like before, the charts below illustrate what the moving average looks like for the three different stock price data sets. In this case, the moving average values are calculated using least squares linear regression. The fitted line takes the form of a linear function.

For ticker symbol `MSFT`:

<figure class="fullwide">
  {% chart fig-11-lsrlin-MSFT-full.svg %}
</figure>

<figure class="fullwide">
  {% chart fig-12-lsrlin-MSFT-zoom.svg %}
</figure>

For ticker symbol `WYNN`:

<figure class="fullwide">
  {% chart fig-13-lsrlin-WYNN-full.svg %}
</figure>

<figure class="fullwide">
  {% chart fig-14-lsrlin-WYNN-zoom.svg %}
</figure>

For ticker symbol `HEAR`:

<figure class="fullwide">
  {% chart fig-15-lsrlin-HEAR-full.svg %}
</figure>

<figure class="fullwide">
  {% chart fig-16-lsrlin-HEAR-zoom.svg %}
</figure>

The linear least squares moving average tracks the price much better than the simple moving average does, especially during periods when the price is trending up or down. If you look at the fitted line for `MSFT`, you can see how it is almost a perfect fit. The linear model still seems to lag a little but during reversals, however.

## Polynomial Regression

We might be able to track reversals better by fitting a parabola to the observed price data. A parabolic model takes the form of a second order polynomial:

<figure class="equation">
  {% latex 17 %}
    \hat{y} = a_0 + a_1{x} + a_2{x^2}
  {% endlatex %}
</figure>

The least squares coefficients can be found by solving the following matrix equation:

<figure class="equation">
  {% latex 18 %}
    \left[\begin{array}{lll}
    a_0 \\[1em]
    a_1 \\[1em]
    a_2 \\
    \end{array}\right]
    =
    \left[\begin{array}{lll}
    n             & \sum{x_i^{ }} & \sum{x_i^{2}} \\[1em]
    \sum{x_i^{ }} & \sum{x_i^{2}} & \sum{x_i^{3}} \\[1em]
    \sum{x_i^{2}} & \sum{x_i^{3}} & \sum{x_i^{4}} \\
    \end{array}\right]
    ^{-1}
    \left[\begin{array}{lll}
    \sum{y_i}                   \\[1em]
    \sum{x_i^{\phantom{1}} y_i} \\[1em]
    \sum{x_i^{2} y_i}           \\
    \end{array}\right]
  {% endlatex %}
</figure>

While the matrix equation above is arranged specifically for finding the coefficients of a second order polynomial, this technique can be generalized to find the coefficients for higher order polynomials as well. In fact, the generalized form can even be used to find the coefficients for the linear and constant functions described in the previous sections.

Using the same three stock price data sets as before, the charts below illustrate what the moving average looks like when applying least squares regression to a quadratic model. The fitted line takes the shape of a parabolic curve.

For ticker symbol `MSFT`:

<figure class="fullwide">
  {% chart fig-19-lsrpol-MSFT-full.svg %}
</figure>

<figure class="fullwide">
  {% chart fig-20-lsrpol-MSFT-zoom.svg %}
</figure>

For ticker symbol `WYNN`:

<figure class="fullwide">
  {% chart fig-21-lsrpol-WYNN-full.svg %}
</figure>

<figure class="fullwide">
  {% chart fig-22-lsrpol-WYNN-zoom.svg %}
</figure>

For ticker symbol `HEAR`:

<figure class="fullwide">
  {% chart fig-23-lsrpol-HEAR-full.svg %}
</figure>

<figure class="fullwide">
  {% chart fig-24-lsrpol-HEAR-zoom.svg %}
</figure>

Notice that the fitted line for `WYNN` tracks the reversal quite nicely. The moving average computed using second order polynomial regression appears to track the market prices much more tightly than the other methods. The drawback, however, is that the moving average is not quite as smooth.

## Exponential Regression

One of my objectives in this study is to quantitatively recognize and measure sustained trends. If prices are rising or falling by a relatively constant percentage each day, the growth or decay in value is not linear; it is exponential. In this case, it would be appropriate to perform the regression using an exponential model function:

<figure class="equation">
  {% latex 25 %}
    \hat{y}\phantom{'} = p (1 + r)^x
  {% endlatex %}
</figure>

We can estimate the coefficients of the model function using the linear regression technique described previously. To do this, we first need to transform the exponential model above into the form of a linear model:

<figure class="equation">
  {% latex 26 %}
   \hat{y}' = a_0 + a_1{x}
  {% endlatex %}
</figure>

The exponential model can be transformed into the linear form by taking the logarithm of both sides:

<figure class="equation">
  {% latex 27 %}
   \ln{\hat{y}} = \ln{p} + x \ln{(1 + r)}
  {% endlatex %}
</figure>

The following equations illustrate how the parts of the transformed exponential model map to the linear model:

<figure class="equation">
  {% latex 28 %}
    \begin{aligned}
    \hat{y}' &= \ln{\hat{y}}
    \\[1em]
    a_0 &= \ln{p}
    \\[1em]
    a_1 &= \ln{(1 + r)}
    \end{aligned}
  {% endlatex %}
</figure>

The following formulas can then be used to calculate the coefficients for the linear model. These formulas are similar to those defined earlier in the section on linear regression:

<figure class="equation">
  {% latex 29 %}
    \begin{aligned}
    & a_1 = \frac{n \sum{x_i y'_i} - \sum{x_i} \sum{y'_i}}{n \sum{x_i^2} - (\sum{x_i})^2}
    \\[1em]
    & a_0 = \frac{\sum{y'_i} - a_1 \sum{x_i}}{n}
    \end{aligned}
  {% endlatex %}
</figure>

Once the coefficients for the linear model are know, we can use the values to compute the coefficients for the exponential model:

<figure class="equation">
  {% latex 30 %}
    \begin{aligned}
    p &= \mathrm{e}^{a_0}
    \\[1em]
    r &= \mathrm{e}^{a_1} - 1
    \end{aligned}
  {% endlatex %}
</figure>

Once again, the charts below illustrate what the moving average looks like for all three stock price data sets, this time using least squares regression with an exponential model. Note that the fitted line now takes the form of a rising or falling exponential curve.

For ticker symbol `MSFT`:

<figure class="fullwide">
  {% chart fig-31-lsrexp-MSFT-full.svg %}
</figure>

<figure class="fullwide">
  {% chart fig-32-lsrexp-MSFT-zoom.svg %}
</figure>

For ticker symbol `WYNN`:

<figure class="fullwide">
  {% chart fig-33-lsrexp-WYNN-full.svg %}
</figure>

<figure class="fullwide">
  {% chart fig-34-lsrexp-WYNN-zoom.svg %}
</figure>

For ticker symbol `HEAR`:

<figure class="fullwide">
  {% chart fig-35-lsrexp-HEAR-full.svg %}
</figure>

<figure class="fullwide">
  {% chart fig-36-lsrexp-HEAR-zoom.svg %}
</figure>

When performing the regression using the exponential model, the results look very similar to those found using the linear model. While exponential regression might provide a slightly better fit in cases where there is exponential growth or decay, the price tracking can still lag behind during reversals. As the charts for `HEAR` show, the moving average can even overshoot quite a bit in cases where there is a sharp reversal.