from script_sqlalchemy import Book, session

def add_book_manually(isbn, title, author, year, publisher, image_url_s=None, image_url_m=None, image_url_l=None):
    book = Book(
        ISBN=isbn,
        Book_Title=title,
        Book_Author=author,
        Year_Of_Publication=year,
        Publisher=publisher,
        Image_URL_S=image_url_s,
        Image_URL_M=image_url_m,
        Image_URL_L=image_url_l
    )
    session.add(book)
    session.commit()
    print(f"Book '{title}' added successfully.")

def count_books_published_in_year(year):
    count = session.query(Book).filter(Book.Year_Of_Publication == year).count()
    return count


# Ajouter manuellement un nouveau livre
add_book_manually(
    isbn='1234567890',
    title='New Book Title',
    author='New Book Author',
    year=2020,
    publisher='New Book Publisher',
    image_url_s='http://example.com/s.jpg',
    image_url_m='http://example.com/m.jpg',
    image_url_l='http://example.com/l.jpg'
)

# Compter le nombre de livres publiés en 2000
count_2000 = count_books_published_in_year(2000)
print(f"Number of books published in 2000: {count_2000}")