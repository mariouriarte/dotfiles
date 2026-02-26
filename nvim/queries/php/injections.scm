; extends
(heredoc
  (heredoc_start
    (heredoc_identifier) @injection.language (#eq? @injection.language "SQL"))
  (heredoc_body) @injection.content)

