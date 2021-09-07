# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
Producer.create!(
  company_name: '株式会社ファーマーズ',
  last_name: '農家',
  first_name: '太郎',
  last_name_kana: 'ノウカ',
  first_name_kana: 'タロウ',
  postal_code: '0000000',
  address: '北海道富良野1−1−1',
  phone_number: '00000000000',
  introduction: '美味しい野菜をお届けします',
  is_permitted: 'true',
  email: '000@000',
  password: '000000',
  password_confirmation: '000000'
) if Rails.env.development?
Customer.create!(
  last_name: '鈴木',
  first_name: '雅人',
  last_name_kana: 'スズキ',
  first_name_kana: 'マサト',
  postal_code: '0000000',
  address: '愛知県名古屋市1−1−1',
  phone_number: '00000000000',
  is_deleted: 'false',
  email: '000@000',
  password: '000000',
  password_confirmation: '000000'
) if Rails.env.development?