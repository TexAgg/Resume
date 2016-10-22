# Uses the tutorial at
# http://eosrei.net/articles/2015/11/latex-templates-python-and-jinja2-generate-pdfs
# to template the resume and cv.

import jinja2
import os
import json
import time
from datetime import date
from jinja2 import Template

# Returns the current date.
# https://docs.python.org/2/library/datetime.html
def today():
    d = date.fromtimestamp(time.time())
    return d.isoformat()

def get_about():
    f = open("data/about.json")
    return json.load(f)

def get_skills():
    f = open("data/skills.json")
    return json.load(f)

# http://jinja.pocoo.org/docs/dev/api/
latex_jinja_env = jinja2.Environment(
    block_start_string = '\BLOCK{',
    block_end_string = '}',
    variable_start_string = '\VAR{',
    variable_end_string = '}',
    #comment_start_string = '\#{',
    #comment_end_string = '}',
    line_statement_prefix = "-%",
    #line_comment_prefix = '%#',
    trim_blocks = True,
    autoescape = False,
    loader = jinja2.FileSystemLoader(os.path.abspath('.'))
)

# Get my skills.
skills = get_skills()

resume_template = latex_jinja_env.get_template('resume.template.tex')
resume_str = resume_template.render(
    languages = skills['languages'], 
    software = skills['software'],
    about = get_about(),
    today = today
)
with open("resume.tex", "w+") as f:
    f.write(resume_str)
print("resume.tex written.")

cv_template = latex_jinja_env.get_template('cv.template.tex')
cv_str = cv_template.render(
    languages = skills['languages'], 
    software = skills['software'],
    about = get_about(),
    today = today
)
with open("cv.tex", "w+") as f:
    f.write(cv_str)
print("cv.tex written.")