# importing the requests library
import requests
import json

# defining the api-endpoint
API_ENDPOINT = "http://172.104.59.169:15672/api/exchanges/%2f/webex/publish"

# your source code here

headers = {'content-type': 'application/json'}
# data to be sent to api

pdata = {'properties':{},'routing_key':'webq1','payload':'90.4','payload_encoding':'string'}

# sending post request and saving response as response object
r = requests.post(url = API_ENDPOINT ,auth=('pete', 'pete'), json = pdata, headers=headers)

# extracting response text
pastebin_url = r.text
print("Response :%s"%pastebin_url)
