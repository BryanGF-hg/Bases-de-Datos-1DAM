#!/usr/bin/env python3
import json
import urllib.request

OLLAMA_URL = "http://localhost:11434/api/embeddings"
MODEL = "nomic-embed-text:v1.5"
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

embedding = data["embedding"]

print("Embedding length:", len(embedding))
print("Values:", embedding)

contador = 1
for valor in embedding:
 print("El indice",contador,"tiene el valor",valor)
 contador += 1
