
test_that("gendist_sensspec_cutoff finds sensitivity estimate", {

    expect_equal(gendist_sensspec_cutoff(cutoff = 2, mut_rate = 1, mean_gens_pdf = c(0.02,
        0.08, 0.15, 0.75), max_link_gens = 1)[1, "sensitivity"][[1]], 0.7357589,
        tolerance = 0.01)
})

test_that("gendist_sensspec_cutoff finds specificity estimate", {

    expect_equal(gendist_sensspec_cutoff(cutoff = 2, mut_rate = 1, mean_gens_pdf = c(0.02,
        0.08, 0.15, 0.75), max_link_gens = 1)[1, "specificity"][[1]], 0.8662894,
        tolerance = 0.01)
})

test_that("gendist_sensspec_cutoff returns sensitivity and specificity estimates for a range of cutoff values",
    {

        tmp <- gendist_sensspec_cutoff(cutoff = 10, mut_rate = 1, mean_gens_pdf = c(0.02,
            0.08, 0.15, 0.75), max_link_gens = 1)

        expect_identical(as.integer(c(1, 3)), dim(tmp))
        expect_true(tmp[, "cutoff"] == 10)
        expect_equal(as.numeric(tmp[, "sensitivity"]), 0.999, tolerance = 0.01)
    })
