import sqlite3 
import numpy as np 
import matplotlib.pyplot as plt
import seaborn as sns
import re
from configuration import POSITIVE_FAILS
from collections import Counter
import sys
import argparse

parser = argparse.ArgumentParser(description="Statics and plotting")
parser.add_argument('first_arg', type=str, help='Path to DB file')
parser.add_argument('-e', '--export', type=str, help='Export to PDF')
parser.add_argument('-t', '--title', type=str, default='Test correct result heatmap', help='Plot title')
args = parser.parse_args()

db_path = args.first_arg

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
    data = {}
    false_negatives = set()
    for container, test_name, result in rows:
        test_base_name = "-".join(test_name.split("-")[:-1])
        test_number = test_base_name.split("-")[-1]
        positive_fails = POSITIVE_FAILS[test_number]
        correct_result = 'PASS' if container not in positive_fails else 'FAIL'
        if container not in data:
            data[container] = {}
        if test_base_name not in data[container]:
            data[container][test_base_name] = 0
        if container == 'defect-00_free.war' and (result == 'FAIL' or result == 'ERROR'):
            false_negatives.add(test_name)
        if result == correct_result:
            if test_name not in false_negatives:
                data[container][test_base_name] += 1
            elif result == 'PASS':
                data[container][test_base_name] += 1
    ignored_tests = map(lambda t: "-".join(t.split("-")[0:-1]), false_negatives)
    ignored = Counter(ignored_tests)
    return data, ignored

def generate_heatmap(data, ignores):
    # Convert data into 2D array
    containers = sorted(data.keys())

    test_sort_key = lambda test: int(re.search(r'-(\d+)$', test).group(1)) if re.search(r'-(\d+)$', test) else 0
    tests = sorted({test for container_data in data.values() for test in container_data.keys()}, key=test_sort_key)
    heatmap_data = np.zeros((len(containers), len(tests)))
    ignores_sorted = list(map(lambda t: ignores[t], tests))
    
    for i, container in enumerate(containers):
        for j, test in enumerate(tests):
            heatmap_data[i, j] = data[container].get(test, 0)

    # Generate heatmap
    plt.subplots(figsize=(10, 10))
    sns.heatmap(heatmap_data, annot=True, fmt="g", cmap="rocket_r", xticklabels=tests, yticklabels=containers, vmin=0, vmax=10)
    plt.title(args.title)
    plt.xlabel('Test Name')
    plt.ylabel('Container')
    plt.xticks(rotation=90, ha="center")
    plt.tight_layout()

    plt.subplots_adjust(bottom=0.3)

    ax = plt.gca()
    ax.tick_params(axis='x', pad=30)
    table = plt.table(cellText=[ignores_sorted],rowLabels=["Test variants ignored"], loc='bottom', cellLoc='center')
    table.scale(1,2)

    if args.export:
        plt.savefig(args.export, bbox_inches='tight')
        print(f"Plot exported as {args.export}")

    plt.show()

# Run the script
rows = fetch_data()
data, ignores = process_data(rows)
generate_heatmap(data, ignores)
