include ActiveSupport

namespace :data do
  desc 'Populate DB with users and answers'
  task populate: :environment do
    puts "#{'*' * `tput cols`.to_i}\nChecking Environment... The database will be cleared of all content before populating.\n#{'*' * `tput cols`.to_i}"
    # Removes content before populating with data to avoid duplication
    Rake::Task['db:reset'].invoke

    # INSERT BELOW

    time_zones = ['Asia/Almaty', 'Asia/Baghdad', 'Asia/Baku', 'Asia/Bangkok', 'Asia/Chongqing', 'Asia/Colombo', 'Asia/Dhaka', 'Asia/Hong_Kong', 'Asia/Irkutsk',
                  'Asia/Jakarta', 'Asia/Jerusalem', 'Asia/Kabul', 'Asia/Kamchatka', 'Asia/Karachi', 'Asia/Kathmandu', 'Asia/Kolkata', 'Asia/Krasnoyarsk',
                  'Asia/Kuala_Lumpur', 'Asia/Kuwait', 'Asia/Magadan', 'Asia/Muscat', 'Asia/Novosibirsk', 'Asia/Rangoon', 'Asia/Riyadh', 'Asia/Seoul',
                  'Asia/Shanghai', 'Asia/Singapore', 'Asia/Taipei', 'Asia/Tashkent', 'Asia/Tbilisi', 'Asia/Tehran', 'Asia/Tokyo', 'Asia/Ulaanbaatar',
                  'Asia/Urumqi', 'Asia/Vladivostok', 'Asia/Yakutsk', 'Asia/Yekaterinburg', 'Asia/Yerevan', 'Europe/Amsterdam', 'Europe/Athens', 'Europe/Belgrade',
                  'Europe/Berlin', 'Europe/Bratislava', 'Europe/Brussels', 'Europe/Bucharest', 'Europe/Budapest', 'Europe/Copenhagen', 'Europe/Dublin',
                  'Europe/Helsinki', 'Europe/Istanbul', 'Europe/Kiev', 'Europe/Lisbon', 'Europe/Ljubljana', 'Europe/London', 'Europe/Madrid', 'Europe/Minsk',
                  'Europe/Moscow', 'Europe/Paris', 'Europe/Prague', 'Europe/Riga', 'Europe/Rome', 'Europe/Sarajevo', 'Europe/Skopje', 'Europe/Sofia',
                  'Europe/Stockholm', 'Europe/Tallinn', 'Europe/Vienna', 'Europe/Vilnius', 'Europe/Warsaw', 'Europe/Zagreb'] + TimeZone.us_zones.map(&:name)

    time_rand = Time.at((Time.now - 6.month) + rand * (Time.now.to_f - (Time.now - 6.month).to_f))

    10.times { User.create!(name: Faker::Name.name, timezone: time_zones.sample) }

    User.all.each do |user|
      10.times { Answer.create!(user_id: user.id, correct: Faker::Boolean.boolean, created_at: time_rand) }
    end

    # INSERT ABOVE

    puts "#{'*' * `tput cols`.to_i}\nThe database has been populated!\n#{'*' * `tput cols`.to_i}"
  end
end
