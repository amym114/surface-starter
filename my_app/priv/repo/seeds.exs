# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     MyApp.Repo.insert!(%MyApp.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

MyApp.Repo.insert!(%MyApp.Contacts.Contact{
    name: "Seeded Name",
    email: "seed@emailaddress.com",
    phone: "123-456-7890"}
  )
