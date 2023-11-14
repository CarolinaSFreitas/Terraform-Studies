resource "local_file" "pet" {
    filename = "root/pets.txt"
    content = "Théo Meu Pet Favorito"
    file_permission = "0700"
}