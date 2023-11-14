resource "local_file" "pet" {
    filename = "carol/pets.txt"
    content = "Théo Meu Pet Favorito"
    file_permission = "0700"
}

resource "local_file" "theo" {
    filename = "carol/theo.txt"
    content = "Théo é o nome do meu cachorro :)"
    file_permission = "0700"
