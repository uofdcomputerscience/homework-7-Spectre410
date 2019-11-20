import Foundation
import PlaygroundSupport
// For this homework project, we'll be connecting to the "TLDR" server
// to add a few books. The first thing you need to do is create an object
// that we'll upload to the server.

// MARK: - STEP ONE

// Implement a struct that defines a book. A book consists of the following
// items:
// A title, which is a string
// An author, which is a string
// The publication year, as a string (because dates are hard)
// A string for the URL for an image for the book cover
//
struct Book: Codable {
    let id: Int?
    let title: String
    let author: String
    let published: String
    let imageURLString: String
}
// Remember that this structure needs to conform to the `Encodable` protocol.
// Using `Codable` more generally will be useful, as by doing this you'll
// be able to reuse this struct in Project Three.

// MARK: - STEP TWO

// Once you've defined this structure, you'll need to define a couple of
// book objects that you can insert into the database. In order or us to
// have an amusing dataset to work with, each student is requested to
// create five different books for this database.
var books: [Book] = []
let book1 = Book(id: nil, title: "Ranger's Apprentice The Ruins of Gorlan", author: "John Flanagan", published: "June 8, 2006", imageURLString: "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1293952830l/60400.jpg")
let book2 = Book(id: nil, title: "The Roar", author: "Emma Clayton", published: "January 1, 2008", imageURLString: "https://upload.wikimedia.org/wikipedia/en/d/dc/The_Roar_Emma_Clayton.jpg")
let book3 = Book(id: nil, title: "The Whisper", author: "Emma Clayton", published: "Feburary 1, 2012", imageURLString: "https://upload.wikimedia.org/wikipedia/en/c/c7/The_Whisper_Book_Cover.jpg")
let book4 = Book(id: nil, title: "Jedi Under Siege", author: "Kevin J. Anderson", published: "June 1, 1998 ", imageURLString: "https://images-na.ssl-images-amazon.com/images/I/717QSWKME2L._SX288_BO1,204,203,200_.gif")
let book5 = Book(id: nil, title: "Star Wars Episode 2: Attack of the Clones", author: "R.A. Salvatore", published: "April 23, 2002", imageURLString: "https://upload.wikimedia.org/wikipedia/en/5/5d/Attackoftheclones_novel.jpg")


books.append(book1)
books.append(book2)
books.append(book3)
books.append(book4)
books.append(book5)
// MARK: - STEP THREE

// Now we need to publish this data to the server.

let url = URL(string: "https://uofd-tldrserver-develop.vapor.cloud/books")
// Create a URL to connect to the server. Its address is:
//      https://uofd-tldrserver-develop.vapor.cloud/books

// Create a URL request to publish the information, based upon the URL you
// just created.
for book in books {
    var request = URLRequest(url: url!)
    request.httpBody = try? JSONEncoder().encode(book)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpMethod = "POST"
    
    let task = URLSession(configuration: .ephemeral).dataTask(with: request)
    task.resume()
}
// Add the body to the URL request you just created, by using JSONEncoder.

// Add a "Content-Type" : "application/json" header to your request, so that
// the server will properly understand the body of your request.

// Set the method of the request to "POST", because we're providing information
// rather than retrieving it.

// Create a data task for publishing this element, and kick it off with a resume().

// MARK: - HELPFUL HINTS
// You might want to create a method for publishing the data, so that you
// can effectively loop over an array of books.
//
// If you visit the URL for the service in a 'GET' request, it will return a
// list of books to you. We'll be using this list of books for Project Three.
