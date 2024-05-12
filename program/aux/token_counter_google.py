import vertexai
from vertexai.generative_models import GenerativeModel
import os

FILES_DIR = "../generated/gemini-1.5-pro"
OUTPUT_COST = 7.5 #per milion tokens

vertexai.init(project="dp-modely")

model = GenerativeModel(model_name="gemini-1.5-pro-preview-0409")
token_count, file_count = 0, 0

for filename in os.listdir(FILES_DIR):
    file_path= os.path.join(FILES_DIR, filename)
    if os.path.isfile(file_path) and filename.endswith('.robot'):
        with open(file_path, 'r', encoding='utf-8') as file:
            token_count += model.count_tokens(file.read()).total_tokens
            file_count += 1

def calc_price():
    return (token_count / 1e6) * OUTPUT_COST


print(f"Token count {token_count} in {file_count} files. Estimated output cost {calc_price()}.")
