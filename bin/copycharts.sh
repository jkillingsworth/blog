#!/bin/bash

if [ ! -d _site ]; then
    echo "You need to run this from the project root directory."
    exit 1
fi

copychart () {
    postname=${1}
    prefixno=${2}
    filename=${3}

    srcpath=_src/${postname}/build
    dstpath=_assets/${postname}
    srcfile=${srcpath}/${filename}
    dstfile=${dstpath}/${prefixno}-${filename}

    if [ ! -f ${dstfile} ]; then
        mkdir -p ${dstpath} && cp ${srcfile} ${dstfile}
    fi
}

post="2018-04-23-fixed-fractions-and-fair-games"

copychart ${post} fig-06 constant-add-lin-sim.svg
copychart ${post} fig-07 constant-add-lin-avg.svg
copychart ${post} fig-08 constant-add-lin-med.svg
copychart ${post} fig-15 fraction-add-lin-sim.svg
copychart ${post} fig-16 fraction-add-log-sim.svg
copychart ${post} fig-17 fraction-add-lin-avg.svg
copychart ${post} fig-18 fraction-add-lin-med.svg
copychart ${post} fig-19 fraction-add-log-med.svg

post="2018-07-24-linear-and-log-scale-distributions"

copychart ${post} fig-01 stochastic-constant-add-lin.svg
copychart ${post} fig-06 exhaustive-constant-add-lin.svg
copychart ${post} fig-08 exhaustive-fraction-add-lin.svg
copychart ${post} fig-09 exhaustive-fraction-add-log.svg
copychart ${post} fig-14 exhaustive-fraction-mul-lin.svg
copychart ${post} fig-15 exhaustive-fraction-mul-log.svg

post="2018-09-21-least-squares-moving-averages"

copychart ${post} fig-03 simple-MSFT-full.svg
copychart ${post} fig-04 simple-MSFT-zoom.svg
copychart ${post} fig-05 simple-WYNN-full.svg
copychart ${post} fig-06 simple-WYNN-zoom.svg
copychart ${post} fig-07 simple-HEAR-full.svg
copychart ${post} fig-08 simple-HEAR-zoom.svg
copychart ${post} fig-11 lsrlin-MSFT-full.svg
copychart ${post} fig-12 lsrlin-MSFT-zoom.svg
copychart ${post} fig-13 lsrlin-WYNN-full.svg
copychart ${post} fig-14 lsrlin-WYNN-zoom.svg
copychart ${post} fig-15 lsrlin-HEAR-full.svg
copychart ${post} fig-16 lsrlin-HEAR-zoom.svg
copychart ${post} fig-19 lsrpol-MSFT-full.svg
copychart ${post} fig-20 lsrpol-MSFT-zoom.svg
copychart ${post} fig-21 lsrpol-WYNN-full.svg
copychart ${post} fig-22 lsrpol-WYNN-zoom.svg
copychart ${post} fig-23 lsrpol-HEAR-full.svg
copychart ${post} fig-24 lsrpol-HEAR-zoom.svg
copychart ${post} fig-31 lsrexp-MSFT-full.svg
copychart ${post} fig-32 lsrexp-MSFT-zoom.svg
copychart ${post} fig-33 lsrexp-WYNN-full.svg
copychart ${post} fig-34 lsrexp-WYNN-zoom.svg
copychart ${post} fig-35 lsrexp-HEAR-full.svg
copychart ${post} fig-36 lsrexp-HEAR-zoom.svg

post="2018-11-15-normal-and-laplace-distributions"

copychart ${post} fig-16 log-likelihood-laplace-e.svg
copychart ${post} fig-17 log-likelihood-laplace-o.svg
copychart ${post} fig-21 distributions-lin.svg
copychart ${post} fig-22 distributions-log.svg

post="2018-11-18-distributions-on-a-logarithmic-scale"

copychart ${post} fig-23 distributions-lin.svg
copychart ${post} fig-24 distributions-log.svg

