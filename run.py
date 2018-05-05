from nltk.sentiment.vader import SentimentIntensityAnalyzer
import nltk
nltk.download('vader_lexicon')
import pandas as pd
import numpy as np

# list = pd.read_csv('listings_det.csv')
rev = pd.read_csv('reviews_det.csv')
print(rev.head(10))

rev['sentiment'] = np.nan
sid = SentimentIntensityAnalyzer()

for index, row in rev.iterrows():
    review = row['comments']
    sentiment = 0
    try:
        ss = sid.polarity_scores(review)
        sentiment =  ss['compound']
    except:
        pass
    rev.set_value(index, 'sentiment', sentiment)
print(rev.head(10))
rev.to_csv('reviews_det_sentiment.csv')

