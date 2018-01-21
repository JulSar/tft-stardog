import requests

print("====== CURL: IMPORT TESTS ======")
print("[INFO] Get transaction id")

headers = {
    'Authorization': 'Basic YWRtaW46YWRtaW4=',
    'Content-Type': 'text/plain',
}

response = requests.post('http://localhost:49160/test/transaction/begin', headers=headers)

print(response.text)
transaction_id = response.text

#graph_uri = 'http://w3c.github.io/rdf-tests/sparql11/data-sparql11/'
graph_uri = 'http://w3c.github.io/rdf-tests/sparql11/data-sparql11/manifest-all.ttl'
print("[INFO] Trying to import URI: {}".format(graph_uri))

headers = {
    'Authorization': 'Basic YWRtaW46YWRtaW4=',
    'Content-Type': 'text/turtle',
}

#data = open('themes.ttl')
url = "http://localhost:49160/test/{}/add?graph-uri={}".format(transaction_id,graph_uri)
response = requests.post(url , headers=headers)
print("[INFO] Querying: {}".format(response.url))
print(response.status_code)

headers = {
    'Authorization': 'Basic YWRtaW46YWRtaW4=',
    'Content-Type': 'text/plain',
}
url = "http://localhost:49160/test/transaction/commit/{}".format(transaction_id)
response = requests.post(url, headers=headers)
print(response.status_code)
