
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
```

rbot was designed specifically for use by the silicate workflow.

``` r
## more meaningful, rbot was designed to deal with silicate's relatable tables
library(silicate)
path <- silicate::PATH(minimal_mesh)
bot(path)
#> $object
#> # A tibble: 2 x 2
#>       a object_ 
#> * <int> <chr>   
#> 1     1 b9265fe4
#> 2     2 a10ca245
#> 
#> $path
#> # A tibble: 3 x 7
#>    ncol type         subobject object object_  path_    ncoords_
#>   <int> <chr>            <int>  <int> <chr>    <chr>       <int>
#> 1     2 MULTIPOLYGON         1      1 b9265fe4 cb63a3bd        8
#> 2     2 MULTIPOLYGON         1      1 b9265fe4 67ca701e        6
#> 3     2 MULTIPOLYGON         1      2 a10ca245 53565320        5
#> 
#> $path_link_vertex
#> # A tibble: 19 x 2
#>    path_    vertex_ 
#>    <chr>    <chr>   
#>  1 cb63a3bd 6dffd731
#>  2 cb63a3bd bb1105a5
#>  3 cb63a3bd 053e6cde
#>  4 cb63a3bd bc16716a
#>  5 cb63a3bd 0e278806
#>  6 cb63a3bd 42a9a0bd
#>  7 cb63a3bd 4fdd5856
#>  8 cb63a3bd 6dffd731
#>  9 67ca701e 89e3eb4b
#> 10 67ca701e 874a7547
#> 11 67ca701e 27c9c321
#> 12 67ca701e 617a9418
#> 13 67ca701e f5af0625
#> 14 67ca701e 89e3eb4b
#> 15 53565320 4fdd5856
#> 16 53565320 42a9a0bd
#> 17 53565320 4377d923
#> 18 53565320 cdeb3cc4
#> 19 53565320 4fdd5856
#> 
#> $vertex
#> # A tibble: 14 x 3
#>       x_    y_ vertex_ 
#>    <dbl> <dbl> <chr>   
#>  1 0     0     6dffd731
#>  2 0     1.00  bb1105a5
#>  3 0.750 1.00  053e6cde
#>  4 1.00  0.800 bc16716a
#>  5 0.500 0.700 0e278806
#>  6 0.800 0.600 42a9a0bd
#>  7 0.690 0     4fdd5856
#>  8 0.200 0.200 89e3eb4b
#>  9 0.500 0.200 874a7547
#> 10 0.500 0.400 27c9c321
#> 11 0.300 0.600 617a9418
#> 12 0.200 0.400 f5af0625
#> 13 1.10  0.630 4377d923
#> 14 1.23  0.300 cdeb3cc4
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
#> 1     1 b9265fe4
#> 
#> $path
#> # A tibble: 2 x 7
#>    ncol type         subobject object object_  path_    ncoords_
#>   <int> <chr>            <int>  <int> <chr>    <chr>       <int>
#> 1     2 MULTIPOLYGON         1      1 b9265fe4 cb63a3bd        8
#> 2     2 MULTIPOLYGON         1      1 b9265fe4 67ca701e        6
#> 
#> $path_link_vertex
#> # A tibble: 14 x 2
#>    path_    vertex_ 
#>    <chr>    <chr>   
#>  1 cb63a3bd 6dffd731
#>  2 cb63a3bd bb1105a5
#>  3 cb63a3bd 053e6cde
#>  4 cb63a3bd bc16716a
#>  5 cb63a3bd 0e278806
#>  6 cb63a3bd 42a9a0bd
#>  7 cb63a3bd 4fdd5856
#>  8 cb63a3bd 6dffd731
#>  9 67ca701e 89e3eb4b
#> 10 67ca701e 874a7547
#> 11 67ca701e 27c9c321
#> 12 67ca701e 617a9418
#> 13 67ca701e f5af0625
#> 14 67ca701e 89e3eb4b
#> 
#> $vertex
#> # A tibble: 12 x 3
#>       x_    y_ vertex_ 
#>    <dbl> <dbl> <chr>   
#>  1 0     0     6dffd731
#>  2 0     1.00  bb1105a5
#>  3 0.750 1.00  053e6cde
#>  4 1.00  0.800 bc16716a
#>  5 0.500 0.700 0e278806
#>  6 0.800 0.600 42a9a0bd
#>  7 0.690 0     4fdd5856
#>  8 0.200 0.200 89e3eb4b
#>  9 0.500 0.200 874a7547
#> 10 0.500 0.400 27c9c321
#> 11 0.300 0.600 617a9418
#> 12 0.200 0.400 f5af0625
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
#> 1     1 b9265fe4
#> 2     2 a10ca245
#> 
#> $path
#> # A tibble: 3 x 7
#>    ncol type         subobject object object_  path_    ncoords_
#>   <int> <chr>            <int>  <int> <chr>    <chr>       <int>
#> 1     2 MULTIPOLYGON         1      1 b9265fe4 cb63a3bd        8
#> 2     2 MULTIPOLYGON         1      1 b9265fe4 67ca701e        6
#> 3     2 MULTIPOLYGON         1      2 a10ca245 53565320        5
#> 
#> $path_link_vertex
#> # A tibble: 19 x 2
#>    path_    vertex_ 
#>    <chr>    <chr>   
#>  1 cb63a3bd 6dffd731
#>  2 cb63a3bd bb1105a5
#>  3 cb63a3bd 053e6cde
#>  4 cb63a3bd bc16716a
#>  5 cb63a3bd 0e278806
#>  6 cb63a3bd 42a9a0bd
#>  7 cb63a3bd 4fdd5856
#>  8 cb63a3bd 6dffd731
#>  9 67ca701e 89e3eb4b
#> 10 67ca701e 874a7547
#> 11 67ca701e 27c9c321
#> 12 67ca701e 617a9418
#> 13 67ca701e f5af0625
#> 14 67ca701e 89e3eb4b
#> 15 53565320 4fdd5856
#> 16 53565320 42a9a0bd
#> 17 53565320 4377d923
#> 18 53565320 cdeb3cc4
#> 19 53565320 4fdd5856
#> 
#> $vertex
#> # A tibble: 6 x 3
#>      x_    y_ vertex_ 
#>   <dbl> <dbl> <chr>   
#> 1 0.750 1.00  053e6cde
#> 2 1.00  0.800 bc16716a
#> 3 0.800 0.600 42a9a0bd
#> 4 0.690 0     4fdd5856
#> 5 1.10  0.630 4377d923
#> 6 1.23  0.300 cdeb3cc4
#> 
#> attr(,"class")
#> [1] "bot"
#> attr(,"jramp")
#> [1] "object"           "path"             "path_link_vertex"
#> [4] "vertex"          
#> attr(,"active")
#> [1] "object"
```
