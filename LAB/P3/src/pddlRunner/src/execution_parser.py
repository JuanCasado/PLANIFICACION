
import re

def generate_task_list(task_list):
    tasks = []
    for line in task_list:
        if re.match(r'^\(\w(\w|_)*(\ *(\w(\w|_)*)?)*\)', re.sub(r"(\d(\.|\d)*: ) *", "", line)):
            split_line = re.sub(r"(\d(\.|\d)*: ) *", "", line).split()
            tasks.append(split_line[0].replace('(', '').replace(')', ''))
            if tasks[-1].lower() == 'move':
                coords = split_line[3].replace('p', '').replace(')', '')
                tasks[-1] = (tasks[-1], (int(coords[:2]), int(coords[2:])))
    print("TASKS:")
    print(tasks)
    return tasks

def parse_execution(problem_name, execution, path_planner):
  tasks=generate_task_list(execution)
  print(tasks)