post="2019-01-26-the-distribution-of-price-fluctuations"

copychart ${post} fig-01 stocks-daily-SPY-price.svg
copychart ${post} fig-02 stocks-daily-SPY-diffs.svg
copychart ${post} fig-03 stocks-daily-SPY-probs.svg
copychart ${post} fig-04 stocks-daily-DIA-probs.svg
copychart ${post} fig-05 stocks-daily-EEM-probs.svg
copychart ${post} fig-06 stocks-daily-GLD-probs.svg
copychart ${post} fig-07 stocks-daily-HYG-probs.svg
copychart ${post} fig-08 stocks-daily-LQD-probs.svg
copychart ${post} fig-09 stocks-daily-TLT-probs.svg
copychart ${post} fig-10 stocks-daily-UNG-probs.svg
copychart ${post} fig-11 stocks-daily-USO-probs.svg
copychart ${post} fig-12 stocks-daily-AMZN-probs.svg
copychart ${post} fig-13 stocks-daily-AZO-probs.svg
copychart ${post} fig-14 stocks-daily-BLK-probs.svg
copychart ${post} fig-15 stocks-daily-CAT-probs.svg
copychart ${post} fig-16 stocks-daily-CMG-probs.svg
copychart ${post} fig-17 stocks-daily-FDX-probs.svg
copychart ${post} fig-18 stocks-daily-GM-probs.svg
copychart ${post} fig-19 stocks-daily-GOOG-probs.svg
copychart ${post} fig-20 stocks-daily-GWW-probs.svg
copychart ${post} fig-21 stocks-daily-HUM-probs.svg
copychart ${post} fig-22 stocks-daily-NFLX-probs.svg
copychart ${post} fig-23 stocks-daily-TSLA-probs.svg
copychart ${post} fig-24 stocks-daily-TWLO-probs.svg
copychart ${post} fig-25 stocks-daily-ULTA-probs.svg
copychart ${post} fig-26 stocks-daily-UNH-probs.svg
copychart ${post} fig-27 stocks-intraday-AMZN-probs.svg
copychart ${post} fig-28 stocks-intraday-AZO-probs.svg
copychart ${post} fig-29 stocks-intraday-BLK-probs.svg
copychart ${post} fig-30 stocks-intraday-CAT-probs.svg
copychart ${post} fig-31 stocks-intraday-CMG-probs.svg
copychart ${post} fig-32 stocks-intraday-FDX-probs.svg
copychart ${post} fig-33 stocks-intraday-GM-probs.svg
copychart ${post} fig-34 stocks-intraday-GOOG-probs.svg
copychart ${post} fig-35 stocks-intraday-GWW-probs.svg
copychart ${post} fig-36 stocks-intraday-HUM-probs.svg
copychart ${post} fig-37 stocks-intraday-NFLX-probs.svg
copychart ${post} fig-38 stocks-intraday-TSLA-probs.svg
copychart ${post} fig-39 stocks-intraday-TWLO-probs.svg
copychart ${post} fig-40 stocks-intraday-ULTA-probs.svg
copychart ${post} fig-41 stocks-intraday-UNH-probs.svg
copychart ${post} fig-42 stocks-daily-VIX-price.svg
copychart ${post} fig-43 stocks-daily-VIX-diffs.svg
copychart ${post} fig-44 stocks-daily-VIX-probs.svg
copychart ${post} fig-45 stocks-intraday-VIX-probs.svg
copychart ${post} fig-46 forex-daily-EURUSD-price.svg
copychart ${post} fig-47 forex-daily-EURUSD-diffs.svg
copychart ${post} fig-48 forex-daily-EURUSD-probs.svg
copychart ${post} fig-49 forex-daily-USDJPY-probs.svg
copychart ${post} fig-50 forex-daily-USDMXN-probs.svg
copychart ${post} fig-51 forex-daily-USDRUB-probs.svg
copychart ${post} fig-52 forex-daily-USDTRY-probs.svg
copychart ${post} fig-53 forex-daily-USDZAR-probs.svg
copychart ${post} fig-54 forex-daily-EURNOK-probs.svg
copychart ${post} fig-55 forex-daily-EURSEK-probs.svg
copychart ${post} fig-56 forex-daily-EURTRY-probs.svg
copychart ${post} fig-57 forex-intraday-USDJPY-probs.svg
copychart ${post} fig-58 forex-intraday-USDMXN-probs.svg
copychart ${post} fig-59 forex-intraday-USDRUB-probs.svg
copychart ${post} fig-60 forex-intraday-USDTRY-probs.svg
copychart ${post} fig-61 forex-intraday-USDZAR-probs.svg
copychart ${post} fig-62 forex-intraday-EURNOK-probs.svg
copychart ${post} fig-63 forex-intraday-EURSEK-probs.svg
copychart ${post} fig-64 forex-intraday-EURTRY-probs.svg
copychart ${post} fig-65 crypto-daily-BTC-probs.svg
copychart ${post} fig-66 crypto-daily-ETH-probs.svg
copychart ${post} fig-67 crypto-daily-XRP-probs.svg

