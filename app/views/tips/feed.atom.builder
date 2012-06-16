atom_feed :language => 'en-US' do |feed|
  feed.title @title
  feed.updated @updated

  @tips.each do |tip|
    next if tip.updated_at.blank?

    feed.entry(tip) do |entry|
      entry.url tip_url(tip)
      entry.title 'Did you know?'
      entry.content tip.content
      entry.updated(tip.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ"))

      entry.author do |author|
        author.name tip.name.empty? ? tip.twitter_id : tip.name
      end
    end
  end
end
