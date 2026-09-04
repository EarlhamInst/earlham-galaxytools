loaded_objects <- load("output/phyloseq.Rdata")

if (length(loaded_objects) == 1) {
    phyloseq_object <- get(loaded_objects)
} else {
    phyloseq_candidates <- loaded_objects[
        vapply(loaded_objects, function(name) inherits(get(name), "phyloseq"), logical(1))
    ]

    if (length(phyloseq_candidates) != 1) {
        stop(
            "Expected one phyloseq object in output/phyloseq.Rdata, found ",
            length(phyloseq_candidates)
        )
    }

    phyloseq_object <- get(phyloseq_candidates)
}

saveRDS(phyloseq_object, file = "output/phyloseq.rds")
