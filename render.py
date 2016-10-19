# http://eosrei.net/articles/2015/11/latex-templates-python-and-jinja2-generate-pdfs

import jinja2
import os
import json
from jinja2 import Template

def get_skills():
    f = open("data/skills.json")
    return json.load(f)

latex_jinja_env = jinja2.Environment(
    block_start_string = '\BLOCK{',
    block_end_string = '}',
    variable_start_string = '\VAR{',
    variable_end_string = '}',
    comment_start_string = '\#{',
    comment_end_string = '}',
    line_comment_prefix = '%#',
    trim_blocks = True,
    autoescape = False,
	loader = jinja2.FileSystemLoader(os.path.abspath('.'))
)

# Get my skills.
skills = get_skills()

resume_template = latex_jinja_env.get_template('resume.template.tex')
resume_str = resume_template.render(languages = skills['languages'], software = skills['software'])
with open("resume.tex", "w+") as f:
    f.write(resume_str)

cv_template = latex_jinja_env.get_template('cv.template.tex')
cv_str = cv_template.render(languages = skills['languages'], software = skills['software'])
with open("cv.tex", "w+") as f:
    f.write(cv_str)