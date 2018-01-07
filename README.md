
<!-- README.md is generated from README.Rmd. Please edit that file -->
rbot
====

The goal of rbot is to provide a **bag of tables** object for R (i.e. a *database*). This is a simple generalization of the two-table mechanism used by tidygraph.

Installation
------------

You can install rbot from GitHub with:

``` r
# install.packages("devtools")
devtools::install_github("hypertidy/rbot")
```

Example
-------

This is a basic example, specifically for use by the silicate workflow.

(Currently also relies on `anglr`).

``` r
library(rbot)
## a meaningless bot
bot(list(iris = iris, mtcars = mtcars))
#> $iris
#> # A tibble: 150 x 5
#>    Sepal.Length Sepal.Width Petal.Length Petal.Width Species
#>           <dbl>       <dbl>        <dbl>       <dbl> <fctr> 
#>  1         5.10        3.50         1.40       0.200 setosa 
#>  2         4.90        3.00         1.40       0.200 setosa 
#>  3         4.70        3.20         1.30       0.200 setosa 
#>  4         4.60        3.10         1.50       0.200 setosa 
#>  5         5.00        3.60         1.40       0.200 setosa 
#>  6         5.40        3.90         1.70       0.400 setosa 
#>  7         4.60        3.40         1.40       0.300 setosa 
#>  8         5.00        3.40         1.50       0.200 setosa 
#>  9         4.40        2.90         1.40       0.200 setosa 
#> 10         4.90        3.10         1.50       0.100 setosa 
#> # ... with 140 more rows
#> 
#> $mtcars
#> # A tibble: 32 x 11
#>      mpg   cyl  disp    hp  drat    wt  qsec    vs    am  gear  carb
#>  * <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
#>  1  21.0  6.00   160 110    3.90  2.62  16.5  0     1.00  4.00  4.00
#>  2  21.0  6.00   160 110    3.90  2.88  17.0  0     1.00  4.00  4.00
#>  3  22.8  4.00   108  93.0  3.85  2.32  18.6  1.00  1.00  4.00  1.00
#>  4  21.4  6.00   258 110    3.08  3.22  19.4  1.00  0     3.00  1.00
#>  5  18.7  8.00   360 175    3.15  3.44  17.0  0     0     3.00  2.00
#>  6  18.1  6.00   225 105    2.76  3.46  20.2  1.00  0     3.00  1.00
#>  7  14.3  8.00   360 245    3.21  3.57  15.8  0     0     3.00  4.00
#>  8  24.4  4.00   147  62.0  3.69  3.19  20.0  1.00  0     4.00  2.00
#>  9  22.8  4.00   141  95.0  3.92  3.15  22.9  1.00  0     4.00  2.00
#> 10  19.2  6.00   168 123    3.92  3.44  18.3  1.00  0     4.00  4.00
#> # ... with 22 more rows
#> 
#> attr(,"class")
#> [1] "bot"
#> attr(,"jramp")
#> [1] "iris"   "mtcars"
#> attr(,"active")
#> [1] "iris"

## more meaningful, rbot was designed to deal with silicate's relatable tables
library(silicate)
path <- silicate::PATH(minimal_mesh)
bot(path)
#> $object
#> # A tibble: 2 x 2
#>       a object_ 
#> * <int> <chr>   
#> 1     1 83453eaf
#> 2     2 4f9bff5c
#> 
#> $path
#> # A tibble: 3 x 7
#>    ncol type         subobject object object_  path_    ncoords_
#>   <int> <chr>            <int>  <int> <chr>    <chr>       <int>
#> 1     2 MULTIPOLYGON         1      1 83453eaf f842c1fa        8
#> 2     2 MULTIPOLYGON         1      1 83453eaf cdcf6878        6
#> 3     2 MULTIPOLYGON         1      2 4f9bff5c e493cfed        5
#> 
#> $path_link_vertex
#> # A tibble: 19 x 2
#>    path_    vertex_ 
#>    <chr>    <chr>   
#>  1 f842c1fa 0dbc5ec5
#>  2 f842c1fa 822a6313
#>  3 f842c1fa 98e390b9
#>  4 f842c1fa 93ee2965
#>  5 f842c1fa 291d3693
#>  6 f842c1fa 65491787
#>  7 f842c1fa 7024e338
#>  8 f842c1fa 0dbc5ec5
#>  9 cdcf6878 8e705fe3
#> 10 cdcf6878 a1e4188a
#> 11 cdcf6878 978d867c
#> 12 cdcf6878 91060813
#> 13 cdcf6878 0eaf5b52
#> 14 cdcf6878 8e705fe3
#> 15 e493cfed 7024e338
#> 16 e493cfed 65491787
#> 17 e493cfed 71dd819a
#> 18 e493cfed 99791167
#> 19 e493cfed 7024e338
#> 
#> $vertex
#> # A tibble: 14 x 3
#>       x_    y_ vertex_ 
#>    <dbl> <dbl> <chr>   
#>  1 0     0     0dbc5ec5
#>  2 0     1.00  822a6313
#>  3 0.750 1.00  98e390b9
#>  4 1.00  0.800 93ee2965
#>  5 0.500 0.700 291d3693
#>  6 0.800 0.600 65491787
#>  7 0.690 0     7024e338
#>  8 0.200 0.200 8e705fe3
#>  9 0.500 0.200 a1e4188a
#> 10 0.500 0.400 978d867c
#> 11 0.300 0.600 91060813
#> 12 0.200 0.400 0eaf5b52
#> 13 1.10  0.630 71dd819a
#> 14 1.23  0.300 99791167
#> 
#> attr(,"class")
#> [1] "bot"
#> attr(,"jramp")
#> [1] "object"           "path"             "path_link_vertex"
#> [4] "vertex"          
#> attr(,"active")
#> [1] "object"

library(dplyr)
## we can filter a table and propagate across the other tables
bot(path) %>% dplyr::filter(a == 1)
#> $object
#> # A tibble: 1 x 2
#>       a object_ 
#>   <int> <chr>   
#> 1     1 83453eaf
#> 
#> $path
#> # A tibble: 2 x 7
#>    ncol type         subobject object object_  path_    ncoords_
#>   <int> <chr>            <int>  <int> <chr>    <chr>       <int>
#> 1     2 MULTIPOLYGON         1      1 83453eaf f842c1fa        8
#> 2     2 MULTIPOLYGON         1      1 83453eaf cdcf6878        6
#> 
#> $path_link_vertex
#> # A tibble: 14 x 2
#>    path_    vertex_ 
#>    <chr>    <chr>   
#>  1 f842c1fa 0dbc5ec5
#>  2 f842c1fa 822a6313
#>  3 f842c1fa 98e390b9
#>  4 f842c1fa 93ee2965
#>  5 f842c1fa 291d3693
#>  6 f842c1fa 65491787
#>  7 f842c1fa 7024e338
#>  8 f842c1fa 0dbc5ec5
#>  9 cdcf6878 8e705fe3
#> 10 cdcf6878 a1e4188a
#> 11 cdcf6878 978d867c
#> 12 cdcf6878 91060813
#> 13 cdcf6878 0eaf5b52
#> 14 cdcf6878 8e705fe3
#> 
#> $vertex
#> # A tibble: 12 x 3
#>       x_    y_ vertex_ 
#>    <dbl> <dbl> <chr>   
#>  1 0     0     0dbc5ec5
#>  2 0     1.00  822a6313
#>  3 0.750 1.00  98e390b9
#>  4 1.00  0.800 93ee2965
#>  5 0.500 0.700 291d3693
#>  6 0.800 0.600 65491787
#>  7 0.690 0     7024e338
#>  8 0.200 0.200 8e705fe3
#>  9 0.500 0.200 a1e4188a
#> 10 0.500 0.400 978d867c
#> 11 0.300 0.600 91060813
#> 12 0.200 0.400 0eaf5b52
#> 
#> attr(,"class")
#> [1] "bot"
#> attr(,"jramp")
#> [1] "object"           "path"             "path_link_vertex"
#> [4] "vertex"          
#> attr(,"active")
#> [1] "object"

## (well, we can't do this properly on any old table yet ...)
bot(path) %>% activate("vertex") %>% dplyr::filter(x_ > 0.5)
#> $object
#> # A tibble: 2 x 2
#>       a object_ 
#> * <int> <chr>   
#> 1     1 83453eaf
#> 2     2 4f9bff5c
#> 
#> $path
#> # A tibble: 3 x 7
#>    ncol type         subobject object object_  path_    ncoords_
#>   <int> <chr>            <int>  <int> <chr>    <chr>       <int>
#> 1     2 MULTIPOLYGON         1      1 83453eaf f842c1fa        8
#> 2     2 MULTIPOLYGON         1      1 83453eaf cdcf6878        6
#> 3     2 MULTIPOLYGON         1      2 4f9bff5c e493cfed        5
#> 
#> $path_link_vertex
#> # A tibble: 19 x 2
#>    path_    vertex_ 
#>    <chr>    <chr>   
#>  1 f842c1fa 0dbc5ec5
#>  2 f842c1fa 822a6313
#>  3 f842c1fa 98e390b9
#>  4 f842c1fa 93ee2965
#>  5 f842c1fa 291d3693
#>  6 f842c1fa 65491787
#>  7 f842c1fa 7024e338
#>  8 f842c1fa 0dbc5ec5
#>  9 cdcf6878 8e705fe3
#> 10 cdcf6878 a1e4188a
#> 11 cdcf6878 978d867c
#> 12 cdcf6878 91060813
#> 13 cdcf6878 0eaf5b52
#> 14 cdcf6878 8e705fe3
#> 15 e493cfed 7024e338
#> 16 e493cfed 65491787
#> 17 e493cfed 71dd819a
#> 18 e493cfed 99791167
#> 19 e493cfed 7024e338
#> 
#> $vertex
#> # A tibble: 6 x 3
#>      x_    y_ vertex_ 
#>   <dbl> <dbl> <chr>   
#> 1 0.750 1.00  98e390b9
#> 2 1.00  0.800 93ee2965
#> 3 0.800 0.600 65491787
#> 4 0.690 0     7024e338
#> 5 1.10  0.630 71dd819a
#> 6 1.23  0.300 99791167
#> 
#> attr(,"class")
#> [1] "bot"
#> attr(,"jramp")
#> [1] "object"           "path"             "path_link_vertex"
#> [4] "vertex"          
#> attr(,"active")
#> [1] "object"
```
