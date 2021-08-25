def create_user(email, password, first_name, role)
  User.find_or_create_by(email: email) do |u|
    u.email = email
    u.password = password
    u.first_name = first_name
    u.last_name = "#{first_name}ov"
    u.nickname = first_name
    u.address = 'Belarus'
    u.date_of_birth = '1970-01-01'
    u.role = role
    u.avatar = File.open("public/images/#{role}_avatar.jpg")
    u.uid = ''
    u.provider = ''
    u.skip_confirmation!
  end
end

def create_article(title, category, tags, user)
  Article.find_or_create_by(title: title) do |a|
    a.title = title
    a.short_description = title
    a.body = title
    a.news_main_image = File.open("public/images/#{category}.jpg")
    a.category = category
    a.all_tags = tags
    a.region = 'Belarus'
    a.status = 'published'
    a.important = true
    a.user = user
  end
end

def create_comment(body, article, user)
  Comment.find_or_create_by(body: body) do |c|
    c.body = body
    c.user = user
    c.article = article
  end
end

def create_viewing(article, user)
  Viewing.find_or_create_by(user: user) do |v|
    v.view = true
    v.user = user
    v.article = article
  end
end

user = create_user('user@news.site', '123456',
                   'User', 'user')
correspondent = create_user('correspondent@news.site', '123456',
                            'Correspondent', 'correspondent')
redactor = create_user('redactor@news.site', '123456',
                       'Redactor', 'redactor')
admin = create_user('admin@news.site', '123456',
                    'Admin', 'admin')

people_article = create_article('The future of work after COVID-19',
                                'people',
                                'people, covid, work',
                                correspondent)
create_article('Five in 10 women want flexible job',
               'technology',
               'tech, job',
               correspondent)
create_article('Wonder Walls: From Olympic gold to a first pro win with Bora-Hansgrohe',
               'sport',
               'sport, bicycle',
               correspondent)
create_article('Mercedes to go all electric by 2030',
               'auto',
               'mercedes',
               correspondent)

create_viewing(people_article, user)
create_viewing(people_article, redactor)
create_viewing(people_article, admin)

create_comment('Wow!!!', people_article, user)
create_comment('Cool new', people_article, redactor)
create_comment('What is it?', people_article, admin)
