
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

This is a basic example, creating a meaningless bot.

(Currently also relies on `anglr`).

``` r
library(rbot)
## a meaningless bot
bot(list(iris = iris, mtcars = mtcars))
#> bag of tables:
#> iris,mtcars 
#> 
#> active table is 'iris' 
#> ... and join ramp order is 'iris,mtcars'
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
```

rbot was designed specifically for use by the silicate workflow.

``` r
## more meaningful, rbot was designed to deal with silicate's relatable tables
library(silicate)
path <- silicate::PATH(minimal_mesh)
bot(path)
#> bag of tables:
#> object,path,path_link_vertex,vertex 
#> 
#> active table is 'object' 
#> ... and join ramp order is 'object,path,path_link_vertex,vertex'
#> # A tibble: 2 x 2
#>       a object_ 
#> * <int> <chr>   
#> 1     1 b31e1cca
#> 2     2 1b04b69e

library(dplyr)
## we can filter a table and propagate across the other tables
bot(path) %>% dplyr::filter(a == 1)
#> bag of tables:
#> object,path,path_link_vertex,vertex 
#> 
#> active table is 'object' 
#> ... and join ramp order is 'object,path,path_link_vertex,vertex'
#> # A tibble: 1 x 2
#>       a object_ 
#>   <int> <chr>   
#> 1     1 b31e1cca

## (well, we can't do this properly on any old table yet ...)
bot(path) %>% activate("vertex") %>% dplyr::filter(x_ > 0.5)
#> bag of tables:
#> object,path,path_link_vertex,vertex 
#> 
#> active table is 'object' 
#> ... and join ramp order is 'object,path,path_link_vertex,vertex'
#> # A tibble: 2 x 2
#>       a object_ 
#> * <int> <chr>   
#> 1     1 b31e1cca
#> 2     2 1b04b69e
```
