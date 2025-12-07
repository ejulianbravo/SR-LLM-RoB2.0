assess_rob2_for_trial <- function(study_id,
                                  outcome,
                                  trial_text) {
  
  # Optional: truncate extremely long text to manage token limits
  max_chars <- 20000
  if (nchar(trial_text) > max_chars) {
    trial_text <- substr(trial_text, 1, max_chars)
  }
  
  # Extraction
  extraction_prompt <- build_extraction_prompt(trial_text)
  extraction_raw    <- call_llm(rob2_system_prompt, extraction_prompt)
  
  extraction_json <- tryCatch(
    fromJSON(extraction_raw),
    error = function(e) {
      warning("Failed to parse extraction JSON for study ", study_id, ": ", e$message)
      list(
        randomisation_and_allocation   = trial_text,
        cluster_recruitment_timing     = trial_text,
        blinding_and_deviations        = trial_text,
        attrition_and_missing_data     = trial_text,
        outcome_measurement            = trial_text,
        selective_reporting_indicators = trial_text
      )
    }
  )
  
  # Domains
  dom1a <- fromJSON(
    call_llm(rob2_system_prompt,
             build_domain1a_prompt(extraction_json$randomisation_and_allocation))
  )
  dom1b <- fromJSON(
    call_llm(rob2_system_prompt,
             build_domain1b_prompt(extraction_json$cluster_recruitment_timing))
  )
  dom2 <- fromJSON(
    call_llm(rob2_system_prompt,
             build_domain2_prompt(extraction_json$blinding_and_deviations))
  )
  dom3 <- fromJSON(
    call_llm(rob2_system_prompt,
             build_domain3_prompt(extraction_json$attrition_and_missing_data))
  )
  dom4 <- fromJSON(
    call_llm(rob2_system_prompt,
             build_domain4_prompt(extraction_json$outcome_measurement))
  )
  dom5 <- fromJSON(
    call_llm(rob2_system_prompt,
             build_domain5_prompt(extraction_json$selective_reporting_indicators))
  )
  
  domain_judgements <- c(
    dom1a$judgement,
    dom1b$judgement,
    dom2$judgement,
    dom3$judgement,
    dom4$judgement,
    dom5$judgement
  )
  
  overall <- overall_rob_from_domains(domain_judgements)
  
  list(
    study_id   = study_id,
    outcome    = outcome,
    extraction = extraction_json,
    domains    = list(
      d1a = dom1a,
      d1b = dom1b,
      d2  = dom2,
      d3  = dom3,
      d4  = dom4,
      d5  = dom5
    ),
    overall_rob = overall
  )
}
