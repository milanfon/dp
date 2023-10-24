## Současný výzkum a programy

1. https://arxiv.org/pdf/2302.06527.pdf
    - Poměrně nový článek 9/23
    - Využívá StarCoder model a starší Open AI
    - Shrnutí
        - __Coverage__: The generated tests achieved a median statement coverage of 70.2% and branch coverage of 52.8%. This is higher than the state-of-the-art feedback-directed JavaScript test generation technique, Nessie, which only achieves 51.3% statement coverage and 25.6% branch coverage.
        - __Adaptiveness__: If a generated test fails, the model can be re-prompted with the failing test and error message, allowing it to fix the test in many cases.
        - __Uniqueness__: 92.8% of the generated tests have less than or equal to 50% similarity with existing tests, indicating that the tests are not just copied from existing databases.
        - __Model Dependence__: The effectiveness of the approach is influenced by the size and training set of the LLM but does not fundamentally depend on the specific model. Tests were also run with other LLMs, showing similar results.
        - __Prompt Components__: All components of the prompts (function signature, documentation, usage examples, etc.) contribute to the effectiveness of the generated tests.
        - __Non-trivial Assertions__: A median of 61.4% of the generated tests contained non-trivial assertions, indicating that the tests are meaningful.
2. https://arxiv.org/pdf/2305.00418.pdf
    - 4/23
3. https://arxiv.org/pdf/2305.06161.pdf
    - StarCoder paper
4. https://kth.diva-portal.org/smash/get/diva2:1778114/FULLTEXT01.pdf
    - Thesis zabývající se AI psaním unit testů pro Javu

## Možný přístup

### LLM

- V současnosti existují open source LLM podporující generování kódu a vhodné pro tyto úlohy
    - __Code Llama__
        - Nejnovjěší z nich (8/23)
        - https://ai.meta.com/blog/code-llama-large-language-model-coding/
    - __StarCoder__
        - https://huggingface.co/blog/starcoder
        - 5/23

- Closed source
    - ChatGPT (je na něm postaven i současný Copilot X)

- Dle Lipky
    - Pugin pro browser, co dle uživatele identifikovaných prvků a 
    - Využívající robot framework a Selenium
- Možnost také sestavit test dle specifikace
- Aby běžný uživatel to mohl používat

## Struktura

1. Research
    - Publikace
    - Model
        - Otevřený
        - Licence
        - Mohu použít
    - Srovnání současných publikací a jejich výsledků
        - Tabulka
        - Úspěšnost, licence, atd...
