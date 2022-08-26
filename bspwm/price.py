from yahooquery import Ticker
import sys
from termcolor import colored

symbols = ['A200.AX', 'VISM.AX', 'QAN.AX']


if len(sys.argv) < 2:
    exit("stock symbol required")

symbol = sys.argv[1]
st = Ticker(symbol)
detail = st.price

print(detail[symbol]["regularMarketPrice"])

# {
#   maxAge: 1,
#   regularMarketChangePercent: 0.0065570693,
#   regularMarketChange: 0.76999664,
#   regularMarketTime: '2022-08-26 11:05:13',
#   priceHint: 2,
#   regularMarketPrice: 118.2,
#   regularMarketDayHigh: 118.2,
#   regularMarketDayLow: 117.63,
#   regularMarketVolume: 6992,
#   regularMarketPreviousClose: 117.43,
#   regularMarketSource: 'DELAYED',
#   regularMarketOpen: 117.96,
#   exchange: 'ASX',
#   exchangeName: 'ASX',
#   exchangeDataDelayedBy: 20,
#   marketState: 'REGULAR',
#   quoteType: 'ETF',
#   symbol: 'A200.AX',
#   underlyingSymbol: false,
#   shortName: 'BETAAUS200 ETF UNITS',
#   longName: 'BetaShares Australia 200 ETF',
#   currency: 'AUD',
#   quoteSourceName: 'Delayed Quote',
#   currencySymbol: 'A$',
#   fromCurrency: false,
#   toCurrency: false,
#   lastMarket: false,
# };

