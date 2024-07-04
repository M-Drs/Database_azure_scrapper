from sqlalchemy import Column, Integer, String, create_engine
from sqlalchemy.orm import sessionmaker, declarative_base 
import csv
import os
from dotenv import load_dotenv

load_dotenv()

Base = declarative_base()

class Book(Base):
    __tablename__ = 'books'
    id = Column(Integer, primary_key=True, autoincrement=True)
    ISBN = Column(String, unique=True, nullable=False)
    Book_Title = Column(String, nullable=False)
    Book_Author = Column(String, nullable=False)
    Year_Of_Publication = Column(Integer, nullable=False)
    Publisher = Column(String, nullable=False)
    Image_URL_S = Column(String)
    Image_URL_M = Column(String)
    Image_URL_L = Column(String)

POSTGRES_URL = os.getenv('POSTGRES_URL')
print(POSTGRES_URL)
# Configuration de la base de données
engine = create_engine(POSTGRES_URL)
Base.metadata.create_all(engine)

Session = sessionmaker(bind=engine)
session = Session()

def import_books_from_csv(csv_file_path):
    with open(csv_file_path, newline='', encoding='ISO-8859-1') as csvfile:
        csvreader =  csv.DictReader(csvfile, delimiter=';', quotechar='"', escapechar='\\')
        for row in csvreader:
            book = Book(
                ISBN=row['ISBN'],
                Book_Title=row['Book-Title'],
                Book_Author=row['Book-Author'],
                Year_Of_Publication=int(row['Year-Of-Publication']),
                Publisher=row['Publisher'],
                Image_URL_S=row['Image-URL-S'],
                Image_URL_M=row['Image-URL-M'],
                Image_URL_L=row['Image-URL-L']
            )
            session.add(book)
        session.commit()

if __name__ == '__main__':
    # Chemin vers le fichier CSV
    csv_file_path = 'data/books.csv'
    # import_books_from_csv(csv_file_path)
