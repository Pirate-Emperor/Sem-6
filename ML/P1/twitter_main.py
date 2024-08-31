import pandas as pd
from ntscraper import Nitter

# Tweet Info
scraper = Nitter()

path = "D:/Assignment/CLASSROOM/Sem-6/ML/P1/"
searchTerm = "WWE"
tweet_count = 50
tweets = scraper.get_tweets(searchTerm,mode='user',number=tweet_count)

final_tweets = []
for tweet in tweets['tweets']:
	data1 = [tweet['link'],tweet['text'],tweet['user']['name'],tweet['user']['username'],
	tweet['date'],tweet['is-retweet'],tweet['stats']['comments'],tweet['stats']['retweets'],
	tweet['stats']['quotes'],tweet['stats']['likes']]
	final_tweets.append(data1)

data1 = pd.DataFrame(final_tweets,columns=[
	'link','text','name','username','date','is_rt','n_comment','n_rt','n_quote','n_like'])
data1.to_csv(path+'Tweet_' + str(searchTerm) + '.csv',encoding='utf-8-sig',index=False)

tweets = scraper.get_tweets(searchTerm,mode='user',number=tweet_count,since='2017-12-12',until='2018-12-12')

# # Profile Info
# searchTerm = "ppkamigo"
# profiles = scraper.get_profile_info(searchTerm)

# final_profiles = []
# data2 = [profiles['name'],profiles['username'],profiles['bio'],profiles['joined'],
# profiles['stats']['tweets'],profiles['stats']['following'],profiles['stats']['followers'],
# profiles['stats']['likes'],profiles['stats']['media']]
# final_profiles.append(data2)

# data2 = pd.DataFrame(final_profiles,columns=[
# 	'name','username','bio','joined','n_tweet','n_following','n_follower','n_like','n_media'])
# data2.to_csv(path+'Profile' + str(searchTerm) + '.csv',encoding='utf-8-sig',index=False)

