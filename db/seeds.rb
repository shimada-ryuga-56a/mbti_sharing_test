# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Mbti.create!(
  [
    {name: 'INTJ（建築家）'},
    {name: 'INTP（論理学者）'},
    {name: 'ENTJ（指揮官）'},
    {name: 'ENTP（討論者）'},
    {name: 'INFJ（提唱者）'},
    {name: 'INFP（仲介者）'},
    {name: 'ENFJ（主人公）'},
    {name: 'ENFP（運動家）'},
    {name: 'ISTJ（管理者）'},
    {name: 'ISFJ（擁護者）'},
    {name: 'ESTJ（幹部）'},
    {name: 'ESFJ（領事）'},
    {name: 'ISTP（巨匠）'},
    {name: 'ISFP（冒険家）'},
    {name: 'ESFP（エンターテイナー）'},
    {name: 'ESTP（起業家）'}
  ]
)