Ransack.configure do |config|
  # tokenize検索 (AND/OR)
  config.add_predicate 'contains_all',
         arel_predicate: 'matches_all',
         formatter: ->(v){ v.split(/[\p{blank}\p{cntrl}\p{punct}\s、・]+/).compact.map {|s| "%#{Ransack::Constants.escape_wildcards(s)}%" } },
         type: :string,
         compounds: false
  config.add_predicate 'contains_any',
         arel_predicate: 'matches_any',
         formatter: ->(v){ v.split(/[\p{blank}\p{cntrl}\p{punct}\s、・]+/).compact.map {|s| "%#{Ransack::Constants.escape_wildcards(s)}%" } },
         type: :string,
         compounds: false
end
