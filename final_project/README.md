# Performance and Salaries of NBA players
## Final Project for STAT 133 Fall 2016

### Description
This is a final Project for STAT 133 Fall 2016. This project focuses on the dataset of basketball players from National Basketball Association (NBA) League in the 2015-2016 season. It studies the relationship between these players' performance and salaries. The major questions include how to evaluate players' performance, what skills the salaries are more related to, how players' positions can influence performance and salary, whether players are underpaid or overpaid, and whether players are undervalued or overvalued. To tackle these problems, we adopted several key approaches, including measuring the efficiency index, aggregating salaries by team, measuring correlation between salary and each skillset, and calculating Efficiency-Salary ratio. We constructed a data analysis pipeline, which includes data acquisition, data cleaning, data visualization and data analysis. And this paper will discuss the process and results of each part of the pipeline.

### Usage
For download data, run download-data-script.R in R studio

For clean data, run clean-data-script.R in R studio

For exploratory data analysis, run eda-script.R in R studio

For computing efficiency script, run compute-efficiency-script.R in R studio

For running Shiny Application, use the html link provided in Shiny Wiki.

You can run final-correlation.R to generate plots in our report.

### Contributing
When contributing to this repository, please first discuss the change you wish to make via issue, email, or any other method with the owners of this repository before making a change.

Please note we have a code of conduct, please follow it in all your interactions with the project.

### Versioning
v1.0.0

### Authors
Xuran Zhang, Xuanpei Ouyang, Yujia Luo, Yulong Yin 

### Project Structure
* project/
	* README.md
	* code/
        * functions/
          * download-data-functions.R
          * clean-data-functions.R
          * eda-functions.R
          * performance-functions.R
          * team-salary-function.R
	      * scripts/
          * download-data-script.R
          * clean-data-script.R
          * eda-script.R
          * compute-efficiency-script.R
          * final-correlation.R
          * value-script.R
    * data/
        * rawdata/
        	* roster-data/...
          * salary-data/...
          * stat-data/...
        * cleandata/
          * roster-salary-stats.csv
          * eff-stats-salary.csv
          * eda-output.txt
	* images/...
	* apps/
        * team-salaries/
          * app.R
          * team-salaries.csv
          * shiny-team-salary-function.R
          * rsconnect
		    * stat-salaries/
        	* app.R
          * roster-salary-stats.csv
          * eff-salary-stats.csv
          * shiny-stat-salary-function.R
          * rsconnect
  * report/
   		  * report.Rmd
        * report.pdf
  * slides/
        * slides.Rmd
        * slides.html
        * figures/...
       
### License
The MIT License (MIT)
Copyright (c) <2016> <Xuran Zhang, Xuanpei Ouyang, Yujia Luo, Yulong Yin>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

### Acknowledgements
Thanks to professor Sanchez provide us data collecting code and dummy data.
And thanks to GSI Christian Choi, Shamindra Shrotriya, and Timothy Park helping us.