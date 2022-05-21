library(geometry)


target_function <- function(weights, x_vec) {
    z <- geometry::dot(weights, x_vec, d = TRUE)
    g <- 1 / (1 + exp(z))
    return(g)
}


gradient_desc <- function(x, y, learn_rate, threshold, n, max_iter) {
    # Init our weights to be optimized as 1
    h_0 <- c(rep(1, length(x)))
    # the error we want to minimize
    mse <- sum((y - h_0)^2) / n
    # Flags for controlling the loop
    converged <- FALSE
    iterations <- 0
    while (converged == FALSE) {
        # Update Rule
        h_0 <- target_function(h_0, x)
        # Calculate Error/loss
        mse_new <- sum((y - h_0)^2) / n
        # Check if Loss converged
        if (mse - mse_new <= threshold) {
            converged <- TRUE
            return(h_0)
        }
        iterations <- iterations + 1
        if (iterations > max_iter) {
            converged <- TRUE
            return(h_0)
        }
    }
}

weights <- c(rep(1, 10000))