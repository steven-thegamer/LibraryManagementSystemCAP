namespace my.library;

using { managed } from '@sap/cds/common';
using { my.dictionary } from '../dictionary/elements';
using { my.library.Books } from './books';
using { my.library.Users } from './users';

entity BookTransactions : managed {
  key ID: dictionary.ID;
  book: Association to many Books on book.ID = $self.ID;
  user: Association to many Users on user.ID = $self.ID;
  borrowDate: dictionary.borrowDate;
  returnDate: dictionary.returnDate;
}

