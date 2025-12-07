build_domain1a_prompt <- function(text_block) {
  sprintf("
Using the RoB 2.0 cluster-randomised rules, evaluate Domain 1a:
Bias arising from the randomisation process.

Use ONLY the information in the text below.

Return JSON:

{
  \"domain\": \"1a_randomisation_process\",
  \"signalling_questions\": {
    \"1a.1\": \"\",
    \"1a.2\": \"\",
    \"1a.3\": \"\"
  },
  \"judgement\": \"\",
  \"rationale\": \"\"
}

Where:
- 1a.1: Was the allocation sequence random?
- 1a.2: Was the allocation sequence concealed until clusters were enrolled and assigned?
- 1a.3: Did baseline cluster/participant characteristics suggest successful randomisation?

Use only: Y, PY, PN, N, NI.

Text:
\"\"\"%s\"\"\"",
          text_block
  )
}

build_domain1b_prompt <- function(text_block) {
  sprintf("
Evaluate Domain 1b: Bias from timing of identification and recruitment of participants
in a cluster-randomised trial.

Use ONLY the information in the text below.

Return JSON:

{
  \"domain\": \"1b_timing_of_identification_recruitment\",
  \"signalling_questions\": {
    \"1b.1\": \"\",
    \"1b.2\": \"\",
    \"1b.3\": \"\"
  },
  \"judgement\": \"\",
  \"rationale\": \"\"
}

Where:
- 1b.1: Were all participants identified before randomisation of clusters?
- 1b.2: If not, could knowledge of cluster assignment influence participant recruitment?
- 1b.3: Is there baseline imbalance consistent with biased recruitment?

Use Y, PY, PN, N, NI.

Text:
\"\"\"%s\"\"\"",
          text_block
  )
}

build_domain2_prompt <- function(text_block) {
  sprintf("
Evaluate Domain 2: Bias due to deviations from intended interventions.

Use ONLY the information in the text below.

Return JSON:

{
  \"domain\": \"2_deviations_from_intended_interventions\",
  \"signalling_questions\": {
    \"2.1\": \"\",
    \"2.2\": \"\",
    \"2.3\": \"\",
    \"2.4\": \"\",
    \"2.5\": \"\"
  },
  \"judgement\": \"\",
  \"rationale\": \"\"
}

Where (generic RoB 2 wording):
- 2.1: Were participants aware of their assigned intervention?
- 2.2: Were caregivers or personnel aware?
- 2.3: Were there deviations from intended intervention that arose because of the experimental context?
- 2.4: Were these deviations likely to have affected the outcome, and were they unbalanced between groups?
- 2.5: Was the analysis appropriate to estimate the effect of assignment (e.g. intention-to-treat)?

Use Y, PY, PN, N, NI.

Text:
\"\"\"%s\"\"\"",
          text_block
  )
}

build_domain3_prompt <- function(text_block) {
  sprintf("
Evaluate Domain 3: Bias due to missing outcome data.

Use ONLY the information in the text below.

Return JSON:

{
  \"domain\": \"3_missing_outcome_data\",
  \"signalling_questions\": {
    \"3.1\": \"\",
    \"3.2\": \"\",
    \"3.3\": \"\"
  },
  \"judgement\": \"\",
  \"rationale\": \"\"
}

Where:
- 3.1: Is the proportion of missing outcome data low?
- 3.2: Is missingness of the outcome data unlikely to depend on its true value?
- 3.3: Were appropriate methods used to handle missing data?

Use Y, PY, PN, N, NI.

Text:
\"\"\"%s\"\"\"",
          text_block
  )
}

build_domain4_prompt <- function(text_block) {
  sprintf("
Evaluate Domain 4: Bias in measurement of the outcome.

Use ONLY the information in the text below.

Return JSON:

{
  \"domain\": \"4_measurement_of_outcome\",
  \"signalling_questions\": {
    \"4.1\": \"\",
    \"4.2\": \"\",
    \"4.3\": \"\",
    \"4.4\": \"\"
  },
  \"judgement\": \"\",
  \"rationale\": \"\"
}

Where:
- 4.1: Was the method of measuring the outcome appropriate?
- 4.2: Could measurement or ascertainment of the outcome have differed between intervention groups?
- 4.3: Were outcome assessors aware of the intervention received by participants?
- 4.4: Could assessment of the outcome have been influenced by knowledge of intervention received?

Use Y, PY, PN, N, NI.

Text:
\"\"\"%s\"\"\"",
          text_block
  )
}

build_domain5_prompt <- function(text_block) {
  sprintf("
Evaluate Domain 5: Bias in selection of the reported result.

Use ONLY the information in the text below, which may include trial registry or protocol information if provided.

Return JSON:

{
  \"domain\": \"5_selection_of_reported_result\",
  \"signalling_questions\": {
    \"5.1\": \"\",
    \"5.2\": \"\",
    \"5.3\": \"\"
  },
  \"judgement\": \"\",
  \"rationale\": \"\"
}

Where:
- 5.1: Is the reported analysis for the outcome consistent with a prespecified analysis plan?
- 5.2: Are all prespecified outcomes for this domain reported?
- 5.3: Is there evidence of selective reporting of analyses or outcomes?

Use Y, PY, PN, N, NI.

Text:
\"\"\"%s\"\"\"",
          text_block
  )
}
