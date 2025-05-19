using { my.library } from '../db/index.cds';

service libraryService {
  entity Books as projection on library.Books;
  entity Authors as projection on library.Authors;
  entity Publishers as projection on library.Publishers;
  entity Categories as projection on library.Categories;
}

