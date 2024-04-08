import sqlite3
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.colors as mcolors
import seaborn as sns
import re

db_path = '../results/codellama-run.sqlite'

def fetch_data():
    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()
    query = """
    SELECT container, test_name, result
    FROM runs;
    """
    cursor.execute(query)
    rows = cursor.fetchall()
    conn.close()
    return rows

def process_data(rows):
    # Dictionary to hold the counts of PASS results
    data = {}
    for container, test_name, result in rows:
        test_base_name = "-".join(test_name.split("-")[:-1])  # Remove variant number
        if container not in data:
            data[container] = {}
        if test_base_name not in data[container]:
            data[container][test_base_name] = 0
        if result == 'PASS':
            data[container][test_base_name] += 1
    return data

def generate_heatmap(data):
    # Convert data into 2D array
    containers = sorted(data.keys())

    test_sort_key = lambda test: int(re.search(r'-(\d+)$', test).group(1)) if re.search(r'-(\d+)$', test) else 0
    tests = sorted({test for container_data in data.values() for test in container_data.keys()}, key=test_sort_key)
    heatmap_data = np.zeros((len(containers), len(tests)))
    
    for i, container in enumerate(containers):
        for j, test in enumerate(tests):
            heatmap_data[i, j] = data[container].get(test, 0)

    # Generate heatmap
    plt.figure(figsize=(10, 8))
    sns.heatmap(heatmap_data, annot=True, fmt="g", cmap="rocket_r", xticklabels=tests, yticklabels=containers, vmin=0, vmax=10)
    plt.title('Test PASS Count Heatmap')
    plt.xlabel('Test Name')
    plt.ylabel('Container')
    plt.xticks(rotation=90, ha="right")
    plt.tight_layout()
    plt.show()

# Run the script
rows = fetch_data()
data = process_data(rows)
generate_heatmap(data)
