# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Bookmark.destroy_all
Kind.destroy_all
Category.destroy_all


#kinds
kind_video = Kind.create(name: "video")
kind_article = Kind.create(name: "article")
kind_paper = Kind.create(name: "paper")
kind_social_media = Kind.create(name: "social_media")
kind_picture = Kind.create(name: "picture")
p "Created #{Kind.count} kinds"
  
#categories
cat_animales = Category.create(name: "Animales", private: false)
cat_deportes = Category.create(name: "Deportes", private: false)
  
cat_animales_mamiferos = Category.create(name: "Mamiferos", private: false, category_id: cat_animales.id)
cat_animales_aves = Category.create(name: "Aves", private: false, category_id: cat_animales.id)
  
cat_deportes_acuaticos = Category.create(name: "Acuaticos", private: false, category_id: cat_deportes.id)
cat_deportes_extremos = Category.create(name: "Extremos", private: false, category_id: cat_deportes.id)
p "Created #{Category.count} categories"

array_animales = [cat_animales_mamiferos,cat_animales_aves]
array_deportes = [cat_deportes_acuaticos,cat_deportes_extremos]

i = 0
j = 0
tipos = [kind_video.id,kind_article.id,kind_paper.id,kind_social_media.id,kind_picture.id]
p tipos
categorias = [cat_animales_mamiferos.id,cat_animales_aves.id,cat_deportes_acuaticos.id,cat_deportes_extremos.id]
p categorias
#bookmarks
20.times do |index|
    i = rand(0..3)
    j = rand(0..4)
    tipo = tipos[j]
    categoria = categorias[i]
           
    Bookmark.create!(name: Faker::Internet.domain_word,
                  url: Faker::Internet.url,
                  category_id: categoria,
                  kind_id: tipo)
end
p "Created #{Bookmark.count} bookmarks"



