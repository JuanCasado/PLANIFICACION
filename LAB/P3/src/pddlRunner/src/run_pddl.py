

import distances_calculator
import problem
import json
import os

head_path='./pddlRunner/problems/'
tail_path='/problem.pddl'
domain_path='./src/pddlRunner/domains/planetary.pddl'

def run_pddl (problem):
  pass

def create_problem (parsed_problem_description, output):
  dc = distances_calculator.distances_calculator( parsed_problem_description['pathPlan']['grid_size'],
                                                  parsed_problem_description['pathPlan']['algorithm'], 
                                                  parsed_problem_description['pathPlan']['heuristic'], 
                                                  parsed_problem_description['pathPlan']['scale'])
  prob = problem.problem(parsed_problem_description,dc)
  os.mkdir(f'{head_path}{output}')
  with open(f'{head_path}{output}{tail_path}', 'w+') as problem_output:
    problem_output.write(str(prob))
  


if __name__ == '__main__':
  with open('./pddlRunner/src/problem_description.json') as problem_description:
    parsed_problem_description = json.loads(problem_description.read())
  create_problem (parsed_problem_description, parsed_problem_description['name'])
  
