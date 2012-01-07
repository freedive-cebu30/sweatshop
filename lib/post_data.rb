# -*- encoding: UTF-8 -*-
class PostData
  def self.start
    Twitter.configure do |config|
      config.consumer_key = 'eExYoTHD3JVAWfY3npkDA'
      config.consumer_secret = 'DdCrqwHmrhdwxNZFAS4YXBxbfUcWEvMelXlKKVZrMOc'
      config.oauth_token = '453362817-0fvyVx93sH06oaDxmQ3hRTrdO6xkJUwvR0rxkZi1'
      config.oauth_token_secret = 'jvKGlrOIAHikphTB3eGqiTtN3FYLIOtgIeKnwc5peI'
    end
    @companies = Company.select('name')
                        .order('created_at DESC')
                        .limit('10')
    post_text = "最近登録された会社:"
    i = 0
    @companies.each do |company|
      if i == 0
        post_text = post_text + company.name
      else
        post_text = post_text +"、"+ company.name
      end
      i = i + 1
    end
    Twitter.update(post_text)
    
    post_text = "最近コメント数が多い会社1:"
    i = 0
    @companies2 = Company.joins(:comments)
                    .select('companies.name AS company_name')
                    .select('COUNT(comments.id) as count_comments')
                    .group('companies.name,companies.id')
                    .having('COUNT(comments.id) > 0')
                    .order('COUNT(comments.id) DESC')
                    .limit('7')

    @companies2.each do |company|
      if i == 0
        post_text = post_text + company.company_name+":"+company.count_comments+"件"
      else
        post_text = post_text +"、"+ company.company_name+":"+company.count_comments+"件"
      end
      i = i + 1
    end
    Twitter.update(post_text)
=begin
    post_text = "最近コメント数が多い会社2:"
    i = 0
    @companies2 = Company.joins(:comments)
                    .select('companies.name AS company_name')
                    .select('COUNT(comments.id) as count_comments')
                    .group('companies.name,companies.id')
                    .having('COUNT(comments.id) > 0')
                    .order('COUNT(comments.id) DESC')
                    .limit('7').offset('7')

    @companies2.each do |company|
      if i == 0
        post_text = post_text + company.company_name+":"+company.count_comments+"件"
      else
        post_text = post_text +"、"+ company.company_name+":"+company.count_comments+"件"
      end
      i = i + 1
    end
    Twitter.update(post_text)
=end
=begin
    post_text = "最近コメント数が多い会社1:"
    i = 0
    @companies2 = Company.joins(:comments)
                    .select('companies.name AS company_name')
                    .select('COUNT(comments.id) as count_comments')
                    .where(['comments.created_at > ?',Time.now-3600*24*30])
                    .group('companies.name,companies.id')
                    .having('COUNT(comments.id) > 0')
                    .order('COUNT(comments.id) DESC')
                    .limit('7')

    @companies2.each do |company|
      if i == 0
        post_text = post_text + company.company_name+":"+company.count_comments+"件"
      else
        post_text = post_text +"、"+ company.company_name+":"+company.count_comments+"件"
      end
      i = i + 1
    end
    Twitter.update(post_text)
    
    post_text = "最近コメント数が多い会社2:"
    i = 0
    @companies2 = Company.joins(:comments)
                    .select('companies.name AS company_name')
                    .select('COUNT(comments.id) as count_comments')
                    .where(['comments.created_at > ?',Time.now-3600*24*30])
                    .group('companies.name,companies.id')
                    .having('COUNT(comments.id) > 0')
                    .order('COUNT(comments.id) DESC')
                    .limit('7').offset('7')

    @companies2.each do |company|
      if i == 0
        post_text = post_text + company.company_name+":"+company.count_comments+"件"
      else
        post_text = post_text +"、"+ company.company_name+":"+company.count_comments+"件"
      end
      i = i + 1
    end
    Twitter.update(post_text)
=end
  end
end