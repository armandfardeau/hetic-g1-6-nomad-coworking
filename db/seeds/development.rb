images_seeds_path = Pathname('db/seeds/images_seeds')
user_zero = User.create! fullname: 'Armand Fardeau',
                         avatar: File.new(Rails.root.join(images_seeds_path, 'armand_fardeau.jpg')),
                         email: 'fardeauarmand@gmail.com',
                         phone_number: '0147498143',
                         password: 'adminadmin',
                         password_confirmation: 'adminadmin'

room_zero = Room.create! home_type: 'Breakfast',
                         room_type: 'apartment',
                         accommodate: 4,
                         bed_room: 1,
                         bath_room: 1,
                         listing_name: 'Lovely flat',
                         summary: 'A lovely place in the suburb',
                         address: '6 villa des nympheas 75020 Paris',
                         is_wifi: true,
                         is_tv: false,
                         is_closet: true,
                         is_shampoo: true,
                         is_breakfast: true,
                         is_heating: true,
                         is_air: false,
                         is_kitchen: true,
                         price: 120,
                         active: true,
                         user_id: user_zero.id
room_zero.photos.create(image: File.new(Rails.root.join(images_seeds_path, 'apartment1.jpg')))
