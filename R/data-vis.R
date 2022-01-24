#### Data visualization exercises ####

## Run ggplot(data = mpg). What do you see?

ggplot2::ggplot(data = ggplot2::mpg)

# A grey area.

## How many rows are in mpg? How many columns?

cat(
  "The data frame has",
  as.character(nrow(ggplot2::mpg)),
  "rows and",
  as.character(ncol(ggplot2::mpg)),
  "columns.")

## What does the drv variable describe? Read the help for ?mpg to find out.

# The type of drive train, where f = front-wheel drive, r - rear wheel drive, and
# 4 is 4wd.

## Make a scatterplot of hwy vs cyl.

ggplot2::mpg |>
  ggplot2::ggplot(ggplot2::aes(y = hwy, x = cyl)) +
  ggplot2::geom_point(size = 3, color = "royalblue")

## What happens if you make a scatterplot of class vs drv? Why is the plot not useful?

ggplot2::mpg |>
  ggplot2::ggplot(ggplot2::aes(x = class, y = drv)) +
  ggplot2::geom_point()

# Both variables are categorical.

## What’s gone wrong with this code? Why are the points not blue?

ggplot2::ggplot(data = ggplot2::mpg) +
  ggplot2::geom_point(mapping = ggplot2::aes(x = displ, y = hwy, color = "blue"))

# Because the function cannot find any "blue" variable in the dataset.
# The color argument was written inside the aes function instead of the
# geom_point function.

## Which variables in mpg are categorical? Which variables are continuous? (Hint: type ?mpg to read the documentation for the dataset). How can you see this information when you run mpg?

purrr::map(
  ggplot2::mpg,
  class)

## Map a continuous variable to color, size, and shape. How do these aesthetics behave differently for categorical vs. continuous variables?
ggplot2::mpg |>
  ggplot2::ggplot(ggplot2::aes(x = class, y = drv, shape = hwy)) +
  ggplot2::geom_point()

# Continuous variable cannot be mapped to shape.
# In size, the dots get bigger as the value increases.
# In color, a gradient is created.

## What happens if you map the same variable to multiple aesthetics?

ggplot2::mpg |>
  ggplot2::ggplot(ggplot2::aes(x = drv, y = drv, color = drv)) +
  ggplot2::geom_point()

# Nothing happens, you just get an useless plot.

## What does the stroke aesthetic do? What shapes does it work with? (Hint: use ?geom_point)

# It creates an outline around the dot.

## What happens if you map an aesthetic to something other than a variable name, like aes(colour = displ < 5)? Note, you’ll also need to specify x and y.

ggplot2::mpg |>
  ggplot2::ggplot(ggplot2::aes(x = class, y = drv, color = displ < 5)) +
  ggplot2::geom_point()

# It creates a "new" binary variable to stratify (colorize) the dots.
# It's pretty handy tbh.

## What happens if you facet on a continuous variable?

ggplot2::mpg |>
  ggplot2::ggplot(ggplot2::aes(x = class, y = drv)) +
  ggplot2::geom_point() +
  ggplot2::facet_grid(~ displ)

# It transforms the variable into a factor and stratify it as expected.

## What do the empty cells in plot with facet_grid(drv ~ cyl) mean? How do they relate to this plot?

ggplot2::ggplot(data = ggplot2::mpg) +
  ggplot2::geom_point(mapping = ggplot2::aes(x = drv, y = cyl))

# There are values in each variable that does
# not have a corresponding one in the other, probably what is causing empty grids.

## What plots does the following code make? What does . do?

ggplot2::ggplot(data = ggplot2::mpg) +
  ggplot2::geom_point(mapping = ggplot2::aes(x = displ, y = hwy)) +
  ggplot2::facet_grid(drv ~ .)

ggplot2::ggplot(data = ggplot2::mpg) +
  ggplot2::geom_point(mapping = ggplot2::aes(x = displ, y = hwy)) +
  ggplot2::facet_grid(. ~ cyl)

# The dot place remaining columns in the other argument (rows or columns).
# What stands in the left hand side is rows, in the right hand side, columns.
# It is changing how the grids are being formed. If the grid is occuring as
# rows or columns.

## Take the first faceted plot in this section:

ggplot2::ggplot(data = ggplot2::mpg) +
  ggplot2::geom_point(mapping = ggplot2::aes(x = displ, y = hwy)) +
  ggplot2::facet_wrap(~ class, nrow = 2)

## What are the advantages to using faceting instead of the colour aesthetic?
## What are the disadvantages?
## How might the balance change if you had a larger dataset?

# Advantages: Cleaner look.
# Disadvantages: Harder to compare each class.
# In larger datasets, maybe summarize numerically too, create subsets of classes
# to compare them gradually.

## Read ?facet_wrap. What does nrow do?
## What does ncol do?
## What other options control the layout of the individual panels?
## Why doesn’t facet_grid() have nrow and ncol arguments?

# Number of rows. Number of columns.
# ?? Vague...
# Because facet_grid joins panels together, and facet_wrap have more flexibility
# when wrapping "individual" plots in 2d space.

## When using facet_grid() you should usually put the
## variable with more unique levels in the columns. Why?

# Usually we want the dependent variable/outcome in the y axis of the plot,
# using it in the columns can be better to watch higher and lower values changing.
