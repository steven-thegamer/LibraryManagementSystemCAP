using { my.library } from '../db/index.cds';

service libraryService {
  entity Books as projection on library.Books;
  entity Authors as projection on library.Authors;
}

