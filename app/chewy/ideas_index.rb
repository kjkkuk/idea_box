# frozen_string_literal: true

# class IdeasIndex < Chewy::Index
#   settings analysis: {
#     filter: {
#       edge_n_gram_filter: {
#         type: 'ngram',
#         min_gram: 3,
#         max_gram: 10,
#         token_chars: %w(
#           letter
#           digit
#         )
#       },
#       synonym_filter: {
#         type: 'synonym',
#         synonyms: [
#           'project, idea',
#           'startup, idea',
#           'here, europe',
#           'abcd, devo',
#           'apple, idea'
#         ]
#       },
#       word_delimeter_filter: {
#         type: 'word_delimiter',
#         generate_word_parts: true,
#         generate_number_parts: true,
#         catenate_words: true,
#         catenate_numbers: true,
#         catenate_all: true,
#         split_on_case_change: true,
#         preserve_original: true,
#         stem_english_possessive: true
#       },
#       snowball_filter: {
#         type: 'snowball',
#         language: 'english'
#       }
#     },
#     analyzer: {
#       autocomplete_edge_n_gram_analyzer: {
#         tokenizer: 'whitespace',
#         filter: %w(lowercase edge_n_gram_filter)
#       },
#       autcomplete_synonym_analyzer: {
#         tokenizer: 'whitespace',
#         filter: %w(lowercase synonym_filter)
#       },
#       autocomplete_word_delimiter_analyzer: {
#         tokenizer: 'whitespace',
#         filter: %w(lowercase synonym_filter)
#       },
#       lower_keyword_autocomplete: {
#         tokenizer: 'keyword',
#         filter: ['lowercase']
#       },
#       snowball_analyzer: {
#         tokenizer: 'whitespace',
#         filter: ['snowball_filter']
#       }
#     }
#   }
#   define_type Idea.all.includes(:team) do
#     field :idea_name, type: 'text',
#                       fields: { snowball_analyzed: { type: 'text', analyzer: 'snowball_analyzer', search_analyzer: 'standard' }, fuzzy_analyzed: { type: 'text', analyzer: 'autocomplete_edge_n_gram_analyzer', search_analyzer: 'standard' }, lower_keyword_analyzed: { type: 'text', analyzer: 'lower_keyword_autocomplete' }, standard_analyzed: { type: 'text', analyzer: 'standard' }, synonym_analyzed: { type: 'text', analyzer: 'autcomplete_synonym_analyzer' }, edge_n_gram_analyzed: { type: 'text', analyzer: 'autocomplete_edge_n_gram_analyzer' }, word_delimiter_analyzed: { type: 'text', analyzer: 'autocomplete_word_delimiter_analyzer' } }
#     field :idea_description, type: 'keyword'
#     field :teams_id, value: ->(idea) { idea.teams_id.team_name }, analyzer: 'lower_keyword_autocomplete'
#     field :created, type: 'date', value: -> { created_at }
#   end
# end