post="2019-02-10-the-very-strange-chinese-yuan"

copychart ${post} fig-01 forex-intraday-USDCNY-price-lin.svg
copychart ${post} fig-02 forex-intraday-USDCNY-probs-lin.svg
copychart ${post} fig-03 forex-intraday-USDCNY-probs-log.svg
copychart ${post} fig-04 forex-intraday-USDCNH-price-lin.svg
copychart ${post} fig-05 forex-intraday-USDCNH-probs-lin.svg
copychart ${post} fig-06 forex-intraday-USDCNH-probs-log.svg
copychart ${post} fig-07 forex-intraday-EURCNH-price-lin.svg
copychart ${post} fig-08 forex-intraday-EURCNH-probs-lin.svg
copychart ${post} fig-09 forex-intraday-EURCNH-probs-log.svg
copychart ${post} fig-10 pair-synthetic-USDCNH-price-lin.svg
copychart ${post} fig-11 pair-synthetic-USDCNH-probs-lin.svg
copychart ${post} fig-12 pair-synthetic-USDCNH-probs-log.svg
copychart ${post} fig-13 forex-daily-USDCNY-probs-lin.svg
copychart ${post} fig-14 forex-daily-USDCNY-probs-log.svg
copychart ${post} fig-15 forex-daily-USDCNH-probs-lin.svg
copychart ${post} fig-16 forex-daily-USDCNH-probs-log.svg

post="2019-05-24-separating-signal-from-noise"

copychart ${post} fig-01 stocks-daily-SPY-price.svg
copychart ${post} fig-02 stocks-daily-SPY-noise.svg
copychart ${post} fig-03 stocks-daily-SPY-probs-market.svg
copychart ${post} fig-04 stocks-daily-SPY-probs-smooth.svg
copychart ${post} fig-05 stocks-daily-SPY-probs-dither.svg
copychart ${post} fig-06 stocks-intraday-SPY-price.svg
copychart ${post} fig-07 stocks-intraday-SPY-noise.svg
copychart ${post} fig-08 stocks-intraday-SPY-probs-market.svg
copychart ${post} fig-09 stocks-intraday-SPY-probs-smooth.svg
copychart ${post} fig-10 stocks-intraday-SPY-probs-dither.svg
copychart ${post} fig-11 forex-daily-USDJPY-price.svg
copychart ${post} fig-12 forex-daily-USDJPY-noise.svg
copychart ${post} fig-13 forex-daily-USDJPY-probs-market.svg
copychart ${post} fig-14 forex-daily-USDJPY-probs-smooth.svg
copychart ${post} fig-15 forex-daily-USDJPY-probs-dither.svg
copychart ${post} fig-16 forex-intraday-USDCNH-price.svg
copychart ${post} fig-17 forex-intraday-USDCNH-noise.svg
copychart ${post} fig-18 forex-intraday-USDCNH-probs-market.svg
copychart ${post} fig-19 forex-intraday-USDCNH-probs-smooth.svg
copychart ${post} fig-20 forex-intraday-USDCNH-probs-dither.svg
copychart ${post} fig-21 crypto-daily-BTC-price.svg
copychart ${post} fig-22 crypto-daily-BTC-noise.svg
copychart ${post} fig-23 crypto-daily-BTC-probs-market.svg
copychart ${post} fig-24 crypto-daily-BTC-probs-smooth.svg
copychart ${post} fig-25 crypto-daily-BTC-probs-dither.svg

