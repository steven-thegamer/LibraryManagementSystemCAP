namespace my.library;

using { managed } from '@sap/cds/common';
using { my.dictionary } from '../dictionary/elements';
using { my.library.Books, my.library.Users } from './_index';

entity BookTransactions : managed {
  key ID: dictionary.ID;
  book: Association to many Books on book.ID = $self.ID;
  user: Association to Users;
  borrowDate: dictionary.borrowDate;
  returnDate: dictionary.returnDate;
}

