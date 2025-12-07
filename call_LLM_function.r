call_llm <- function(system_prompt, user_prompt,
                     model = model_id,
                     temperature = 0) {
  req <- request(api_url) |>
    req_auth_bearer_token(api_key) |>
    req_body_json(list(
      model = model,
      messages = list(
        list(role = "system", content = system_prompt),
        list(role = "user",   content = user_prompt)
      ),
      temperature = temperature
    ))
  
  resp <- req_perform(req)
  cont <- resp_body_json(resp, simplifyVector = FALSE)
  
  # Basic safety checks
  if (!is.null(cont$error)) {
    stop(paste("LLM API error:", cont$error$message))
  }
  
  out <- cont$choices[[1]]$message$content
  out
}
