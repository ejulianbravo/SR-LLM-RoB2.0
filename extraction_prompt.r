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
Participants were allocated using an adaptive randomization method in a 1:1 ratio to either group using an automated program implemented in R, version 4.3.0, with a custom script by a blinded allocation manager (S.T.). This adaptive approach used weighting for between-group matching of key baseline characteristics, including the number of participants, mean age, variance of age, mean MADRS score, variance of MADRS score, and number of female participants. Information regarding the allocated group was conveyed to the treatment personnel prior to the start of maintenance treatment. All other involved parties, including outcome raters, were blinded to the treatment allocation throughout the study.
  )
}
