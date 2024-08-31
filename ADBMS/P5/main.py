import pymysql
import networkx as nx

# Connect to MySQL database
db = pymysql.connect(host='localhost', user='root', password='', database='assignment')
cursor = db.cursor()

# Function to build wait-for graph from the database
def build_wait_for_graph():
    query = "SELECT requesting_node, holding_node FROM deadlock_info"
    cursor.execute(query)
    results = cursor.fetchall()

    # Create a directed graph using NetworkX
    wait_for_graph = nx.DiGraph()

    for result in results:
        requesting_node, holding_node = result
        wait_for_graph.add_edge(requesting_node, holding_node)

    return wait_for_graph

# Function to detect deadlocks using the wait-for graph
def detect_deadlocks():
    wait_for_graph = build_wait_for_graph()

    # Use NetworkX to check for cycles in the graph
    cycles = list(nx.simple_cycles(wait_for_graph))

    if cycles:
        print("Deadlock detected!")
        for cycle in cycles:
            print("Cycle:", cycle)
    else:
        print("No deadlock detected")

# Example usage
detect_deadlocks()

# Close the database connection
db.close()
