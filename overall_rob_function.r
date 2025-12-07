overall_rob_from_domains <- function(domain_judgements) {
  # domain_judgements: character vector (e.g. c("Low risk", "Some concerns", "High risk", ...))
  dom <- tolower(domain_judgements)
  
  if (any(dom == "high risk")) {
    overall <- "High"
  } else if (all(dom == "low risk")) {
    overall <- "Low"
  } else {
    overall <- "Some concerns"
  }
  
  overall
}
