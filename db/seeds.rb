require 'faker'

urls = [
        "http://youtu.be/hXlzci1rKNM",
        "http://youtu.be/puSkP3uym5k",
        "http://youtu.be/YPYGeELPpno",
        "http://youtu.be/ub26kLEfphw",
        "http://youtu.be/sUlfGOezE48",
        "http://youtu.be/wphB0fq4PlA",
        "https://www.youtube.com/watch?v=uXMuWi0dUBc",
        "https://www.youtube.com/watch?v=-Ow8Gut-4XY",
        "https://www.youtube.com/watch?v=wphB0fq4PlA",
        "https://www.youtube.com/watch?v=uue6oJ_jDns",
        "https://www.youtube.com/watch?v=JlfsXd62Qss",
        "https://www.youtube.com/watch?v=szeq1M0_7PQ",
        "https://www.youtube.com/watch?v=rLGpdkYEwrw",
        "http://www.youtube.com/watch?v=jEA9aG0UNVA"
      ]

descriptions = [
        "juggler in the streets of bangkok",
        "fire eating while break dancing",
        "guitarist tribute to radiohead",
        "ukulele orchestra of great britain",
        "twerking on the streets of san francisco",
        "bongos and maracas at a carnival",
        "salsa dancing in rio",
        "glitter fight visual art installation",
        "dots: a graffiti retrospective on the sidewalk",
        "sick skateboarding skillz",
        "comedian slays street audience in nyc, hilarious",
        "kermit the frog costumed dancer",
        "sitar savant",
        "jingle bells rendition of 90s pop music"
      ]



30.times do
  first_name = Faker::Name.first_name
  User.create(
    email: Faker::Internet.email,
    first_name: first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "password",
    password_confirmation: "password",
    stage_name: first_name,
    twitter_handle: Faker::Lorem.word,
    verified: false,
    tagline: Faker::Lorem.sentence,
    city: Faker::Address.city,
    state: Faker::Address.state,
    country: Faker::Address.country,
    category: "acrobatic",
    story: Faker::Lorem.paragraph,
    featured_youtube_url: urls.sample
    )
end

User.all.each do |user|
  4.times do
    user.posts.create(
      title: descriptions.sample.split(' ').first(4).join(' '),
      youtube_url: urls.sample,
      description: descriptions.sample,
      hype: rand(1..100)
      )
  end
end
