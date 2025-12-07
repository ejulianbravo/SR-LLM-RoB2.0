build_extraction_prompt <- function(trial_text) {
  sprintf("
Extract from the trial report only the information relevant to risk-of-bias
assessment in cluster-randomised, parallel-group trials.

Using only the information in the text, produce JSON with this structure:

{
  \"randomisation_and_allocation\": \"...\",
  \"cluster_recruitment_timing\": \"...\",
  \"blinding_and_deviations\": \"...\",
  \"attrition_and_missing_data\": \"...\",
  \"outcome_measurement\": \"...\",
  \"selective_reporting_indicators\": \"...\"
}

Each field should be a concise paragraph (<= 200 words), paraphrasing or quoting
relevant parts. If there is no information for a field, write \"No information reported\".

Trial text:
\"\"\"%s\"\"\"",
          trial_text
  )
}
