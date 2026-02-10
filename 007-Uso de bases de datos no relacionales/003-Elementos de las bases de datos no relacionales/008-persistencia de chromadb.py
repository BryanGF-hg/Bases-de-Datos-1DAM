#!/usr/bin/env python3
import os
import json
import urllib.request
import chromadb

# -------- Where will ChromaDB live (ABSOLUTE PATH) --------
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
DB_DIR = os.path.join(BASE_DIR, "chroma_db")
os.makedirs(DB_DIR, exist_ok=True)

print("Script folder:", BASE_DIR)
print("ChromaDB folder:", DB_DIR)

# -------- OLLAMA CONFIG --------
OLLAMA_URL = "http://localhost:11434/api/embeddings"
MODEL = "nomic-embed-text:v1.5"
TEXT = "fresa"

# -------- GET EMBEDDING FROM OLLAMA --------
payload = {"model": MODEL, "prompt": TEXT}

req = urllib.request.Request(
    OLLAMA_URL,
    data=json.dumps(payload).encode("utf-8"),
    headers={"Content-Type": "application/json"},
    method="POST",
)

with urllib.request.urlopen(req) as resp:
    data = json.loads(resp.read().decode("utf-8"))

fresa = data["embedding"]

# -------- CHROMADB (PERSISTENT) --------
client = chromadb.PersistentClient(path=DB_DIR)

collection = client.get_or_create_collection(name="frutas")

collection.add(
    ids=["fresa"],
    embeddings=[fresa],
    documents=["fresa"],
)

print("OK: stored. Files should be under:", DB_DIR)
print("Collection count:", collection.count())

