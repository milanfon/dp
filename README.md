# LLM RobotFramework test generator

This is repository for program, results and related documents of masters thesis submited by Milan Horínek in 2024 called "Generování jednotkových testů s využitím LLM / LLM based unit test generator".

It's purpose is to define test cases, generate test scripts using LLM and run the generated test suites.

## Prerequisities

This software has to be present for the project to run:
- __Test execution__:
    - OS: "UNIX-like" (Linux, MacOS, WSL)
    - Docker Desktop
    - Python 3.11 or higher
    - Robot Framework with Selenium Library (as Python modules)
    - Chrome or Chromium Driver might be required
    - Display server has to be present (CLI only is not supported)
- __Local LLM runtime__:
    - Using __LM Studio__ project
    - All popular OS supported
    - Hardware - CPU with AVX2 instruction set, 16GB+ DRAM, 6GB+ od VRAM if GPU acceleration used

## Script 

The main program is located in the `test.py` file, which has 3 modes selected by first agument:

- `-n` - Create new test template 
- `-i` - Generate test from template
- `-r` - Run test suite

Create new test template called "specification-1":
```shell
python3 test.py -n specification-1
```

The template is copied from the `templates` directory. It is expected from used to modify the created template, which serves as a prompt for the LLM.

To generate test from template using LLM querying, call:
```shell
python3 test . py -i spec -4 --count 10
```

This step supports multiple additional arguments:
- `--count` - Number of test variations to generate. Default value 1.
- `--manual` - Copy the prompt to clipboard for manual copy and paste to the model interface. Flag, recommended for debugging purposes.
- `--cmd` - Print prompt do standard output. Flag.
- `--compress` - Flag for prompt compression.

To run the test suite, call the program in `-r` mode with value of this attribute containing path to the suite, which can be a valid file or UNIX wildcard to select the whole suite.
```shell
python3 test.py -r "codellama/spec-∗" --name "codellama-runs"
```

You can also pick only certain test files to run. `{}` wildcard notations are not supported.
```shell
python3 test.py -r "openai-gpt-4/spec-[146]-*" --cont_count 2 --name "gpt-4 test runs"
```

There are also optional arguments:
- `--cont_count` - How many variations of test programs should be deployed
- `--name` - Test run identifier

## Configuration

There are 2 places, where configuration for this software is located.

`.env` file or environment variables, where API URL, KEY and MODEL values are stored with max token count.
```shell
API_URL="https://api.mistral.ai/v1"
API_KEY="Zc6nB87qmijn4"
API_MODEL="mistral-large-latest"

MAX_TOKENS=3000
DEVICE="mps"
```

`configuration.py` file, where the config for test runs and result evaluation is stored.
