require(methods) || stop("Couldn't load package methods")

setClass("gaOptimization",
  representation(
    population = "population",
    iterations = "numeric",
    elitism = "numeric",
    bestEvals = "vector",
    meanEvals = "vector",
    mutationChance = 0
  ),
  prototype(
    population = NA,
    iterations = 0,
    elitism = 0,
    bestEvals = c(),
    meanEvals = c()
  )
)

gaOptimization <- function(population=NA, iterations=NA, elitism=NA) {
    if (!(type %in% c("binary", "float", "integer"))) {
        stop("The type must be one of: binary, float, integer");
    }

    if (is.null(initFunc)) {
        if (type == "binary") {
            stop("An initialization function must be provided.");
        }
    }

    object <- new("population")

    object@type <- type
    object@size <- size
    object@bits <- bits
    object@chromosomes <- initFunc(size, bits)
    object@evals = rep(0,bits)
    object@generation = 0

    return(object)
}