from transformers import AutoTokenizer
import os

FILES_DIR = "../generated/mistral-v0.2/"
OUTPUT_COST = 120 #per milion tokens
MODEL = "gpt-4"

tokenizer = AutoTokenizer.from_pretrained("mistralai/Mistral-7B-Instruct-v0.2")
token_count, file_count = 0, 0

for filename in os.listdir(FILES_DIR):
    file_path= os.path.join(FILES_DIR, filename)
    if os.path.isfile(file_path) and filename.endswith('.robot'):
        with open(file_path, 'r', encoding='utf-8') as file:
            token_count += len(tokenizer(file.read())['input_ids'])
            file_count += 1

def calc_price():
    return (token_count / 1e6) * OUTPUT_COST


print(f"Token count {token_count} in {file_count} files. Estimated output cost {calc_price()}.")
