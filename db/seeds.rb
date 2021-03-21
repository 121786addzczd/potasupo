User.create!(
  email: 'admin@example.com',
  password: 'aaaaaa',
  password_confirmation: 'aaaaaa',
  nickname: '管理者',
  profile: '管理者になります。',
  admin: true
)
user.image.attach(
  io: File.open(Rails.root.join('public/images/image1.jpg')),
  filename: 'image1.jpg'
)

user = User.create(
  email: "aya@aya.com",
  password: "aaaaaa",
  password_confirmation: "aaaaaa",
  nickname: "Aya",
  profile: "都内OLです。",
  admin: false
)
user.image.attach(
  io: File.open(Rails.root.join('public/images/dog.jpg')),
  filename: 'dog.jpg'
)

user = User.create(
  email: "akira@akira.com",
  password: "aaaaaa",
  password_confirmation: "aaaaaa",
  nickname: "Akira",
  profile: "趣味で筋トレしています！",
  admin: false
)
user.image.attach(
  io: File.open(Rails.root.join('public/images/kintore.jpg')),
  filename: 'kintore.jpg'
)

user = User.create(
  email: "kenta@kenta.com",
  password: "aaaaaa",
  password_confirmation: "aaaaaa",
  nickname: "健太",
  profile: "大学4年",
  admin: false
)
user.image.attach(
  io: File.open(Rails.root.join('public/images/cat.jpg')),
  filename: 'cat.jpg'
)

user = User.create(
  email: "next@next.com",
  password: "aaaaaa",
  password_confirmation: "aaaaaa",
  nickname: "NEXT",
  profile: "次にむけて",
  admin: false
)
user.image.attach(
  io: File.open(Rails.root.join('public/images/profile_default_img.jpg')),
  filename: 'profile_default_img.jpg'
)

