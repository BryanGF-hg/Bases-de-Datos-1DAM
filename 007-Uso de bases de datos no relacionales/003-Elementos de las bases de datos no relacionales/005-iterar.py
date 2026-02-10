#!/usr/bin/env python3
import json
import urllib.request
import math

fresa = []
cereza = []
platano = []

OLLAMA_URL = "http://localhost:11434/api/embeddings"
MODEL = "nomic-embed-text:v1.5"

##### CEREZA #################################
TEXT = "cereza"
payload = {
    "model": MODEL,
    "prompt": TEXT
}
req = urllib.request.Request(
    OLLAMA_URL,
    data=json.dumps(payload).encode("utf-8"),
    headers={"Content-Type": "application/json"},
    method="POST",
)
with urllib.request.urlopen(req) as resp:
    data = json.loads(resp.read().decode("utf-8"))
cereza = data["embedding"]
##### FRESA #################################
TEXT = "fresa"
payload = {
    "model": MODEL,
    "prompt": TEXT
}
req = urllib.request.Request(
    OLLAMA_URL,
    data=json.dumps(payload).encode("utf-8"),
    headers={"Content-Type": "application/json"},
    method="POST",
)
with urllib.request.urlopen(req) as resp:
    data = json.loads(resp.read().decode("utf-8"))
fresa = data["embedding"]
##### PLATANO #################################
TEXT = "platano"
payload = {
    "model": MODEL,
    "prompt": TEXT
}
req = urllib.request.Request(
    OLLAMA_URL,
    data=json.dumps(payload).encode("utf-8"),
    headers={"Content-Type": "application/json"},
    method="POST",
)
with urllib.request.urlopen(req) as resp:
    data = json.loads(resp.read().decode("utf-8"))
platano = data["embedding"]

# AHora itero
parecido = 0
for i in range (0,len(fresa)):
 parecido += abs(fresa[i]-cereza[i])
print(parecido)

parecido = 0
for i in range (0,len(fresa)):
 parecido += abs(fresa[i]-platano[i])
print(parecido)
