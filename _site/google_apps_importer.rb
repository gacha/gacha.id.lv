require 'csv'
require 'activesupport'

# articles
CSV.foreach("/home/gatis/Code/java/Blog/articles.csv", :skip_blanks => true, :headers => true) do |row|
  body,create_date,author,title,tags,render_as,key,is_public,enable_comments,slug = row.to_a.collect{|item| item.last}
  extension = render_as == 'markdown' ? 'md' : 'html'
  date = Time.parse(create_date).strftime("%Y-%m-%d") rescue nil
  if date
    filename = "_posts/#{date}-#{slug}.#{extension}"
    f = File.open(filename,'w+')
    f.write <<-eos
---
layout: post
title: #{title}
categories: []
tags: #{eval(tags.gsub("u'","'").gsub("'",'"'))}
is_public: #{is_public}
enable_comments: #{enable_comments}
---
{% include JB/setup %}
    eos
    f.write body
    f.close
    puts "[write] #{filename}"
  end
end