post="2019-09-14-estimating-the-weights-of-biased-coins"

copychart ${post} fig-04 binomial-equal-biases.svg
copychart ${post} fig-05 binomial-equal-pmfunc-simulated.svg
copychart ${post} fig-06 binomial-equal-tosses-simulated.svg
copychart ${post} fig-15 binomial-equal-pmfunc-evaluated.svg
copychart ${post} fig-16 binomial-equal-tosses-evaluated.svg
copychart ${post} fig-30 binomial-lower-biases.svg
copychart ${post} fig-31 binomial-lower-pmfunc-evaluated.svg
copychart ${post} fig-32 binomial-lower-tosses-evaluated.svg
copychart ${post} fig-36 binomial-upper-biases.svg
copychart ${post} fig-37 binomial-upper-pmfunc-evaluated.svg
copychart ${post} fig-38 binomial-upper-tosses-evaluated.svg
copychart ${post} fig-41 triangle-learn-pmfunc.svg
copychart ${post} fig-42 triangle-learn-biases-lower.svg
copychart ${post} fig-43 triangle-learn-biases-upper.svg
copychart ${post} fig-45 triangle-learn-biases-estimated.svg
copychart ${post} fig-47 exponential-05-pmfunc.svg
copychart ${post} fig-48 exponential-05-biases-lower.svg
copychart ${post} fig-49 exponential-05-biases-upper.svg
copychart ${post} fig-50 exponential-05-biases-estimated.svg
copychart ${post} fig-52 exponential-04-pmfunc.svg
copychart ${post} fig-53 exponential-04-biases-lower.svg
copychart ${post} fig-54 exponential-04-biases-upper.svg
copychart ${post} fig-55 exponential-04-biases-estimated.svg
copychart ${post} fig-57 exponential-03-pmfunc.svg
copychart ${post} fig-58 exponential-03-biases-lower.svg
copychart ${post} fig-59 exponential-03-biases-upper.svg
copychart ${post} fig-60 exponential-03-biases-estimated.svg

post="2019-11-14-hill-climbing-and-cost-functions"

copychart ${post} fig-01 target-pmfunc.svg
copychart ${post} fig-03 estimate-equal-05-begin-biases.svg
copychart ${post} fig-11 estimate-equal-05-final-biases.svg
copychart ${post} fig-12 target-pmfunc.svg
copychart ${post} fig-13 estimate-slope-02-begin-biases.svg
copychart ${post} fig-14 estimate-slope-02-final-biases.svg
copychart ${post} fig-15 climb-hill-east.svg
copychart ${post} fig-16 climb-hill-west.svg
copychart ${post} fig-17 climb-plat-east.svg
copychart ${post} fig-18 climb-plat-west.svg
copychart ${post} fig-21 estimate-equal-05-final-biases.svg
copychart ${post} fig-23 estimate-slope-02-final-biases.svg
copychart ${post} fig-30 optimize-score-A-scores.svg
copychart ${post} fig-32 optimize-score-A-biases.svg
copychart ${post} fig-33 optimize-score-B-scores.svg
copychart ${post} fig-35 optimize-score-B-biases.svg