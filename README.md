# Cleaning Up R Code with more R Code
Are you tired of reviewing coworkers' scripts and finding out there are missing calls to packages? <br />
Can you not unsee dozens of unused packages load unnecessarily when the code is executed?  <br />
Are you exhausted by thousands of lines of code without sections, comments, or other logical organization? <br />
Perhaps you are here because you (like me) are guilty of some of the greatest code style grievances. <br />

It's OK. But please end my suffering by making your code easier to read and make it reproducible.

## Roadmap
This repository will contain tools I've developed for fixing other people's code containing my most common code style and legibility peeves. These tools were primarily designed to speed up my own review of other people's code by making them do it. This includes tools that check for:

- Code that does not check that a user has the required packages installed [TESTING]
- Code dependencies that are not described in an R script or R markdown file
  - Stray functions without its package called or loaded
  - Stray packages called or loaded with none of its functions in use
  - `package::function` namespace but without its package dependency described
- Required packages/dependencies not listed in alphabetical order [DONE]
- Code that suffered an Eldritch incursion (too much void/empty space, extra blank lines, etc.) [TESTING]
- Inconsistent variable and local function naming like silly.var, correct_var, incorrect-var, okVar, WhYyYvAr, etc.
- Inconsistent assignment and operator spacing [TESTING]
- Find all markdown code chunks without an empty line before, after it and add an empty line
- Remove excess spaces, selectively (not at beginning of a line like indents)

Code that is *reviewed* are usually _modified_ by these tools. The new code is printed to the console for copying (or automatically copied to your clipboard if the [{clipr}](http://matthewlincoln.net/clipr/) package is present in your R library)

## Installation

WIP, coming soon!

## Primary Functions

-  `list_packages()` Solves the annoying problem of finding ALL packages used in the code. Can also help find missing packages!
-  `sort_packages()` Blissfully reorganizes package lists, `library()` or `require()` calls alphabetically
-  `remove_voidspace()` Sends the Eldritch back to where they belong i.e. removes extra newlines, unfathomable amounts of tabs or spaces

## Other Resources
There is a vast trove of information available on improving your code style and suggestions for best practices. Different organizations have implemented different styles and best practices. There are a couple dominant ones in the R community and some that are a bit aprocryphal. Be mindful of the date that code style articles were written as the R community is rapidly evolving; new practices become commonplace and old practices are excommunicated. Here are two guides I recommend embracing or at least being familiar with as soon as possible.

-  https://style.tidyverse.org/
-  https://google.github.io/styleguide/Rguide.html

There are also R packages specifically designed for styling your R code automatically. However, I wholeheartedly feel that programmers should obtain these habits by practicing them, not by relying on tools to fix their mess. They can be a great help with identifying unstyled code or establishing a customized style. Learning from your mistakes and sharing your knowledge can make using these tools unnecessary. Here are some R packages that may be repurposed in this project.

-  [{styler}](https://styler.r-lib.org/)
-  [{lintr}](https://lintr.r-lib.org/)
-  [{formatr}](https://yihui.org/formatr/)
-  [{cleanr}](https://cran.r-project.org/web/packages/cleanr/vignettes/cleanr_Introduction.html)  

One package from Jim Hester might be valuable in determining which dependencies can be removed from a project and makes recommendations about how to do that for R packages:

-  https://www.tidyverse.org/blog/2019/05/itdepends/
