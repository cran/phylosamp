
test_that("vartrack_samplesize_detect_cont input arguments are valid", {

    expect_error(vartrack_samplesize_detect_cont(prob = 1.1, t = 4, omega = 0.9,
        p0_v1 = 1/10000, r_v1 = 0.1, c_ratio = 1.5))

    expect_error(vartrack_samplesize_detect_cont(prob = 0, t = 4, omega = 0.9, p0_v1 = 1/10000,
        r_v1 = 0.1, c_ratio = 1.5))

    expect_error(vartrack_samplesize_detect_cont(prob = "invalid", t = 4, omega = 0.9,
        p0_v1 = 1/10000, r_v1 = 0.1, c_ratio = 1.5))

    expect_error(vartrack_samplesize_detect_cont(prob = 0.95, t = FALSE, omega = 0.9,
        p0_v1 = 1/10000, r_v1 = 0.1, c_ratio = 1.5))

    expect_error(vartrack_samplesize_detect_cont(prob = 0.95, t = 4, omega = 0.9,
        p0_v1 = -1/1000, r_v1 = 0.1, c_ratio = 1.5))

    expect_error(vartrack_samplesize_detect_cont(prob = 0.95, t = 4, omega = 0.9,
        p0_v1 = 1, r_v1 = 0.1, c_ratio = 1.5))

    expect_error(vartrack_samplesize_detect_cont(prob = 0.95, t = 4, omega = "invalid",
        p0_v1 = 1/100, r_v1 = 0.1, c_ratio = 1.5))

    expect_error(vartrack_samplesize_detect_cont(prob = 0.95, t = 4, omega = -0.1,
        p0_v1 = 1/100, r_v1 = 0.1, c_ratio = 1.5))

    expect_error(vartrack_samplesize_detect_cont(prob = 0.95, t = 4, omega = 1.1,
        p0_v1 = 1/100, r_v1 = 0.1, c_ratio = 1.5))

    expect_error(vartrack_samplesize_detect_cont(prob = 0.95, t = 4, omega = 0.9,
        p0_v1 = "invalid", r_v1 = 0.1, c_ratio = 1.5))

    expect_error(vartrack_samplesize_detect_cont(prob = 0.95, t = 4, omega = 0.9,
        p0_v1 = 1/10000, r_v1 = 0, c_ratio = 1.5))

    expect_error(vartrack_samplesize_detect_cont(prob = 0.95, t = 4, omega = 0.9,
        p0_v1 = 1/10000, r_v1 = TRUE, c_ratio = 1.5))

    expect_error(vartrack_samplesize_detect_cont(prob = 0.95, t = 4, omega = 0.9,
        p0_v1 = 1/10000, r_v1 = 0.3, c_ratio = 0))

    expect_error(vartrack_samplesize_detect_cont(prob = 0.95, t = 4, omega = 0.9,
        p0_v1 = 1/10000, r_v1 = 0.2, c_ratio = "invalid"))
})

test_that("vartrack_samplesize_detect_cont return object is valid double", {

    expect_type(vartrack_samplesize_detect_cont(prob = 0.95, t = 4, omega = 0.9,
        p0_v1 = 1/10000, r_v1 = 0.1, c_ratio = 1.5), "double")

})

test_that("vartrack_samplesize_detect_cont manuscript results remain valid", {

    expect_equal(ceiling(vartrack_samplesize_detect_cont(prob = 0.95, t = 30, omega = 1,
        p0_v1 = 1/10000, r_v1 = 0.1, c_ratio = 1)), 158)

    expect_equal(ceiling(vartrack_samplesize_detect_cont(prob = 0.95, t = 47, omega = 1,
        p0_v1 = 1/10000, r_v1 = 0.1, c_ratio = 1)) * 7, 196)

    expect_equal(ceiling(vartrack_samplesize_detect_cont(prob = 0.95, t = 47, omega = 1,
        p0_v1 = 1/10000, r_v1 = 0.1, c_ratio = (0.8 * 0.975)/(0.6 * 0.95))), 21)
})
